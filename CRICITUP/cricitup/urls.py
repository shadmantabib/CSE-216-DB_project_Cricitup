"""
URL configuration for cricitup project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('testsql/',include('testsql.urls')),
    path('test2/',include('test2.urls')),
    #path('', views.index, name='index'),
    path('', include('home.urls')),
    path('players/', include('players.urls', namespace='players')),
    path('coaches/', include('coaches.urls', namespace='coaches')),
    path('umpires/', include('umpires.urls', namespace='umpires')),
    path('teams/', include('teams.urls', namespace='teams')),
    path('login/', include('loginpage.urls', namespace='login')),
    path('signup/', include('signup.urls', namespace='signup')),
    path('adminpage/', include('adminpage.urls', namespace='adminpage')),
    path('addplayer/', include('addplayer.urls', namespace='addplayer')),
    path('addground/', include('addground.urls', namespace='addground')),
    path('addteam/', include('addteam.urls', namespace='addteam')),

    # ...
    path('admin/', admin.site.urls),

    # path('grounds/', include('grounds.urls', namespace='grounds')),



    
]

