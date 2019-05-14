import xadmin

from .models import DeviceType, Device, FurnitureType, DeviceUse, Question, Answer


# xadmin中这里是继承object，不再是继承admin
class DeviceTypeAdmin(object):
    # 显示的列
    list_display = ['name', 'create_time', 'update_time', 'furnituretype', 'show_device_num']
    # 搜索的字段
    search_fields = ['name']
    # 过滤
    list_filter = ['name']

    def show_device_num(self, obj):
        cnt = 0
        return len(obj.device.all())

    show_device_num.short_description = '数量'  # 设置表头


class FurnitureTypeAdmin(object):
    # 显示的列
    list_display = ['name', 'create_time', 'update_time', 'show_device_type']
    # 搜索的字段
    search_fields = ['name']
    # 过滤
    list_filter = ['name']

    def show_device_type(self, obj):
        cnt = 0
        return len(obj.device_type.all())

    show_device_type.short_description = '数量'  # 设置表头

    def save_model(self, request, obj, form, change):
        obj.user = request.user
        obj.save()

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("user",)
        form = super(FurnitureTypeAdmin, self).get_form(request, obj, **kwargs)
        return form


class DeviceAdmin(object):
    # 显示的列
    list_display = ['name', 'num', 'create_time', 'update_time']
    # 搜索的字段
    search_fields = ['name']
    # 过滤
    list_filter = ['name']


class DeviceUseAdmin(object):
    list_display = ["device", "user", "num", "order", "create_time"]
    search_fields = ["device", "user", "num", "order", "create_time"]
    list_filter = ["device", "user", "num", "order", "create_time"]


class QuestionAdmin(object):
    list_display = ['furniture', 'question', 'create_time']


class AnswerAdmin(object):
    list_display = ['question', 'value', 'create_time']


xadmin.site.register(Device, DeviceAdmin)
xadmin.site.register(DeviceType, DeviceTypeAdmin)
xadmin.site.register(FurnitureType, FurnitureTypeAdmin)
xadmin.site.register(DeviceUse, DeviceUseAdmin)
# xadmin.site.register(Question, QuestionAdmin)
# xadmin.site.register(Answer, AnswerAdmin)
# xadmin.site.register(Banner, BannerAdmin)
#
# # 将基本配置管理与view绑定
# xadmin.site.register(views.BaseAdminView,BaseSetting)
#
# # 将title和footer信息进行注册
# xadmin.site.register(views.CommAdminView,GlobalSettings)
