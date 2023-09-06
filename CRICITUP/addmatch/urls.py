from django.contrib import admin
from django.urls import path, include
from . import views
app_name='addmatch'
urlpatterns = [
    path('', views.addmatch, name='addmatch'),
]