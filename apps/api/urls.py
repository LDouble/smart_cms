from django.urls import path, include
from django.conf.urls import url
from . import views

app_name = "api"
urlpatterns = [
    url(r"^users/$", views.UserView.as_view()),
    path(r"users/<pk>/", views.UserDetailView.as_view()),
    url(r"^furniture/$", views.FurnitureTypeView.as_view()),
    path(r"furniture/<pk>/", views.FurnitureTypeDetail.as_view()),
    url(r"^device_type/$", views.DeviceTypeView.as_view()),
    path(r"device_type/<int:pk>/", views.DeviceTypeDetail.as_view()),
    url(r"^device/$", views.DeviceView.as_view()),
    path(r"device/<int:pk>/", views.DeviceDetail.as_view()),
    url(r"^device_log/$", views.DeviceLogView.as_view()),
    path(r"device_log/<int:pk>/", views.DeviceLogDetail.as_view()),
    url(r"^usage_log/$", views.UsageLogView.as_view()),
    path(r"usage_log/<int:pk>/", views.UsageLogDetail.as_view()),
    url(r"^order/$", views.OrderView.as_view()),
    path(r"order/<int:pk>/", views.OrderDetail.as_view()),
    url(r"^address/$", views.AddressView.as_view()),
    path(r"address/<int:pk>/", views.AddressDetail.as_view()),
    url(r"^logistic/$", views.LogisticView.as_view()),
    path(r"logistic/<int:pk>/", views.LogisticDetail.as_view()),
]
