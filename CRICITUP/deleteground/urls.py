from django.contrib import admin
from django.urls import path, include
from . import views
app_name='deleteground'
urlpatterns = [
    path('', views.deleteground, name='deleteground'),
    path('series/delete/<int:venue_id>/', views.delete_ground, name='delete_ground')
]