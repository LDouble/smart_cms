from django.db import models
import datetime
# Create your models here.
from users.models import UserProfile
from orders.models import Order


class FurnitureType(models.Model):
    name = models.CharField(max_length=254, verbose_name="家电名称")
    create_time = models.DateTimeField(verbose_name="创建时间", auto_now_add=True)
    update_time = models.DateTimeField(verbose_name="更新时间", auto_now=True)
    user = models.ForeignKey(UserProfile, verbose_name="创建人", on_delete=None)

    # create_user =
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '家居类型'
        verbose_name_plural = verbose_name


class DeviceType(models.Model):
    name = models.CharField(verbose_name="类别名称", max_length=254)
    create_time = models.DateTimeField(verbose_name="创建时间", default=datetime.datetime.now())
    update_time = models.DateTimeField(verbose_name="更新时间", auto_now=True)
    furnituretype = models.ForeignKey(FurnitureType, on_delete=models.CASCADE, related_name="device_type",
                                      verbose_name="所属家居")

    def __str__(self):
        return self.furnituretype.name + self.name

    class Meta:
        verbose_name = '配件类型'
        verbose_name_plural = verbose_name


class Device(models.Model):
    name = models.CharField(verbose_name="配件名称", max_length=254)
    num = models.IntegerField(verbose_name="配件数量", default=0)
    type = models.ForeignKey(DeviceType, on_delete=models.CASCADE, related_name="device")
    create_time = models.DateTimeField(verbose_name="创建时间", default=datetime.datetime.now())
    update_time = models.DateTimeField(verbose_name="更新时间", auto_now=True)
    params = models.TextField(verbose_name="参数")

    def __str__(self):
        return self.type.name + "-" + self.params

    class Meta:
        verbose_name = '配件列表'
        verbose_name_plural = verbose_name


class DeviceUse(models.Model):
    device = models.ForeignKey(Device, on_delete=models.CASCADE)
    create_time = models.DateTimeField(verbose_name="使用日期", default=datetime.datetime.now())
    create_date = models.DateField(verbose_name="使用日期", auto_now=True)
    num = models.IntegerField(verbose_name="使用数量")
    user = models.ForeignKey(UserProfile, verbose_name="使用人", on_delete=models.CASCADE)
    order = models.ForeignKey(Order, verbose_name="关联订单", on_delete=models.SET_NULL, null=True,
                              related_name="use_device")

    def __str__(self):
        return self.device.__str__()

    class Meta:
        verbose_name = '配件使用记录'
        verbose_name_plural = verbose_name

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        print("ss")
        super(DeviceUse, self).save(force_insert, force_update, using, update_fields)
        device = self.device
        device.num -= self.num
        device.save()
        print(device)

    def delete(self, using=None, keep_parents=False):
        super(DeviceUse, self).delete(using, keep_parents)
        device = self.device
        device.num += self.num
        device.save()


class Question(models.Model):
    question = models.CharField(verbose_name="问题", max_length=255)
    furniture = models.ForeignKey(FurnitureType, verbose_name="所属家居", on_delete=models.CASCADE, related_name="question")
    create_time = models.DateTimeField(verbose_name="创建时间", auto_now_add=True)

    def __str__(self):
        return self.question

    class Meta:
        verbose_name = "问题"
        verbose_name_plural = verbose_name


class Answer(models.Model):
    value = models.CharField(verbose_name="答案", max_length=255)
    device = models.ForeignKey(Device, verbose_name="推荐设备", on_delete=models.CASCADE)
    create_time = models.DateTimeField(verbose_name="创建时间", auto_now_add=True)
    question = models.ForeignKey(Question, verbose_name="所属问题", on_delete=models.CASCADE, related_name="answer")

    def __str__(self):
        return self.question.__str__() + "----" + self.value

    class Meta:
        verbose_name = "答案"
        verbose_name_plural = verbose_name
