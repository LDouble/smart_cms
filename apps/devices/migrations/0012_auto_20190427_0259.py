# Generated by Django 2.2 on 2019-04-27 02:59

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('devices', '0011_auto_20190427_0242'),
    ]

    operations = [
        migrations.AlterField(
            model_name='device',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 27, 2, 59, 8, 20104), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='devicetype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 27, 2, 59, 8, 19183), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='deviceuse',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 27, 2, 59, 8, 20793), verbose_name='使用日期'),
        ),
        migrations.AlterField(
            model_name='furnituretype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 27, 2, 59, 8, 18191), verbose_name='创建时间'),
        ),
    ]
