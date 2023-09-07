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
    cursor = connection.cursor()

    cursor.execute(sql_query, [player_id])
    player_data = cursor.fetchone()
        
    if player_data:
        player_name = player_data[0]
        player_nationality = player_data[1]
        player_age = player_data[2]
        player_image_url  = player_data[3]

    else:
        player_name = "Unknown"
        player_nationality = "Unknown"
        player_age = "Unknown"
        player_image_url = None

    cursor.execute(sql_query_2,[player_id])
    player_stat=cursor.fetchone()
    first_team_batting=[]
    first_team_bowling=[]
    # Define the SQL query using placeholders for parameters
    query = """
    SELECT 
    (SELECT MU.MATCH_ID FROM MATCH_UMPIRE MU WHERE MU.umpire_id = %s) AS MATCH_ID,
    (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID = M.TEAM1_ID) || ' vs ' || (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID = M.TEAM2_ID) || ' -' || (SELECT MU.MATCH_ID FROM MATCH_UMPIRE MU WHERE MU.umpire_id = %s) AS NAME,
    M.MAN_OF_THE_MATCH,
    M.WEATHER,
    M.WINNER,
    (SELECT ADDRESS FROM VENUE V WHERE V.VENUE_ID = M.VENUE_ID) AS GROUND
    FROM MATCH M
    JOIN MATCH_Umpire MU ON MU.MATCH_ID = M.MATCH_ID
    WHERE MU.umpire_id = %s;

    
    """
    query2="""SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , TOTAL_RUNS AS RUN ,TOTAL_BALLS_FACED AS BALL,TOTAL_SIXES_HIT AS SIX,TOTAL_FOURS_HIT AS FOUR  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s )
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s))
	ORDER by player_id
"""
    query3="""
 SELECT (SELECT team_name from team t where t.team_id=m.team1_id) name   from match m
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)
"""
    query4="""
	SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , OVERS_BOWLED AS OVER ,TAKEN_WICKETS AS WICKET,GIVEN_TOTAL_RUNS AS RUN,MAIDEN_OVERS_GIVEN AS MAIDEN  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id%s)))
	AND OVERS_BOWLED>0
	ORDER by player_id
	
"""
    query5="""
SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , TOTAL_RUNS AS RUN ,TOTAL_BALLS_FACED AS BALL,TOTAL_SIXES_HIT AS SIX,TOTAL_FOURS_HIT AS FOUR  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)))
	ORDER by player_id
"""
    query6="""
	SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , OVERS_BOWLED AS OVER ,TAKEN_WICKETS AS WICKET,GIVEN_TOTAL_RUNS AS RUN,MAIDEN_OVERS_GIVEN AS MAIDEN  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)))
	AND OVERS_BOWLED>0
	ORDER by player_id
	
"""    
    query7="""
 SELECT (SELECT team_name from team t where t.team_id=m.team2_id) name   from match m
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)
"""
    query8="""
SELECT SUM(TOTAL_RUNS) AS RUN  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE PERSONID=%s)
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)))
	ORDER by player_id
"""
    query9="""
SELECT SUM(TOTAL_RUNS) AS RUN  FROM SCORECARD S
	WHERE match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE PERSONID=%s)
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=(SELECT MATCH_ID FROM MATCH_UMPIRE WHERE umpire_id=%s)))
	ORDER by player_id
"""

    # Execute the PL/SQL query to fetch team details
    select_match_id_query = "SELECT match_id FROM match_umpire WHERE UMPIRE_ID = %s"

    cursor.execute(select_match_id_query, (player_id,))

    match_id = cursor.fetchone()[0]
    with connection.cursor() as cursor:
        cursor.execute(query, [player_id])
        match = cursor.fetchone()  # Fetch the result
        match_winner=cursor.callfunc('Find_Match_Winner',str,[match_id])
        highest_scorer=cursor.callfunc('Find_Highest_Scorer',str,[match_id])

        cursor.execute(query2,[match_id,match_id])
        first_team_batting=cursor.fetchall()
        cursor.execute(query3, [match_id])
        first_team_name=cursor.fetchone()[0]
        cursor.execute(query4,[match_id,match_id])
        first_team_bowling=cursor.fetchall()
        cursor.execute(query5,[match_id,match_id])
        second_team_batting=cursor.fetchall()
        cursor.execute(query7, [match_id])
        second_team_name=cursor.fetchone()[0]
        cursor.execute(query6,[match_id,match_id])
        second_team_bowling=cursor.fetchall()
        cursor.execute(query8,[match_id,match_id])
        first_team_score=cursor.fetchone()[0]
        cursor.execute(query9,[match_id,match_id])
        second_team_score=cursor.fetchone()[0]







    context = {
        'player_id': player_id,
        'player_name': player_name,
        'player_nationality': player_nationality,
        'player_age': player_age,
        'player_image_url': player_image_url,
        'player_stat':player_stat,
        'match': match,
        'match_winner':match_winner,
        'highest_scorer':highest_scorer,
        'first_team_batting':first_team_batting,
        'first_team_name':first_team_name,
        'first_team_bowling':first_team_bowling,
        'second_team_name':second_team_name,
        'second_team_batting':second_team_batting,
        'second_team_bowling':second_team_bowling,
        'first_team_score':first_team_score,
        'second_team_score':second_team_score
    }
    
    
    return render(request, 'umpires/umpires_details.html', context)