from django.contrib import admin
from django.urls import path, include
from . import views

app_name='dream11'
urlpatterns = [
    path('', views.make_your_dream11, name='make_your_dream11'),
    path('add_player_to_dream11/', views.add_player_to_dream11, name='add_player_to_dream11'),
    path('remove_player_from_dream11/', views.remove_player_from_dream11, name='remove_player_from_dream11'),
    path('get_player_id_by_name/', views.get_player_id_by_name, name='get_player_id_by_name'),



]