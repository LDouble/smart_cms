from django.contrib import auth
from django.shortcuts import render, redirect, reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from orders.models import OrderAdress
from .models import UserProfile
from django.contrib.auth.hashers import make_password


@login_required
def index_action(request):
    return render(request, "users/index.html")


@login_required
def address_add_action(request):
    if request.method == "POST":
        name = request.POST.get("name")
        telphone = request.POST.get("telphone")
        province = request.POST.get("province")
        city = request.POST.get("city")
        detail = request.POST.get("detail")
        note = request.POST.get("note")
        order = OrderAdress()
        order.name = name
        order.telphone = telphone
        order.province = province
        order.city = city
        order.detail = detail
        order.note = note
        order.user = request.user
        order.save()
        if order:
            return redirect(reverse("user:address_lists"))
        else:
            return render(request, "address/add.html")
    else:
        return render(request, 'address/add.html')


@login_required
def address_del_action(request, pk):
    data = OrderAdress.objects.get(pk=pk)
    if data:
        data.delete()
    return redirect(reverse("user:address_lists"))


@login_required
def address_lists_action(request):
    data = OrderAdress.objects.filter(user=request.user).all()
    context = {"list": data}
    return render(request, "address/lists.html", context)


def login_action(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(username=username, password=password)
        if user:
            auth.login(request, user)
            request.session['username'] = username
            next = request.GET.get("next", "/")
            response = HttpResponseRedirect(next)
            return response
        else:
            return render(request, "users/login.html", {"error": "账户或密码错误"})

    else:
        return render(request, "users/login.html")


@login_required
def logout(request):
    auth.logout(request)
    return redirect(reverse("user:login"))


def register_action(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        password_re = request.POST.get("password_re")
        try:
            if password == password_re:
                user = UserProfile(username=username, password=make_password(password))
                user.save()
                return redirect(reverse("user:login"))
        except Exception as e:
            return render(request, "users/register.html", {"error": "用户已存在"})


    else:
        return render(request, "users/register.html")
