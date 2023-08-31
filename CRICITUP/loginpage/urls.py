from django.contrib import admin
from django.urls import path,include
from . import views
app_name = 'loginpage'
urlpatterns = [
    path('', views.loginuser, name='login'),
    path('signup/', include('signup.urls')),
    path('admin/', include('adminpage.urls')),
]