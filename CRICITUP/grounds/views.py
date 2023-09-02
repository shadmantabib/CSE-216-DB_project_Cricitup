from django.shortcuts import render
from django.db import connection

def home(request):
    return render(request, 'cricitup/index.html')


def teams(request):
    return render(request, 'cricitup/team.html')

def players(request):
    return render(request, 'players/players.html')
def grounds(request):
    with connection.cursor() as cursor:
        query = """
        SELECT
            V.VENUE_ID,
            V.ADDRESS,
            V.CITY,
            V.STREET_NO,
			V.IMAGEURL
        FROM VENUE V
        """
        cursor.execute(query)
        venues_data = cursor.fetchall()

    context = {
        'venues': venues_data
    }

    return render(request, 'grounds/grounds.html', context)
