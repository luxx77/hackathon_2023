from django.db import models
from django.contrib.auth.models import User

class SosStatement(models.Model):
    user = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
    location = models.CharField(max_length=255)
    created_at = models.CharField(max_length=255)

    def __str__(self):
        return str(self.user)
