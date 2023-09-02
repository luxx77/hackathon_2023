from rest_framework import serializers

from .models import SosStatement

class SosSerializer(serializers.ModelSerializer):
    class Meta:
        model = SosStatement
        fields = "__all__"