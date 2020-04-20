#!/bin/bash

# Installing packages
sudo apt-get update
sudo apt-get install python3-pip python3-dev nginx gunicorn git -y

# Installing Virtual Environment
sudo apt-get update
pip3 install virtualenv

# Creating Virtual env and activate
cd /home/Revanth/Chatapplication
virtualenv venv
source /home/Revanth/Chatapplication/venv/bin/activate

# Installing Requirements
cd  /home/Revanth/Chatapplication/chatapplication
pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions

# Install gunicorn
pip3 install gunicorn

python3 manage.py collectstatic --noinput


# nginx configuration
sudo cp /home/Revanth/Chatapplication/scripts/nginx /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/chatapplication /etc/nginx/sites-enabled/
# checking ngnix syntax
sudo nginx -t
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart
