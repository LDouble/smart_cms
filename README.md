# smart_cms

基于`python3.6`和`Django2.2`。   
## demo
[http://[2001:da8:270:2018:f816:3eff:fef4:9a8e]](http://[2001:da8:270:2018:f816:3eff:fef4:9a8e])

# 功能说明
## 服务端主要功能：
- 生产线零配件管理
- 用户订单管理
- 家居信息采集管理
- 用户管理
- 支持restful API
- 数据导出
- 物流信息管理
- 集成了简单的图床功能。

## 用户端注意功能
- 用户注册
- 用户登录
- 用户下单
- 家电配置智能推荐
- 地址信息维护
- 物流查询

## 安装
导入数据库
`mysql -u root -p smart_cms < smart_cms.sql`
使用pip安装：  
`pip install -Ur requirements.txt`
运行demo
`python manage.py runserver`
