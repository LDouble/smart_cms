import xadmin
from .models import Order, OrderAdress, LogisticType, Logistic


class OrderAdmin(object):
    list_display = ['user', 'address', 'day', 'show_device_type', 'show_logistic']
    search_fields = ['user']

    def show_device_type(self, obj):
        res = []
        for x in obj.use_device.all():
            res.append(x.__str__())
        return ",".join(res)

    show_device_type.short_description = "设备列表"

    def show_logistic(self, obj):
        res = []
        for x in obj.logistic.all():
            res.append(x.__str__())
        if len(res):
            return ",".join(res)
        else:
            return "未发货"

    show_logistic.short_description = "物流信息"


class OrderAdressAdmin(object):
    list_display = ['name', 'telphone', 'province', 'city', 'detail', 'note']
    search_fields = ['name', 'telphone', 'province', 'city', 'detail', 'note']


class LogisticAdmin(object):
    list_display = ['order', 'num', 'logistic_type', 'create_time']
    search_fields = ['order', 'num']


class LogisticTypeAdmin(object):
    list_display = ['name', 'website', 'user', 'create_time']
    search_fields = ['name', 'website']


xadmin.site.register(Order, OrderAdmin)
xadmin.site.register(OrderAdress, OrderAdressAdmin)
xadmin.site.register(Logistic, LogisticAdmin)
xadmin.site.register(LogisticType, LogisticTypeAdmin)
