import os
from multiprocessing import cpu_count

bind=["127.0.0.1:8000"]   #配置nginx时，需要将此地址写入nginx配置文件中
daemon = True  #守护进程
workers = cpu_count()*2
worker_class = "gevent"
forworded_allow_ips = '*'


keepalive = 6
timeout = 65
graceful_timeout = 10
worker_connections = 65535