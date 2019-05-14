from django.conf.urls import url
from django.urls import path
from . import views

app_name = "order"
urlpatterns = [
    # url(r'^api/', views.UserView.as_view(), name='user'),
    url(r'^step1', views.step1, name='step1'),
    url(r'^step2', views.step2, name='step2'),
    url(r'^step3', views.step3, name='step3'),
    url(r'^recommend', views.recommend, name='recommend'),
    url(r'^lists', views.lists, name='lists'),
    url(r'^recycle', views.recycle, name='recycle'),
    path(r'del/<pk>/', views.order_del_action, name='del'),
    path(r'recycle_del/<pk>/', views.order_del_action_2, name='recycle_del'),

]
