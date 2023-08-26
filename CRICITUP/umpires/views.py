from django.shortcuts import render
from django.db import connection

def home(request):
    return render(request, 'cricitup/index.html')


def teams(request):
    return render(request, 'cricitup/team.html')

def players(request):
    return render(request, 'players/players.html')

def umpires_list(request):
    with connection.cursor() as cursor:
        query = """
        SELECT
            (P.FIRST_NAME || ' ' || P.LAST_NAME) AS FULL_NAME,
            P.NATIONALITY,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AS AGE,
            IMAGE_URL
        FROM UMPIRE C
        JOIN PERSON P ON C.PERSONID = P.PERSONID
        """
        cursor.execute(query)
        umpires_data = cursor.fetchall()

    context = {
        'umpires': umpires_data 
    }

    return render(request, 'umpires/umpires.html', context)

