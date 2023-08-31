from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [

    path('', views.home, name='home'),
    path('players/', include('players.urls')),  
    path('coaches/', include('coaches.urls')),
    path('umpires/', include('umpires.urls')),
    path('teams/', include('teams.urls')),
    path('matches/', include('matches.urls')),
    path('grounds/', include('grounds.urls')),
    path('login/', include('loginpage.urls')),


]
