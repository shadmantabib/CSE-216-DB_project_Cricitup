from django.shortcuts import render

# Create your views here.
from django.contrib import admin
from django.urls import path, include
from . import views

app_name='adminlog'
urlpatterns = [
    # path('', views.home, name='home'),
    # path('teams/', views.teams, name='teams'),
    # path('players/',views.players,name='players'),
    path('', views.adminlog, name='adminlog'),
     path('clear-log-table/', views.clear_log_table, name='clear_log_table'),
  
]