from django.shortcuts import render
from django.http import Http404

from rest_framework import status
from rest_framework.decorators import APIView
from rest_framework.response import Response

from .models import SosStatement
from .serializers import SosSerializer


class SosList(APIView):
    def get(self, request, format=None):
        soslist = SosStatement.objects.all()
        serializer = SosSerializer(soslist, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = SosSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)


class SosDetail(APIView):
    def get_object(self, pk):
        try:
            return SosStatement.objects.get(pk=pk)
        except SosStatement.DoesNotExist:
            return Http404

    def get(self, request, pk, format=None):
        sos_statement = self.get_object(pk=pk)
        serializer = SosSerializer(sos_statement)
        return Response(serializer.data)

    def delete(self, request, pk, format=None):
        sos_statement = self.get_object(pk=pk)
        sos_statement.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)