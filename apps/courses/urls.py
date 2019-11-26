from django.conf.urls import url, include

from .views import CourseListView, CourseDetailView, CourseInfoView, CourseCommentView, AddCommentsView, VideoPlayView


urlpatterns = [
    # 课程列表页
    url('^list/$', CourseListView.as_view(), name='course_list'),

    # 课程详情页
    url('^detail/(?P<course_id>\d+)$', CourseDetailView.as_view(), name='course_detail'),

    # 课程视频信息
    url('^info/(?P<course_id>\d+)$', CourseInfoView.as_view(), name='course_info'),

    url('^comment/(?P<course_id>\d+)$', CourseCommentView.as_view(), name='course_comment'),

    # 添加课程评论
    url('^add_comment/$', AddCommentsView.as_view(), name='add_comment'),

    url('^video/(?P<video_id>\d+)$', VideoPlayView.as_view(), name='video_play'),

]
