"""django_cms URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include
from django.conf.urls import url
import xadmin
# from xadmin.plugins import xversion
# xversion.register_models()
from django.views.static import serve
from .settings import MEDIA_ROOT
from rest_framework_jwt.views import obtain_jwt_token
from orders import views
from rest_framework_swagger.views import get_swagger_view

schema_view = get_swagger_view(title='Restful API')

urlpatterns = [
    path(r"admin", xadmin.site.urls),
    url(r'^api-token-auth', obtain_jwt_token),
    # re_path(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    re_path(r'^user/', include("users.urls")),
    re_path(r'^order/', include("orders.urls")),
    re_path(r'^log/', include("logs.urls")),
    re_path(r'^api/', include("api.urls")),
    url(r'^apis/', schema_view),
    url('^$', views.lists),
]
