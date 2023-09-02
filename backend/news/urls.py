from django.urls import path

from . import views

urlpatterns = [
    path('news/', views.NewsList.as_view()),
    path('news/<str:pk>/', views.NewsDetail.as_view()),
]
