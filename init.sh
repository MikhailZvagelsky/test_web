#! /bin/bash
#
# clone project to /home/box/web
# git clone https://github.com/Mikhail_Zvagelsky/test_web.git /home/box/web
#
# execute this script
# bash /home/box/web/init.sh
#
# create symbolic link to nginx config
sudo ﻿ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
# remove nginx defaul server config
sudo rm /etc/nginx/sites-enabled/default
# start nginx
sudo /etc/init.d/nginx restart
# create symbolic link to gunicorn config file
sudo ln -s /home/box/web/etc/hello.py   /etc/gunicorn.d/hello.py
#
# gunicorn server configuration should be in /etc/gunicorn.d
# To use wsgi module (the python file name without ".py" extension) 
# and wsgi function from that module specify it as parameters:
# gunicorn -c config_file wsgi_module:wsgi_function
gunicorn -c /etc/gunicorn.d/hello.py hello:application
#sudo /etc/init.d/gunicorn restart
#
# test gunicorn settings with curl
# curl -vv "http://127.0.0.1/hello/?a=b&a=1&b=2;"
# curl -vv "http://localhost:8080/?a=b&a=1&b=2;"
