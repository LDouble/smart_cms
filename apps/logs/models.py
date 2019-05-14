from django.db import models

# Create your models here.

from users.models import UserProfile
from devices.models import FurnitureType


class DeviceLog(models.Model):
    """
    设备使用记录
    """
    user = models.ForeignKey(UserProfile, verbose_name="用户", on_delete=models.CASCADE)
    create_time = models.DateTimeField(verbose_name="用户提交时间", editable=False, auto_now_add=True)
    day = models.DateField(verbose_name="日志时间", editable=False, auto_now_add=True)
    forniture_type = models.ForeignKey(FurnitureType, verbose_name="家居类型", on_delete=models.CASCADE)
    type = models.CharField(verbose_name="操作类型", max_length=255)
    time = models.IntegerField(verbose_name="时间长度", default=0)

    class Meta:
        verbose_name = "设备日志"
        verbose_name_plural = verbose_name


class UsageLog(models.Model):
    """
    设备使用情况,通过数据进行处理分析CPU、内存的使用情况
    """
    user = models.ForeignKey(UserProfile, verbose_name="用户", on_delete=models.CASCADE)
    create_time = models.DateTimeField(verbose_name="日志提交时间", editable=False, auto_now_add=True)
    day = models.DateField(verbose_name="日志时间", editable=False, auto_now_add=True)
    forniture_type = models.ForeignKey(FurnitureType, verbose_name="家居类型", on_delete=models.CASCADE)
    info = models.TextField(verbose_name="使用详情")

    class Meta:
        verbose_name = "设备使用情况"
        verbose_name_plural = verbose_name
