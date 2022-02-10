FROM debian
RUN apt-get update && apt-get install -y python3-pip python3-dev default-libmysqlclient-dev build-essential && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY django_tutorial /usr/share/django_tutorial
WORKDIR /usr/share/django_tutorial
RUN pip3 install --no-cache-dir -r requirements.txt
ENV DJANGO_SUPERUSER_PASSWORD="admin"
ENV DJANGO_SUPERUSER_USERNAME="admin"
ENV DJANGO_SUPERUSER_EMAIL="admin@gmail.com"
ADD script.sh /var
RUN chmod +x /var/script.sh
EXPOSE 3000
CMD ["/bin/bash", "/var/script.sh"]
