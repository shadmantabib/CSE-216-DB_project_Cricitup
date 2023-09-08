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
            IMAGE_URL,P.PERSONID
        FROM UMPIRE C
        JOIN PERSON P ON C.PERSONID = P.PERSONID
        """
        cursor.execute(query)
        umpires_data = cursor.fetchall()

    context = {
        'umpires': umpires_data 
    }

    return render(request, 'umpires/umpires.html', context)

def umpires_details(request, player_id):
    player_stat=[]
    sql_query = """
        SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, 
               EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,
               IMAGE_URL
        FROM PERSON PR
        JOIN UMPIRE PL ON PL.PERSONID = PR.PERSONID
        WHERE PL.PERSONID = %s
    """
    sql_query_2="""SELECT DISTINCT COUNT(MATCH_ID) FROM MATCH_UMPIRE WHERE UMPIRE_ID = %s
"""
    
    sql_query_3 = """
    
   SELECT MU.MATCH_ID AS MID, (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID=T.TEAM1_ID)||' VS '||(SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID=T.TEAM2_ID)||'-'||MU.MATCH_ID  AS TEAMS,(SELECT ADDRESS FROM VENUE WHERE VENUE_ID=T.VENUE_ID) AS GROUND
FROM MATCH_UMPIRE MU
JOIN MATCH T ON MU.MATCH_ID = T.MATCH_ID
WHERE MU.UMPIRE_ID  =%s
    """

    cursor = connection.cursor()

    # First Query Execution
    cursor.execute(sql_query, [player_id])
    player_data = cursor.fetchone()

    if player_data:
        player_name = player_data[0]
        player_nationality = player_data[1]
        player_age = player_data[2]
        player_image_url = player_data[3]
    else:
        player_name = "Unknown"
        player_nationality = "Unknown"
        player_age = "Unknown"
        player_image_url = None

    # Second Query Execution
    cursor.execute(sql_query_2, [player_id])
    player_stat = cursor.fetchone()

    # Third Query Execution
    
    print("Player ID:", player_id)

    # Then execute the query
    cursor.execute(sql_query_3, [player_id])
    print("After Query 3 Execution")
    all_matches = cursor.fetchall()

    context = {
        'player_id': player_id,
        'player_name': player_name,
        'player_nationality': player_nationality,
        'player_age': player_age,
        'player_image_url': player_image_url,
        'player_stat': player_stat,
        'all_matches': all_matches
    }

    # Make sure to close the cursor
    cursor.close()
    
    
    return render(request, 'umpires/umpires_details.html', context)