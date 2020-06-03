#! /bin/bash

#gunicorn --bind 0.0.0.0:8000 chatapp.wsgi:application

sudo cp /home/$USER/chatappAutomation/scripts/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
