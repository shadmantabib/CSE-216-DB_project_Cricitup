from django.contrib import admin
from django.urls import path, include
from . import views
app_name='deletseries'
urlpatterns = [
    path('', views.deleteseries, name='deleteseries'),
    path('series/delete/<int:series_id>/', views.delete_series, name='delete_series')
]