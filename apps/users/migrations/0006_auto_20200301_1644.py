# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2020-03-01 16:44
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0005_addcourse'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='addcourse',
            options={'verbose_name': '教师上传的课程', 'verbose_name_plural': '教师上传的课程'},
        ),
    ]
