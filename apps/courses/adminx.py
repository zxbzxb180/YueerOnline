import xadmin

from .models import *
from organization.models import CourseOrg

class VideoInline(object):
    model = Video
    extra = 0


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums', 'add_time']
    search_fields = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums', 'add_time']
    # 可在列表处修改
    list_editable = ['degree', 'desc']

    model_icon = 'fa fa-calendar'
    # 排序
    ordering = ['-click_nums']
    # 只读
    readonly_fields = ['click_nums', 'fav_nums']
    # 不显示
    # exclude = ['']

    inlines = [LessonInline, CourseResourceInline]

    style_fields = {'detail': 'ueditor'}

    # 过滤
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        return qs.filter(is_banner=False)

    def save_models(self):
        # 在保存课程时重新统计课程数
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            num = Course.objects.filter(course_org=course_org).count()
            course_org.course_nums = num
            course_org.save()



class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums', 'add_time']
    search_fields = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums']
    list_filter = ['name', 'desc', 'teacher', 'course_org', 'category', 'degree', 'students', 'fav_nums', 'click_nums', 'add_time']
    model_icon = 'fa fa-calendar'
    # 排序
    ordering = ['-click_nums']
    # 只读
    readonly_fields = ['click_nums', 'fav_nums']
    # 不显示
    # exclude = ['']

    # 把其他模块注册入
    inlines = [LessonInline, CourseResourceInline]


    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        return qs.filter(is_banner=True)

    def save_models(self):
        # 在保存课程时重新统计课程数
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            num = Course.objects.filter(course_org=course_org).count()
            course_org.course_nums = num
            course_org.save()

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']
    model_icon = 'fa fa-sitemap'

    inlines = [VideoInline]


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']
    model_icon = 'fa fa-video-camera'


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course__name', 'name', 'download', 'add_time']
    model_icon = 'fa fa-file-archive-o'


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)

