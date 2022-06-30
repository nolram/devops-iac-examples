import time

from django.db import connection
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = """Django command that waits for database to be available"""

    def add_arguments(self, parser):
        parser.add_argument(
            '--retries',
            nargs='?',
            type=int,
            help='Number of retries before exiting',
            default=3,
        )

    def handle(self, *args, **options):
        """Handle the command"""
        retries = options['retries']
        self.stdout.write('Waiting for database...')
        db_conn = None
        for i in range(retries):
            try:
                connection.ensure_connection()
                db_conn = True
            except OperationalError:
                self.stdout.write(f'Retry: {i} - Database unavailable, waiting 1 second...')
                time.sleep(1)

        if db_conn:
            self.stdout.write(self.style.SUCCESS('Database available!'))
        else:
            self.stdout.write(self.style.ERROR('Database unavailable!'))