# Generated by Django 2.2 on 2019-04-22 10:28

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('devices', '0006_auto_20190421_0658'),
    ]

    operations = [
        migrations.AlterField(
            model_name='device',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 22, 10, 28, 18, 267744), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='devicetype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 22, 10, 28, 18, 267047), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='deviceuse',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 22, 10, 28, 18, 268506), verbose_name='使用日期'),
        ),
        migrations.AlterField(
            model_name='furnituretype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 22, 10, 28, 18, 266384), verbose_name='创建时间'),
        ),
    ]
