from django.shortcuts import render
from django.db import connection


def players(request):
    players = []

    with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
            cursor.execute(sql_query)
            players = cursor.fetchall()

    context = {
        'players': players
    }

    return render(request, 'players/players1.html', context)


def get_players_by_country(request):

    country = request.GET.get('country')
    players = []

    if country:
        with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID WHERE PR.NATIONALITY= :country"
            cursor.execute(sql_query, {'country': country})
            players = cursor.fetchall()

    context = {
        'selected_country': country,
        'players': players
    }

    return render(request, 'players/players1.html', context)
def players_details(request, player_id):
    player_stat=[]
    sql_query = """
        SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE,
               EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,
               IMAGE_URL
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
        WHERE PL.PLAYERID = %s
    """
    sql_query_2="""SELECT hundreds,fifties,total_run,avg,str_rate,totalsix,totalfours,totalball,totalmatch from batting_stat where playerid=%s
"""
    cursor = connection.cursor()

    cursor.execute(sql_query, [player_id])
    player_data = cursor.fetchone()
        
    if player_data:
        player_name = player_data[0]
        player_nationality = player_data[1]
        player_type = player_data[2]
        player_age = player_data[3]
        player_image_url = player_data[4]

    else:
        player_name = "Unknown"
        player_nationality = "Unknown"
        player_type = "Unknown"
        player_age = "Unknown"
        player_image_url = None

    cursor.execute(sql_query_2,[player_id])
    player_stat=cursor.fetchone()
    
    context = {
        'player_id': player_id,
        'player_name': player_name,
        'player_nationality': player_nationality,
        'player_type': player_type,
        'player_age': player_age,
        'player_image_url': player_image_url,
        'player_stat':player_stat

    }
    
    return render(request, 'players/pd.html', context)


def show_all_players(request):
    players = []

    with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
            cursor.execute(sql_query)
            players = cursor.fetchall()

    context = {
        'players': players
    }

    return render(request, 'players/players1.html', context)
