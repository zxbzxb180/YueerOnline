from django.conf.urls import url, include
from .views import UserinfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, MyFavOrgView, MyFavTeacherView, MyFavCourseView, MyMessageView


urlpatterns = [
    # 用户中心
    url('^info/$', UserinfoView.as_view(), name='user_info'),
    # 用户头像上传
    url('^image/upload/$', UploadImageView.as_view(), name='image_upload'),

    # 用户个人中心修改密码
    url('^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),

    # 用户中心发送邮箱验证码
    url('^send_email_code/$', SendEmailCodeView.as_view(), name='send_email_code'),

    # 用户中心修改邮箱
    url('^update_email/$', UpdateEmailView.as_view(), name='update_email'),

    # 我的课程
    url('^my_course/$', MyCourseView.as_view(), name='my_course'),

    # 我的收藏————课程机构
    url('^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),

    # 我的收藏————课程讲师
    url('^myfav/teacher/$', MyFavTeacherView.as_view(), name='myfav_teacher'),

    # 我的收藏————课程讲师
    url('^myfav/course/$', MyFavCourseView.as_view(), name='myfav_course'),

    # 我的消息
    url('^mymessage/$', MyMessageView.as_view(), name='mymessage'),

]
