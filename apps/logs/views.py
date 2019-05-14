from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from logs.models import UsageLog, DeviceLog


# Create your views here.

@login_required
def device_log_action(request):
    log = DeviceLog.objects.filter(user=request.user).all()
    print(1323)
    return render(request, "logs/device_log.html", {"data": log})


@login_required
def device_usage_action(request):
    usage = UsageLog.objects.filter(user=request.user).all()
    return render(request, "logs/useage_log.html", {"data": usage})
