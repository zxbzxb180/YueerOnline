from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse

from .models import Course, CourseResource, Video
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin

from pure_pagination import PageNotAnInteger, Paginator, EmptyPage

# Create your views here.


class CourseListView(View):
    """
    课程列表首页
    """
    def get(self, request):
        all_courses = Course.objects.all().order_by('-add_time')
        hot_courses = Course.objects.all().order_by('-click_nums')[:3]

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'student':
                all_courses = all_courses.order_by('-students')

            elif sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', '1')
        except PageNotAnInteger:
            page = 1

        # 每页4个课程机构
        p = Paginator(all_courses, 6, request=request)
        courses = p.page(page)

        return render(request, 'course-list.html', {
            'all_courses': all_courses,
            'hot_courses': hot_courses,
            'courses': courses,
            'sort': sort,
            'type': 'course',
        })


class CourseDetailView(View):
    """
    课程详情页
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        # 增加课程点击数
        course.click_nums += 1
        course.save()

        has_fav_course = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1)
            if user_fav:
                has_fav_course = True

        has_fav_org = False
        if request.user.is_authenticated():
            user_fav = UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2)
            if user_fav:
                has_fav_org = True

        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:2:-1]
        else:
            relate_courses = []
        return render(request, 'course-detail.html', {
            'course': course,
            'relate_courses': relate_courses,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org,
        })


class CourseInfoView(LoginRequiredMixin, View):
    """
    课程视频信息页
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        user_courses = UserCourse.objects.filter(course=course)
        # 获取学过该课程的所有学生的id
        user_ids = [user_course.user.id for user_course in user_courses]
        # 获取上述所有学生学的所有课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 获取上述所有课程的id
        course_ids = [user_course.course.id for user_course in all_user_courses]
        # 获取上述所有课程,并根据点击量排列
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]

        # 查询用户是否已关联课程
        student_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not student_courses:
            student_course = UserCourse()
            student_course.course = course
            student_course.user = request.user
            course.students += 1
            course.save()
            student_course.save()

        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html', {
            'course': course,
            'all_resources': all_resources,
            'relate_courses': relate_courses,
        })


class CourseCommentView(LoginRequiredMixin, View):
    """
    课程评论页
    """
    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.all().order_by('-add_time')
        return render(request, 'course-comment.html', {
            'course': course,
            'all_resources': all_resources,
            'all_comments': all_comments,
        })


class AddCommentsView(View):
    """
    添加评论
    """
    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        course_id = request.POST.get('course_id', 0)
        comments = request.POST.get('comments', '')
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加失败"}', content_type='application/json')


class VideoPlayView(View):
    """
    课程视频播放页面
    """
    def get(self, request, video_id):
        video = Video.objects.get(id=video_id)
        course = video.lesson.course
        user_courses = UserCourse.objects.filter(course=course)
        # 获取学过该课程的所有学生的id
        user_ids = [user_course.user.id for user_course in user_courses]
        # 获取上述所有学生学的所有课程
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 获取上述所有课程的id
        course_ids = [user_course.course.id for user_course in all_user_courses]
        # 获取上述所有课程,并根据点击量排列
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        # 查询用户是否已关联课程
        student_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not student_courses:
            student_course = UserCourse()
            student_course.course = course
            student_course.user = request.user
            course.students += 1
            course.save()
            student_course.save()

        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-play.html', {
            'course': course,
            'all_resources': all_resources,
            'relate_courses': relate_courses,
            'video': video,
        })