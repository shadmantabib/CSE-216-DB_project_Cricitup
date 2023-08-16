from django.shortcuts import render
from django.db import connection

def get_players_by_country(request):
    country = request.GET.get('country')
    players = []

    if country:
        with connection.cursor() as cursor:
            sql_query = "SELECT first_name, last_name, nationality FROM Person WHERE nationality = :country"
            cursor.execute(sql_query, {'country': country})
            players = cursor.fetchall()

    context = {
        'selected_country': country,
        'players': players
    }

    return render(request, 'testsql/player_list.html', context)
