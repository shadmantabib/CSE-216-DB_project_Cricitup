from django.shortcuts import render

# Create your views here.
from django.contrib import admin
from django.urls import path, include
from . import views

app_name='umpires'
urlpatterns = [
    # path('', views.home, name='home'),
    # path('teams/', views.teams, name='teams'),
    # path('players/',views.players,name='players'),
     path('umpires/<int:player_id>/', views.umpires_details, name='umpires_details'),
    path('', views.umpires_list, name='umpires'),
]