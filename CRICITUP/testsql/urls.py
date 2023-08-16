from django.urls import path
from . import views

# urlpatterns=[

#     path('hello/',views.check_sql)
# ]

app_name = 'testsql'

urlpatterns = [
    path('hello/', views.get_players_by_country, name='get_players_by_country')
]
