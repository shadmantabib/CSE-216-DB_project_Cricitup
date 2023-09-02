from django.contrib import admin
from django.urls import path, include
from . import views

app_name='players'
urlpatterns = [
    path('',views.players,name='players'),
    path('get-players-by-country/', views.get_players_by_country, name='get_players_by_country'),
    path('players/<int:player_id>/', views.players_details, name='players_details'),
    path('show-all-players/',views.show_all_players,name='show_all_players')

]
