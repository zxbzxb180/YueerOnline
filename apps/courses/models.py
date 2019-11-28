from datetime import datetime

from django.db import models

from organization.models import CourseOrg, Teacher
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name='课程机构', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name='课程名称')
    desc = models.CharField(max_length=300, verbose_name='课程描述')
    detail = models.TextField(verbose_name='课程详情')
    is_banner = models.BooleanField(default=False, verbose_name='是否轮播')
    tag = models.CharField(max_length=10, default='', verbose_name='课程标签')
    degree = models.CharField(choices=(('cj', '初级'), ('zj', '中级'), ('gj', '高级')), max_length=2, verbose_name='课程难度')
    category = models.CharField(max_length=20, verbose_name='课程类别', default='乐器')
    learn_time = models.IntegerField(default=0, verbose_name='课程时长(分钟)')
    teacher = models.ForeignKey(Teacher, null=True, blank=True, verbose_name='讲师')
    students = models.IntegerField(default=0, verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', max_length=100, verbose_name='封面图')
    click_nums = models.IntegerField(default=0, verbose_name='课程点击数')
    need_know = models.CharField(max_length=300, default='', verbose_name='课程须知')
    teacher_tell = models.CharField(max_length=300, default='', verbose_name='老师的话')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def get_zj_nums(self):
        # 获取课程章节数
        return self.lesson_set.all().count()

    def get_learn_users(self):
        # 获取学习该课程的用户
        return self.usercourse_set.all()[:5]

    def get_course_lesson(self):
        # 获取课程章节
        return self.lesson_set.all()

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='章节名称')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def get_lesson_video(self):
        return self.video_set.all()

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0} {1}'.format(self.course, self.name)


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name='章节')
    name = models.CharField(max_length=100, verbose_name='视频名称')
    url = models.CharField(max_length=200,  default='', verbose_name='视频链接')
    learn_time = models.IntegerField(default=0, verbose_name='课程时长(分钟)')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0} {1}'.format(self.lesson, self.name)


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='视频名称')
    download = models.FileField(max_length=100, upload_to='course/resource/%Y/%m', verbose_name='上传文件')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0} {1}'.format(self.course, self.name)

