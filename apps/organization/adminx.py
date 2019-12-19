import xadmin

from .models import *


class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']
    model_icon = 'fa fa-map-marker'


class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'category', 'click_nums', 'fav_nums', 'course_nums', 'students', 'address', 'city', 'add_time']
    search_fields = ['name', 'desc', 'category', 'click_nums', 'fav_nums', 'course_nums', 'students', 'address', 'city']
    list_filter = ['name', 'desc', 'category', 'click_nums', 'fav_nums', 'course_nums', 'students', 'address', 'city', 'add_time']
    model_icon = 'fa fa-home'
    # 下拉变搜索
    # relfield_style = 'fk_ajax'
    # 不显示
    # exclude = ['course_nums']
    # 只读
    # readonly_fields = ['course_nums']

class TeacherAdmin(object):
    list_display = ['org', 'name', 'teach_years', 'work_org', 'fav_nums', 'work_position', 'points', 'click_nums', 'fav_nums', 'add_time']
    search_fields = ['org', 'name', 'teach_years', 'work_org', 'fav_nums', 'work_position', 'points', 'click_nums', 'fav_nums']
    list_filter = ['org', 'name', 'teach_years', 'work_org', 'fav_nums', 'work_position', 'points', 'click_nums', 'fav_nums', 'add_time']
    model_icon = 'fa fa-users'
    # 可在列表处修改
    list_editable = ['teach_years', 'work_org']

xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)

