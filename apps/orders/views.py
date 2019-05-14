from django.shortcuts import render, reverse, redirect
from django.contrib.auth.decorators import login_required
from devices.models import FurnitureType, DeviceUse
from .models import Order, OrderAdress
from django.db import transaction


@login_required
def step1(request):
    data = FurnitureType.objects.all()
    return render(request, "order/step1.html", {"data": data})


@login_required
def step2(request):
    furniture = request.POST.get("furniture")
    data = FurnitureType.objects.get(pk=furniture)
    request.session['step2'] = data.name
    device_list = request.POST.getlist("device_list")
    for k, v in enumerate(device_list):
        device_list[k] = int(v)
    objects = data.device_type.all()
    address = OrderAdress.objects.filter(user=request.user).all()
    if not address or len(address) == 0:
        return redirect(reverse("user:address_add"))
    print(device_list)
    return render(request, "order/step2.html",
                  {"device_types": objects, "furniture": data, "address": address, "device_list": device_list})


@login_required
def recommend(request):
    furniture = request.POST.get("furniture")
    data = FurnitureType.objects.get(pk=furniture)
    questions = data.question.all()
    request.session['step2'] = data.name
    if questions and len(questions):
        return render(request, "order/recommend.html", {"questions": questions, "furniture": furniture})
    else:
        objects = data.device_type.all()
        address = OrderAdress.objects.filter(user=request.user).all()
        if not address or len(address) == 0:
            return redirect(reverse("user:address_add"))
        return render(request, "order/step2.html", {"device_types": objects, "furniture": data, "address": address})


@login_required
def step3(request):
    device = request.POST.getlist("device", [])
    address_pk = request.POST.get("address")
    if len(device) == 0:
        return redirect(reverse("order:step1"))
    with transaction.atomic():
        order = Order(user=request.user, address_id=address_pk)
        order.type = request.session['step2']
        order.save()
        querysetlist = []
        for i in device:
            querysetlist.append(DeviceUse(num=1, order=order, user=request.user, device_id=i))
        DeviceUse.objects.bulk_create(querysetlist)
        return redirect(reverse("order:lists"))
    return redirect(reverse("order:step1"))


@login_required
def lists(request):
    orders = Order.objects.filter(user=request.user, status=1).all()
    return render(request, "order/lists.html", {"lists": orders, "title": "订单列表"})


@login_required
def order_del_action(request, pk):
    data = Order.objects.get(pk=pk, user=request.user)
    if data:
        data.status = 0
        data.save()
    return redirect(reverse("order:lists"))


@login_required
def recycle(request):
    orders = Order.objects.filter(user=request.user, status=0).all()
    return render(request, "order/lists.html", {"lists": orders, "title": "订单回收站"})


@login_required
def order_del_action_2(request, pk):
    data = Order.objects.get(pk=pk, user=request.user)
    if data:
        data.delete()
    return redirect(reverse("order:recycle"))
