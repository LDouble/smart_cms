from django.urls import include, path
from django.conf.urls import url, re_path
from . import views

app_name = "log"
urlpatterns = [
    url(r'^usagelog', views.device_usage_action, name='usagelog'),
    url(r'^device_log', views.device_log_action, name='device_log'),
]
