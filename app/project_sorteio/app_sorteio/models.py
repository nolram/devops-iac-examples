from django.db import models


class Winner(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    winner_name = models.CharField(max_length=255)
    createdAt = models.DateTimeField(auto_created=True)
