from django.contrib import admin
from django.urls import path, include
from . import views

app_name='series'
urlpatterns = [
    path('',views.series_records,name='series'),
    path('series/<int:series_id>/', views.series_detail, name='series_detail'),

]
