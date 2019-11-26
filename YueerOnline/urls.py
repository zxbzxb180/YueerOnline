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

import xadmin

from users.views import *
from organization.views import *

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),

    # 首页
    url('^$', TemplateView.as_view(template_name='index.html'), name='index'),

    # 登录注册
    url('^login/$', LoginView.as_view(), name='login'),
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

    url('^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT})
]
