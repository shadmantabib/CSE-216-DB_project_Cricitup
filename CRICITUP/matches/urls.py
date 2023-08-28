from django.contrib import admin
from django.urls import path, include
from . import views

app_name='matches'
urlpatterns = [
    path('',views.matches_view,name='matches'),
    path('match/<int:match_id>/', views.match_details, name='match_details'),

]