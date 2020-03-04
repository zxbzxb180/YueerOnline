import xadmin
from xadmin import views

from .models import *


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = '悦耳后台管理系统'
    site_footer = '悦耳网'
    menu_style = 'accordion'


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']
    model_icon = 'fa fa-envelope'


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']
    model_icon = 'fa fa-picture-o'


class AddCourseAdmin(object):
    list_display = ['name', 'desc', 'teacher', 'course_org', 'image', 'course', 'need_know', 'teacher_tell', 'learn_time', 'is_add', 'add_time']
    search_fields = ['name', 'desc', 'teacher', 'course_org', 'image', 'course', 'need_know', 'teacher_tell', 'learn_time', 'is_add']
    list_filter = ['name', 'desc', 'teacher', 'course_org', 'image', 'course', 'need_know', 'teacher_tell', 'learn_time', 'is_add', 'add_time']
    # 只读
    readonly_fields = ['name', 'desc', 'teacher', 'course_org', 'image', 'course', 'need_know', 'teacher_tell', 'learn_time', 'add_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(AddCourse, AddCourseAdmin)

# 主题
xadmin.site.register(views.BaseAdminView, BaseSetting)
# 站头/站脚
xadmin.site.register(views.CommAdminView, GlobalSetting)