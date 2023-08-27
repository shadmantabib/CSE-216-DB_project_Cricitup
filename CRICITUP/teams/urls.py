from django.contrib import admin
from django.urls import path, include
from . import views

app_name='teams'
urlpatterns = [
    path('',views.team_records,name='teams'),
    path('team/<int:team_id>/', views.team_detail, name='team_detail'),

]
