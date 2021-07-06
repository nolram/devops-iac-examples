# Dockerfile

FROM python:3.8-buster

# install nginx
RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY docker/nginx/nginx.default /etc/nginx/sites-available/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/project_draw
COPY requirements.txt docker/server/start.sh /opt/app/
WORKDIR /opt/app
RUN pip install -r requirements.txt
COPY . /opt/app/project_draw/
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8010
STOPSIGNAL SIGTERM
CMD ["/opt/app/start.sh"]