from django.db import models

# Create your models here.
from users.models import UserProfile


class OrderAdress(models.Model):
    """
    订单地址
    """
    name = models.CharField(verbose_name="收件人", max_length=255)
    telphone = models.CharField(verbose_name="联系电话", max_length=255)
    province = models.CharField(verbose_name="省", max_length=255)
    city = models.CharField(verbose_name="市", max_length=255)
    detail = models.CharField(verbose_name="地址详情", max_length=255)
    note = models.CharField(verbose_name="备注", max_length=255)
    user = models.ForeignKey(UserProfile, verbose_name="用户", on_delete=models.CASCADE, null=True)

    def __str__(self):
        return "%s %s%s%s" % (self.name, self.province, self.city, self.detail)

    class Meta:
        verbose_name = '订单地址'
        verbose_name_plural = verbose_name


class Order(models.Model):
    """
    订单
    """
    create_time = models.DateTimeField(verbose_name="订单日期", auto_now_add=True)
    address = models.ForeignKey(OrderAdress, verbose_name="地址", on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(UserProfile, verbose_name='用户', on_delete=models.SET_NULL, null=True)
    day = models.DateField(verbose_name="创建日", auto_now_add=True)
    type = models.CharField(verbose_name="家居类型", max_length=255, null=True)
    status = models.IntegerField(verbose_name="状态", default=1)

    class Meta:
        verbose_name = '订单列表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "订单" + str(self.pk)


class LogisticType(models.Model):
    """
    物流类型
    """
    create_time = models.DateTimeField(verbose_name="创建时间", auto_now_add=True)
    name = models.CharField(verbose_name="物流名称", max_length=255)
    website = models.CharField(verbose_name="物流网站", max_length=255)
    user = models.ForeignKey(UserProfile, verbose_name="创建者", on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '物流类型'
        verbose_name_plural = verbose_name


class Logistic(models.Model):
    """
    物流信息
    """
    create_time = models.DateTimeField(verbose_name="发货时间", auto_now_add=True)
    logistic_type = models.ForeignKey(LogisticType, verbose_name="物流公司", on_delete=models.SET_NULL, null=True)
    num = models.CharField(verbose_name="单号", max_length=255)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, verbose_name="订单号", null=True, related_name="logistic")

    class Meta:
        verbose_name = '物流列表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.logistic_type.name + " " + self.num
