from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse

from .models import CourseOrg, CityDict, Teacher
from .forms import UserAskForm
from courses.models import Course
from operation.models import UserFavorite

from pure_pagination import PageNotAnInteger, Paginator, EmptyPage
# Create your views here.


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):

        # 课程机构
        all_orgs = CourseOrg.objects.all()

        # 城市
        all_citys = CityDict.objects.all()

        # 热门机构
        hot_orgs = all_orgs.order_by('-click_nums')[:4]

        # 城市筛选
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        # 机构类别筛选
        category = request.GET.get('ct', '')
        if category:
            all_orgs = all_orgs.filter(category=category)

        org_nums = all_orgs.count()

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'student':
                all_orgs = all_orgs.order_by('-students')

            elif sort == 'courses':
                all_orgs = all_orgs.order_by('-course_nums')

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', '1')
        except PageNotAnInteger:
            page = 1

        # 每页4个课程机构
        p = Paginator(all_orgs, 4, request=request)
        orgs = p.page(page)

        return render(request, 'org_list.html', {
            'orgs': orgs,
            'all_citys': all_citys,
            'org_nums': org_nums,
            'city_id': city_id,
            'category': category,
            'hot_orgs': hot_orgs,
            'sort': sort,
            'type': 'org',
        })


class AddUserAskView(View):
    """
    用户咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"输入有误"}', content_type='application/json')


class OrgHomeView(View):
    """
    机构首页
    """
    def get(self, request, org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))

        has_fav = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2)
            if user_fav:
                has_fav = True

        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request, 'org-detail-homepage.html', {
            'all_courses': all_courses,
            'all_teachers': all_teachers,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgCourseView(View):
    """
    机构课程列表
    """
    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()

        has_fav = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2)
            if user_fav:
                has_fav = True

        return render(request, 'org-detail-course.html', {
            'all_courses': all_courses,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgDescView(View):
    """
    机构介绍
    """
    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))

        has_fav = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2)
            if user_fav:
                has_fav = True

        return render(request, 'org-detail-desc.html', {
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgTeacherView(View):
    """
    机构讲师介绍
    """
    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teacher = course_org.teacher_set.all()

        has_fav = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2)
            if user_fav:
                has_fav = True

        return render(request, 'org-detail-teachers.html', {
            'course_org': course_org,
            'all_teacher': all_teacher,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class AddFavView(View):
    """
    用户收藏/取消收藏
    """
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        exit_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exit_records:
            #如记录已经存在，则表示用户取消收藏
            exit_records.delete()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = fav_id
                user_fav.fav_type = fav_type
                user_fav.save()
                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')

            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')


class TeacherListView(View):
    """
    课程讲师列表页
    """
    def get(self, request):
        all_teachers = Teacher.objects.all()
        teacher_nums = all_teachers.count()
        sorted_teachers = all_teachers.order_by('-click_nums')[:5]

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-click_nums')

        # 对课程讲师进行分页
        try:
            page = request.GET.get('page', '1')
        except PageNotAnInteger:
            page = 1

        # 每页3个课程讲师
        p = Paginator(all_teachers, 3, request=request)
        teachers = p.page(page)
        return render(request, 'teachers-list.html', {
            'teachers': teachers,
            'sorted_teachers': sorted_teachers,
            'type': 'teacher',
            'sort': sort,
            'teacher_nums': teacher_nums,
        })


class TeacherDetailView(View):
    """
    讲师详情页
    """
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher_courses = teacher.course_set.all()
        all_teachers = Teacher.objects.all()
        sorted_teachers = all_teachers.order_by('-click_nums')[:5]

        has_fav_teacher = False
        if request.user.is_authenticated():
            teacher_fav = UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3)
            if teacher_fav:
                has_fav_teacher = True

        has_fav_org = False
        if request.user.is_authenticated():
            org_fav = UserFavorite.objects.filter(user=request.user, fav_id=teacher.org.id, fav_type=2)
            if org_fav:
                has_fav_org = True

        return render(request, 'teacher-detail.html', {
            'teacher': teacher,
            'teacher_courses': teacher_courses,
            'sorted_teachers': sorted_teachers,
            'has_fav_teacher': has_fav_teacher,
            'has_fav_org': has_fav_org,
        })
