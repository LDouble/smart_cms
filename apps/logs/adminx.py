import xadmin
from .models import DeviceLog, UsageLog

class DeviceLogAdmin(object):
    list_display = ['forniture_type', 'type', 'create_time', 'day', 'user']
    list_filter = ['forniture_type', 'user', 'day', 'type']

class UsageLogAdmin(object):
    list_display = ['forniture_type', 'info', 'create_time', 'user']
    list_filter = ['forniture_type', 'user', 'day', 'info']


xadmin.site.register(DeviceLog, DeviceLogAdmin)
xadmin.site.register(UsageLog, UsageLogAdmin)

