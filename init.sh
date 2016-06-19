#! /bin/bash

# clone project to /home/box/web
# git clone https://github.com/Mikhail_Zvagelsky/test_web.git /home/box/web

# execute this script
# bash /home/box/web/init.sh

# create symbolic link from project
sudo ﻿ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart

sudo ln -s /home/box/web/etc/hello.py   /etc/gunicorn.d/hello.py

# Server configuration config-file should be in /etc/gunicorn.d
# To use wsgi module (the python file name without ".py" extension) 
# wsgi_module and wsgi function
# wsgi_function from that module specify it as parameters.
# gunicorn -c config_file wsgi_module:wsgi_function
gunicorn -c /etc/gunicorn.d/hello.py hello:application
#sudo /etc/init.d/gunicorn restart

# test gunicorn settings with curl
# curl -I http://127.0.0.1/hello/?a=b﻿
# curl -vv http://127.0.0.1/hello/?a=b&a=1&b=2;
# curl -I http://localhost:8080/?a=b


