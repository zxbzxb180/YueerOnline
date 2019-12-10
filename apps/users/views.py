import json
from pure_pagination import PageNotAnInteger, Paginator, EmptyPage

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.hashers import make_password
from django.views.generic.base import View
from django.http import HttpResponse, HttpResponseRedirect

from utils.email_send import send_register_email
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm, UploadImageForm, UserInfoForm
from .models import UserProfile, EmailVerifyRecord, Banner
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from courses.models import Course
from utils.mixin_utils import LoginRequiredMixin
# Create your views here.


#自定义账号验证逻辑
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class RegisterView(View):
    """用户注册"""
    def get(self, request):
        all_banners = Banner.objects.all().order_by('index')
        register_form = RegisterForm()
        return render(request, 'register.html', {
            'register_form': register_form,
            'all_banners': all_banners,
        })

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', '')
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '用户名已被注册！'})
            pass_word = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.password = make_password(password=pass_word)
            user_profile.is_active = False

            # 写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = '欢迎注册悦耳在线网'
            user_message.save()

            user_profile.save()
            send_register_email(user_name, 'register')
            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form': register_form})


class ActiveUserView(View):
    def get(self, request, active_code):
        all_record = EmailVerifyRecord.objects.filter(code=active_code)#active_code有可能重复，因为是随机生成
        if all_record:
            for record in all_record:
                if record.is_used is False:
                    email = record.email
                    user = UserProfile.objects.get(email=email)
                    user.is_active = True
                    user.save()
                    record = EmailVerifyRecord.objects.get(email=email, send_type='register', is_used=0)
                    record.is_used = True
                    record.save()
                    return render(request, 'login.html')
            return render(request, 'active_fail.html')
        else:
            return render(request, 'active_fail.html')


class LoginView(View):
    def get(self, request):
        all_banners = Banner.objects.all().order_by('index')
        return render(request, 'login.html', {
            'all_banners': all_banners,
        })

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            # 用authenticate方法验证
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    # 导入把 url名字 反写成 url 的函数reverse
                    from django.core.urlresolvers import reverse
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html', {'msg': '用户尚未激活，请点击邮件激活链接！'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码输入错误！'})
        else:
            return render(request, 'login.html', {'login_form': login_form})


class LogoutView(View):
    """退出登录"""
    def get(self, request):
        logout(request)
        # 导入把 url名字 反写成 url 的函数reverse
        from django.core.urlresolvers import reverse
        return HttpResponseRedirect(reverse('index'))


class ForgetPwdView(View):
    """
    忘记密码
    """
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {'forget_form': forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', '')
            send_register_email(email, 'forget')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form})


class ResetView(View):
    def get(self, request, reset_code):
        all_record = EmailVerifyRecord.objects.filter(code=reset_code)  # reset_code有可能重复，因为是随机生成
        if all_record:
            for record in all_record:
                if record.is_used is False:
                    email = record.email
                    return render(request, 'password_reset.html', {"email": email})
            return render(request, 'active_fail.html')
        else:
            return render(request, 'active_fail.html')


class ModifyPwdView(View):
    """
    忘记密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {"email": email, 'msg': '两次密码输入不一致！'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            record = EmailVerifyRecord.objects.get(email=email, send_type='forget', is_used=0)
            record.is_used = True
            record.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email': email, 'modify_form': modify_form})


class UserinfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """
    def get(self, request):
        return render(request, 'usercenter-info.html', {})

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type="application/json")



class UploadImageView(LoginRequiredMixin, View):
    """
    用户头像上传
    """
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            # image = image_form.cleaned_data['image']
            # request.user.image = image
            # request.user.save()
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class UpdatePwdView(View):
    """
    在个人中心修改密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')

            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"两次输入密码不一致！"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type="application/json")


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送修改邮箱需要的验证码
    """
    def get(self, request):
        email = request.GET.get('email', '')
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在！"}', content_type='application/json')
        send_register_email(email, 'update_email')
        return HttpResponse('{"status":"success"}', content_type="application/json")


class UpdateEmailView(LoginRequiredMixin, View):
    """
    更新邮箱
    """
    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('email_code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email', is_used=0)
        if existed_records:
            request.user.email = email
            request.user.save()
            record = EmailVerifyRecord.objects.get(email=email, code=code, send_type='update_email', is_used=0)
            record.is_used = True
            record.save()
            return HttpResponse('{"status":"success"}', content_type="application/json")
        else:
            return HttpResponse('{"email_code":"验证码有误！"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin, View):
    """
    我的课程页面
    """
    def get(self, request):
        all_courses = UserCourse.objects.filter(user=request.user)
        return render(request, 'usercenter-mycourse.html', {
            'all_courses': all_courses,
        })


class MyFavOrgView(LoginRequiredMixin, View):
    """
    我的收藏————课程机构
    """
    def get(self,request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, 'usercenter-fav-org.html', {
            'org_list': org_list
        })


class MyFavTeacherView(LoginRequiredMixin, View):
    """
    我的收藏————课程讲师
    """
    def get(self,request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, 'usercenter-fav-teacher.html', {
            'teacher_list': teacher_list
        })


class MyFavCourseView(LoginRequiredMixin, View):
    """
    我的收藏————课程
    """
    def get(self,request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course_list.append(course)
        return render(request, 'usercenter-fav-course.html', {
            'course_list': course_list
        })


class MyMessageView(LoginRequiredMixin, View):
    """
    我的消息页面
    """
    def get(self, request):
        all_message = UserMessage.objects.all().order_by('-add_time')

        # 用户进入消息页面后，把所有消息置为已读
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, is_read=False)
        for unread_message in all_unread_messages:
            unread_message.is_read = True
            unread_message.save()

        # 对消息进行分页
        try:
            page = request.GET.get('page', '1')
        except PageNotAnInteger:
            page = 1

        # 每页5条消息
        p = Paginator(all_message, 5, request=request)
        messages = p.page(page)

        return render(request, 'usercenter-message.html', {
            'messages': messages,
        })


class IndexView(View):
    """
    首页
    """
    def get(self, request):
        # print(1/0)
        all_banners = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all().order_by('-click_nums')[:15]
        return render(request, 'index.html', {
            'all_banners': all_banners,
            'courses': courses,
            'banner_courses': banner_courses,
            'course_orgs': course_orgs,
        })


# 全局404处理函数
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.delete_cookie = 404
    return response


# 全局404处理函数
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.delete_cookie = 500
    return response
