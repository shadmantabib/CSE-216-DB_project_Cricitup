from django.shortcuts import render

# Create your views here.
from django.contrib import admin
from django.urls import path, include
from . import views

app_name='grounds'
urlpatterns = [
    # path('', views.home, name='home'),
    # path('teams/', views.teams, name='teams'),
    # path('players/',views.players,name='players'),
    path('', views.grounds, name='grounds'),
    path('grounds/<int:venue_id>/', views.ground_details, name='ground_details'),

]