from django.shortcuts import render
from django.db import connection


def players(request):
    players = []
    players_batting_rank=[]
    allplayers=1

    with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
            cursor.execute(sql_query)
            players = cursor.fetchall()

    context = {
        'players': players,
        'players_batting_rank':players_batting_rank,
        'allplayers':allplayers
    }

    return render(request, 'players/players1.html', context)


def get_players_by_country(request):

    country = request.GET.get('country')
    players = []
    players_batting_rank=[]

    if country:
        with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID WHERE PR.NATIONALITY= :country"
            cursor.execute(sql_query, {'country': country})
            players = cursor.fetchall()

    context = {
        'selected_country': country,
        'players': players,
        'players_batting_rank':players_batting_rank
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
    sql_query_3="""
SELECT WICKETS,FIVE_WICKETS,NO_OF_OVERS,BOWLING_AVG,BOWLING_STRIKE_RATE,NVL(NO_OF_HATRICKS,0) HATRICKS,PLAYERID,GIVENRUN
FROM BOWLING_STAT
WHERE playerid=%s"""
    cursor.execute(sql_query_3,[player_id])
    bowling_stat=cursor.fetchone()

        
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
        'player_stat':player_stat,
        'bowling_stat':bowling_stat,

    }
    
    return render(request, 'players/pd.html', context)


def show_all_players(request):
    players = []
    players_batting_rank=[]
    players_bowling_rank=[]
    allplayers=1
    with connection.cursor() as cursor:
            sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
            cursor.execute(sql_query)
            players = cursor.fetchall()

    context = {
        'players': players,
        'allplayers':allplayers
    }

    return render(request, 'players/players1.html', context)
def get_players_by_batting_rank(request):
    players=[]
    players_batting_rank=[]
    players_bowling_rank=[]

    cursor=connection.cursor()
    sql_query="""
 SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE,
EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,
IMAGE_URL,DENSE_RANK() OVER (ORDER BY  NVL(NVL(TOTAL_RUN,0)*AVG,0) DESC) AS RANK,PL.PLAYERID
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
				JOIN BATTING_STAT BS  ON PL.PLAYERID=BS.PLAYERID
				ORDER BY  NVL(NVL(TOTAL_RUN,0)*AVG,0) DESC
				

"""
    cursor.execute(sql_query)
    players_batting_rank=cursor.fetchall()
    cursor.callproc('UPDATE_BATTING_RANK')


    context={
          'players':players,
          'players_batting_rank':players_batting_rank,
          'players_bowling_rank':players_bowling_rank
     }
    return render(request, 'players/players1.html', context)
def get_players_by_bowling_rank(request):
    players=[]
    players_batting_rank=[]
    players_bowling_rank=[]
    cursor=connection.cursor()
    sql_query="""
 SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE,
EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,
IMAGE_URL,DENSE_RANK() OVER (ORDER BY  NVL(NVL(BOWLING_AVG,0)/NVL(BS.WICKETS,0),0) ASC) AS RANK,PL.PLAYERID
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
				JOIN BOWLING_STAT BS  ON PL.PLAYERID=BS.PLAYERID
				WHERE WICKETS >0 

				

"""
    cursor.execute(sql_query)
    players_bowling_rank=cursor.fetchall()
    cursor.callproc('UPDATE_BOWLING_RANK')


    context={
          'players':players,
          'players_batting_rank':players_batting_rank,
          'players_bowling_rank':players_bowling_rank
     }
    return render(request, 'players/players1.html', context)

def searchPlayer(request):
    name = request.GET.get('name')
    players = []

    if name:
        with connection.cursor() as cursor:
            sql_query = """
                SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE, IMAGE_URL, PLAYERID 
                FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID  
                WHERE LOWER((FIRST_NAME ||' '||LAST_NAME)) LIKE %s
            """
            cursor.execute(sql_query, ('{}%'.format(name.lower()),))
            players = cursor.fetchall()

    context = {
        'players': players,
    }
    return render(request, 'players/players1.html', context)
