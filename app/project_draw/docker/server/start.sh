#!/usr/bin/env bash
# start.sh
(cd project_draw; python manage.py migrate --no-input)
(cd project_draw; gunicorn project_draw.wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"