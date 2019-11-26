from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.hashers import make_password
from django.views.generic.base import View

from utils.email_send import send_register_email
from .forms import LoginForm, RegisterForm, ForgetForm, ModifyPwdForm
from .models import UserProfile, EmailVerifyRecord
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
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', '')
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '用户名已被注册'})
            pass_word = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.password = make_password(password=pass_word)
            user_profile.is_active = False
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
        return render(request, 'login.html')

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
                    return render(request, 'index.html')
                else:
                    return render(request, 'login.html', {'msg': '用户尚未激活，请点击邮件激活链接！'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码输入错误！'})
        else:
            return render(request, 'login.html', {'login_form': login_form})


class ForgetPwdView(View):
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
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {"email": email, 'msg': '两次密码输入不一致'})
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





