import xadmin

from .models import EmailVerifyRecord, Banner
from xadmin import views
from xadmin.views.base import filter_hook, smart_text, sortkeypicker, capfirst, apps
from collections import OrderedDict


# 创建xadmin的最基本管理器配置，并与view绑定
class BaseSetting(object):
    # 开启主题功能
    enable_themes = True
    use_bootswatch = True


# 全局修改，固定写法
class GlobalSettings(object):
    # 修改title
    site_title = '智能家居管理系统'
    # 修改footer
    site_footer = '中国海洋大学 && 赛尔网络有限公司'
    # 收起菜单
    menu_style = ''
    apps_icons = {"home": "fa fa-home", "products": "", "companyintroduction": "",
                  "certifications": "fa fa-certificate",
                  "contactus": "fa fa-phone", "forum": "", "logisticinformation": "",
                  "sourcedownload": "fa fa-download", "trade": "fa fa-shopping-cart", "users": "fa fa-user",
                  "wechatuser": "fa fa-user", "knowledgebase": "fa fa-book", "questionanswer": "fa fa-question-circle"}

    @filter_hook
    def get_nav_menu(self):
        site_menu = list(self.get_site_menu() or [])
        had_urls = []

        def get_url(menu, had_urls):
            if 'url' in menu:
                had_urls.append(menu['url'])
            if 'menus' in menu:
                for m in menu['menus']:
                    get_url(m, had_urls)

        get_url({'menus': site_menu}, had_urls)

        nav_menu = OrderedDict()

        menus_ = self.admin_site._registry.items()
        for model, model_admin in menus_:
            if getattr(model_admin, 'hidden_menu', False):
                continue
            app_label = model._meta.app_label
            app_icon = None
            model_dict = {
                'title': smart_text(capfirst(model._meta.verbose_name_plural)),
                'url': self.get_model_url(model, "changelist"),
                'icon': self.get_model_icon(model),
                'perm': self.get_model_perm(model, 'view'),
                'order': model_admin.order,
            }
            if model_dict['url'] in had_urls:
                continue

            app_key = "app:%s" % app_label
            if app_key in nav_menu:
                nav_menu[app_key]['menus'].append(model_dict)
            else:
                # Find app title
                app_title = smart_text(app_label.title())
                if app_label.lower() in self.apps_label_title:
                    app_title = self.apps_label_title[app_label.lower()]
                else:
                    appL = apps.get_app_config(app_label)
                    app_title = smart_text(apps.get_app_config(app_label).verbose_name)
                    # added by Fiona for menu ordering
                    if app_label == "auth":
                        app_index = len(menus_) - 1
                    elif app_label == "xadmin":
                        app_index = len(menus_) - 2
                    else:
                        app_index = appL.orderIndex_
                # find app icon
                if app_label.lower() in self.apps_icons:
                    app_icon = self.apps_icons[app_label.lower()]
                nav_menu[app_key] = {
                    "orderIndex": app_index,
                    'title': app_title,
                    'menus': [model_dict],
                }
            app_menu = nav_menu[app_key]
            if app_icon:
                app_menu['first_icon'] = app_icon
            elif ('first_icon' not in app_menu or
                  app_menu['first_icon'] == self.default_model_icon) and model_dict.get('icon'):
                app_menu['first_icon'] = model_dict['icon']

            if 'first_url' not in app_menu and model_dict.get('url'):
                app_menu['first_url'] = model_dict['url']

        for menu in nav_menu.values():
            menu['menus'].sort(key=sortkeypicker(['order', 'title']))

        nav_menu = list(nav_menu.values())
        # nav_menu.sort(key=lambda x: x['title'])
        # 左侧菜单自定义排序新增
        nav_menu.sort(key=sortkeypicker(['orderIndex']))
        site_menu.extend(nav_menu)
        return site_menu


# xadmin中这里是继承object，不再是继承admin
class EmailVerifyRecordAdmin(object):
    # 显示的列
    list_display = ['code', 'email', 'send_type', 'send_time']
    # 搜索的字段
    search_fields = ['code', 'email', 'send_type']
    # 过滤
    list_filter = ['code', 'email', 'send_type', 'send_time']


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)

# 将基本配置管理与view绑定
xadmin.site.register(views.BaseAdminView, BaseSetting)

# 将title和footer信息进行注册
xadmin.site.register(views.CommAdminView, GlobalSettings)
