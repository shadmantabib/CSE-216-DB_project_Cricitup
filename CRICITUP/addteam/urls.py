from django.contrib import admin
from django.urls import path, include
from . import views
app_name='addteam'
urlpatterns = [
    path('', views.addteam, name='addteam'),
]