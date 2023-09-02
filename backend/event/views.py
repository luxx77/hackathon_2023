from django.shortcuts import render
from django.http import Http404

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import APIView

from .models import Event, EventType
from .serializers import EventSerializer, EventTypeSerializer


class EventList(APIView):
    def get(self, request, format=None):
        events = Event.objects.all()
        datas = []
        for x in events:
            data = {
                'id': x.id,
                'text': x.text,
                'event_type': x.event_type.name,
                'location': x.location,
                'created_at': x.created_at.ctime(),
            }
            datas.append(data)

        return Response(datas)

    def post(self, request, format=None):
        serializer = EventSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class EventDetail(APIView):
    def get_object(self, pk):
        try:
            return Event.objects.get(pk=pk)
        except Event.DoesNotExist:
            return Http404

    def get(self, request, pk, format=None):
        event = self.get_object(pk=pk)
        serializer = EventSerializer(event)
        return Response(serializer.data)


class EventTypeList(APIView):
    def get(self, request, format=None):
        eventtypes = EventType.objects.all()
        datas = []
        for x in eventtypes:
            data = {
                'id': x.id,
                'name': x.name,
            }
            datas.append(data)

        return Response(datas)

    def post(self, request, format=None):
        serializer = EventTypeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class EventLast(APIView):
    def get(self, request, format=None):
        event = Event.objects.all().last()
        data = {
                'id': event.id,
                'text': event.text,
                'event_type': event.event_type.name,
                'location': event.location,
                'created_at': event.created_at.ctime(),
            }
        return Response(data)
