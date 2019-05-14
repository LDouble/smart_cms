# Generated by Django 2.2 on 2019-04-16 02:16

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('devices', '0003_auto_20190416_0049'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='devicetype',
            name='params',
        ),
        migrations.AddField(
            model_name='device',
            name='params',
            field=models.TextField(default='', verbose_name='参数'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='device',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 16, 2, 16, 0, 803453), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='devicetype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 16, 2, 16, 0, 802408), verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='furnituretype',
            name='create_time',
            field=models.DateTimeField(default=datetime.datetime(2019, 4, 16, 2, 16, 0, 801716), verbose_name='创建时间'),
        ),
    ]
