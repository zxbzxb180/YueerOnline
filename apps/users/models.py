from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

from DjangoUeditor.models import UEditorField
# Create your models here.


class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50, default='', verbose_name='昵称')
    birthday = models.DateField(null=True, blank=True, verbose_name='生日')
    gender = models.CharField(max_length=10, choices=(('male', '男'), ('female', '女')), default='female', verbose_name='性别')
    address = models.CharField(max_length=100, default='', verbose_name='地址')
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name='手机号码')
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=100)
    is_teacher = models.BooleanField(default=0, verbose_name='是否为讲师')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    # 获取未读消息的数量
    def unread_nums(self):
        # 放在这里不会造成循环引用
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, is_read=False).count()


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name='验证码')
    email = models.EmailField(max_length=50, verbose_name='邮箱')
    send_type = models.CharField(choices=(('register', '注册'), ('forget', '找回密码'), ('update_email', '修改邮箱')), max_length=12, verbose_name='验证码类型')
    is_used = models.BooleanField(default=0)  # 存在漏洞,有可能两个用户同时忘记密码,而随机生成的code相同
    send_time = models.DateTimeField(default=datetime.now, verbose_name='发送时间')

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m', max_length=100, verbose_name='轮播图')
    url = models.URLField(max_length=200, verbose_name='访问地址')
    index = models.IntegerField(default=100, verbose_name='轮播图顺序')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '轮播图 {0}'.format(self.title)


class AddCourse(models.Model):
    course_org = models.CharField(max_length=50, verbose_name='课程机构', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name='课程名称')
    teacher = models.CharField(max_length=10, default='', verbose_name='讲师名称')
    desc = models.CharField(max_length=300, verbose_name='课程描述')
    learn_time = models.IntegerField(default=0, verbose_name='课程总时长(分钟)')
    image = models.ImageField(upload_to='teacher/add_course/%Y/%m', max_length=100, verbose_name='封面图')
    need_know = models.CharField(max_length=300, default='', verbose_name='课程须知')
    teacher_tell = models.CharField(max_length=300, default='', verbose_name='老师的话')
    course = models.FileField(max_length=100, upload_to='teacher/add_course/%Y/%m', verbose_name='上传课程')
    is_add = models.BooleanField(default=0, verbose_name='是否已添加')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '教师上传的课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '教师上传的课程'
