"""YueerOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve
from .settings import MEDIA_ROOT

from .settings import STATIC_ROOT

import xadmin

from users.views import *
from organization.views import *

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),

    # 首页
    url('^$', IndexView.as_view(), name='index'),

    # 登录注册
    url('^login/$', LoginView.as_view(), name='login'),
    url('^logout/$', LogoutView.as_view(), name='logout'),
    url('^register/$', RegisterView.as_view(), name='register'),
    url('^captcha/', include('captcha.urls')),
    url('^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name='user_active'),
    url('^forget/$', ForgetPwdView.as_view(), name='forget_pwd'),
    url('^reset/(?P<reset_code>.*)/$', ResetView.as_view(), name='reset_pwd'),
    url('^modify_pwd/$', ModifyPwdView.as_view(), name='modify_pwd'),

    # 课程相关url配置
    url('^course/', include('courses.urls', namespace='course')),

    # 课程机构url配置
    url('^org/', include('organization.urls', namespace='org')),

    # 课程讲师url配置
    url('^teacher/', include('organization.urls', namespace='org')),

    # 用户中心url配置
    url('^users/', include('users.urls', namespace='users')),

    # 上传的文件的url
    url('^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    # DEBUG=False时，需要自己配置静态文件的url
    url('^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),

    # 富文本相关url
    url(r'^ueditor/', include('DjangoUeditor.urls')),

    # 教师上传课程
    url('^add_course/$', AddCourseView.as_view(), name='add_course'),
]

# 全局404页面配置
handler404 = 'users.views.page_not_found'

# 全局500页面配置
handler500 = 'users.views.page_error'
