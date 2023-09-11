from django.contrib import admin
from django.urls import path, include
from . import views

app_name='dream11'
urlpatterns = [
    path('', views.make_your_dream11, name='make_your_dream11'),
    path('add_player_to_dream11/', views.add_player_to_dream11, name='add_player_to_dream11'),
    path('reset_dream11/', views.reset_dream11, name='reset_dream11'),
    path('removePlayer/<int:playerId>/', views.removePlayer, name='removePlayer'),
    path('showStats/', views.showStats, name='showStats'),
    path('calculate_winning_chance/', views.calculate_winning_chance, name='calculate_winning_chance'),





]