from django.db import models


class EventType(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name
    


class Event(models.Model):
    event_type = models.ForeignKey(EventType,
                                  null=True,
                                  on_delete=models.SET_NULL)
    text = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.event_type.name
    