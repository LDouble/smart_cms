from django.conf.urls import url
from django.urls import path
from . import views
app_name = "user"
urlpatterns = [
    # url(r'^api/', views.UserView.as_view(), name='user'),
    url(r'^login', views.login_action, name='login'),
    url(r'^register', views.register_action, name='register'),
    url(r'^logout', views.logout, name='logout'),
    url(r'^index', views.index_action, name='index'),
    url(r'^address/lists', views.address_lists_action, name='address_lists'),
    url(r'^address/add', views.address_add_action, name='address_add'),
    path(r'^address/del/<pk>/', views.address_del_action, name='address_del'),
]