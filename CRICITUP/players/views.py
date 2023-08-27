from django.shortcuts import render
from django.db import connection


def players(request):
    return render(request, 'players/players1.html')

def get_players_by_country(request):

    country = request.GET.get('country')
    players = []

    if country:
        with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID WHERE PR.NATIONALITY= :country"
            cursor.execute(sql_query, {'country': country})
            players = cursor.fetchall()

    context = {
        'selected_country': country,
        'players': players
    }

    return render(request, 'players/players1.html', context)
