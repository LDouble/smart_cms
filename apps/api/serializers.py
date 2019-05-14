from rest_framework import serializers
from users.models import UserProfile
from devices.models import FurnitureType, Device, DeviceUse, DeviceType
from logs.models import UsageLog, DeviceLog
from orders.models import Logistic, Order, OrderAdress


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile  # 定义关联的 Model
        fields = '__all__'
        extra_kwargs = {
            "password": {"write_only": True},
        }
        read_only_fields = ("is_superuser", "is_staff")

    def update(self, instance, validated_data):
        for attr, value in validated_data.items():
            if attr == 'password':
                instance.set_password(value)
            else:
                setattr(instance, attr, value)
        instance.save()
        return instance

    def create(self, validated_data):
        user = UserProfile(**validated_data)
        # Hash the user's password.
        user.set_password(validated_data['password'])
        user.save()
        return user


class FurnitureTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = FurnitureType
        fields = '__all__'


class DeviceTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DeviceType
        fields = '__all__'


class DeviceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Device
        fields = "__all__"


class DeviceLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = DeviceLog
        fields = "__all__"


class UsageLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsageLog
        fields = "__all__"


class OrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = "__all__"


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderAdress
        fields = "__all__"


class LogisticSerializer(serializers.ModelSerializer):
    class Meta:
        model = Logistic
        fields = "__all__"


