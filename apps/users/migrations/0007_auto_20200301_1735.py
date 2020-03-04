# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2020-03-01 17:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20200301_1644'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='addcourse',
            name='category',
        ),
        migrations.RemoveField(
            model_name='addcourse',
            name='degree',
        ),
        migrations.RemoveField(
            model_name='addcourse',
            name='detail',
        ),
        migrations.RemoveField(
            model_name='addcourse',
            name='tag',
        ),
        migrations.AlterField(
            model_name='addcourse',
            name='image',
            field=models.ImageField(upload_to='teacher/add_course/%Y/%m', verbose_name='封面图'),
        ),
    ]
