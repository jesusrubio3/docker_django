#!/bin/bash
sleep 20
rm django_tutorial/django_tutorial/settings.py
mv django_tutorial/django_tutorial/settings2.py settings.py
python3 manage.py migrate
python3 manage.py createsuperuser --noinput
python3 manage.py runserver 0.0.0.0:80
