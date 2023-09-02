from django.contrib.auth.models import User

from rest_framework import generics, status
from rest_framework.decorators import APIView
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from .serializers import RegisterSerializer

from django.contrib.auth import authenticate


class RegisterView(APIView):
    def post(self, request, format=None):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({"message" : user})
        # print("POSTED")
        # username = request.data["username"]
        # password = request.data["password"]
        # password2 = request.data["password2"]
        # first_name = request.data["first_name"]
        # last_name = request.data["last_name"]
        # print("POSTED AGAIN")
        # if password != password2:
        #     return Response({"message" : "Passwords don't match"}, status=status.HTTP_400_BAD_REQUEST)

        # user = User.objects.create_user(username=username, password=password)
        # user.first_name = first_name
        # user.last_name = last_name
        # user.save()
        # return Response({"message" : user.id})

# class LoginView(APIView):
#     def post(self, request, format=None):
#         username = request.data['username']
#         password = request.data['password']
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             return Res


# {
#  "username":"username",
#  "password":"adminadmin",
#  "password2":"adminadmin",
# "first_name" : "ROwsen",
# "last_name" : "Bayramov",
# }