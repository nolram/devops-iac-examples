#!/usr/bin/env bash
# start.sh

MIGRATE="${APPLY_MIGRATION:-false}"

if [ "$MIGRATE" = "true" ]; then
    echo "Applying migration"
    (cd project_draw; python manage.py wait_for_db)
    (cd project_draw; python manage.py migrate --no-input)
fi

(cd project_draw; gunicorn project_draw.wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"