from django.db import models


class News(models.Model):
    title = models.CharField(max_length=255)
    article = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "news"
