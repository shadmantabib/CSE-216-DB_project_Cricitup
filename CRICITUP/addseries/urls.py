from django.contrib import admin
from django.urls import path, include
from . import views
app_name="addseries"

urlpatterns = [
    path('', views.addseries, name='addseries'),
]