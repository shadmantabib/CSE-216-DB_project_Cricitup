from django.contrib import admin
from django.urls import path, include
from . import views
app_name='deletematch'
urlpatterns = [
    path('', views.deletematch, name='deletematch'),
    path('match/delete/<int:match_id>/', views.delete_match, name='delete_match'),
]