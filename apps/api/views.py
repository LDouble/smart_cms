from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, permissions, mixins
from rest_framework.views import APIView
from rest_framework.response import Response
from users.models import UserProfile
from devices.models import DeviceType, Device, DeviceUse, FurnitureType
from logs.models import UsageLog, DeviceLog
from rest_framework import status
from .serializers import UserSerializer, FurnitureTypeSerializer, DeviceTypeSerializer, DeviceSerializer, \
    DeviceLogSerializer, UsageLogSerializer, AddressSerializer, OrderSerializer, LogisticSerializer
from orders.models import Logistic, Order, OrderAdress
from django.http import Http404
from rest_framework import generics
from .permissions import IS_STAFF


class UserView(APIView):
    """
    1. GET—获取当前用户的信息
    2. POST—创建新用户
    """

    def post(self, request, format=None):
        """
        创建用户: username, password, gender, mobiles
        :param request:
        :param format:
        :return:
        """
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, format=None):
        """
        获取
        :param request:
        :param format:
        :return:
        """
        if request.user.pk:
            data = UserProfile.objects.get(pk=request.user.pk)
            return Response(status=200, data=UserSerializer(data).data)
        else:
            return Response(status=status.HTTP_401_UNAUTHORIZED)


class UserDetailView(APIView):
    """
    用户个人资料
    """

    def get_object(self, request, pk):
        if request.user.pk != int(pk) and request.user.is_staff == False:
            raise Http404
        try:
            return UserProfile.objects.get(pk=pk)
        except UserProfile.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        snippet = self.get_object(request, pk)
        serializer = UserSerializer(snippet)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        snippet = self.get_object(request, pk)
        serializer = UserSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        snippet = self.get_object(request, pk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class FurnitureTypeView(generics.ListCreateAPIView):
    """
    家电列表获取和创建
    """
    permission_classes = (IS_STAFF, permissions.IsAdminUser)
    queryset = FurnitureType.objects.all()
    serializer_class = FurnitureTypeSerializer


class FurnitureTypeDetail(generics.RetrieveUpdateDestroyAPIView):
    """
    家电信息更改
    """
    permission_classes = (IS_STAFF,)
    queryset = FurnitureType.objects.all()
    serializer_class = FurnitureTypeSerializer


class DeviceTypeView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF, permissions.IsAdminUser)
    queryset = DeviceType.objects.all()
    serializer_class = DeviceTypeSerializer


class DeviceTypeDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = DeviceType.objects.all()
    serializer_class = DeviceTypeSerializer


class DeviceView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer


class DeviceDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer


class DeviceLogView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = DeviceLog.objects.all()
    serializer_class = DeviceLogSerializer


class DeviceLogDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = DeviceLog.objects.all()
    serializer_class = DeviceLogSerializer


class UsageLogView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = UsageLog.objects.all()
    serializer_class = UsageLogSerializer


class UsageLogDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = UsageLog.objects.all()
    serializer_class = UsageLogSerializer


class OrderView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Order.objects.all()
    serializer_class = OrderSerializer


class OrderDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Order.objects.all()
    serializer_class = OrderSerializer


class AddressView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = OrderAdress.objects.all()
    serializer_class = AddressSerializer


class AddressDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = OrderAdress.objects.all()
    serializer_class = AddressSerializer


class LogisticView(generics.ListCreateAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Logistic.objects.all()
    serializer_class = LogisticSerializer


class LogisticDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IS_STAFF,)
    queryset = Logistic.objects.all()
    serializer_class = LogisticSerializer
