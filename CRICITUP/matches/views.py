from django.shortcuts import render
from django.db import connection
from django.db import transaction

def matches_view(request):
    with connection.cursor() as cursor:
        
        
        query = """
        SELECT MATCH_ID,
               (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM1_ID) || ' vs ' ||
               (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM2_ID) || ' -' || MATCH_ID AS NAME
        FROM MATCH M
        """
        cursor.execute(query)
        results = cursor.fetchall()
     

    


    context = {'matches': results}
    return render(request, 'matches/matches.html', context)
def match_details(request, match_id):
    first_team_batting=[]
    first_team_bowling=[]
    # Define the SQL query using placeholders for parameters
    query = """
    SELECT MATCH_ID,
           (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM1_ID) || ' vs ' || (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM2_ID) || ' -' || MATCH_ID AS NAME,
           MAN_OF_THE_MATCH,WEATHER,WINNER,(SELECT ADDRESS FROM VENUE V WHERE V.VENUE_ID=M.VENUE_ID) GROUND
    FROM MATCH M
		
    WHERE MATCH_ID = %s
    """
    query2="""SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , TOTAL_RUNS AS RUN ,TOTAL_BALLS_FACED AS BALL,TOTAL_SIXES_HIT AS SIX,TOTAL_FOURS_HIT AS FOUR  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=%s))
	ORDER by player_id
"""
    query3="""
 SELECT (SELECT team_name from team t where t.team_id=m.team1_id) name   from match m
	where match_id=%s
"""
    query4="""
	SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , OVERS_BOWLED AS OVER ,TAKEN_WICKETS AS WICKET,GIVEN_TOTAL_RUNS AS RUN,MAIDEN_OVERS_GIVEN AS MAIDEN  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=%s))
	AND OVERS_BOWLED>0
	ORDER by player_id
	
"""
    query5="""
SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , TOTAL_RUNS AS RUN ,TOTAL_BALLS_FACED AS BALL,TOTAL_SIXES_HIT AS SIX,TOTAL_FOURS_HIT AS FOUR  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=%s))
	ORDER by player_id
"""
    query6="""
	SELECT PLAYER_ID,(SELECT (FIRST_NAME||' '||LAST_NAME) FROM PERSON PR WHERE PR.PERSONID=S.PLAYER_ID) NAME , OVERS_BOWLED AS OVER ,TAKEN_WICKETS AS WICKET,GIVEN_TOTAL_RUNS AS RUN,MAIDEN_OVERS_GIVEN AS MAIDEN  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=%s))
	AND OVERS_BOWLED>0
	ORDER by player_id
	
"""    
    query7="""
 SELECT (SELECT team_name from team t where t.team_id=m.team2_id) name   from match m
	where match_id=%s
"""
    query8="""
SELECT SUM(TOTAL_RUNS) AS RUN  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team1_id from match
	where match_id=%s))
	ORDER by player_id
"""
    query9="""
SELECT SUM(TOTAL_RUNS) AS RUN  FROM SCORECARD S
	WHERE match_id=%s
	AND player_id IN (	SELECT PLAYERID player_id from player where team_id =(	SELECT team2_id from match
	where match_id=%s))
	ORDER by player_id
"""
    query10="""SELECT UMPIRE_ID,(FIRST_NAME||' '||LAST_NAME) NAME FROM MATCH_UMPIRE M JOIN PERSON P
ON M.UMPIRE_ID=P.PERSONID
WHERE MATCH_ID=%s"""

    # Execute the PL/SQL query to fetch team details
    with connection.cursor() as cursor:
        cursor.execute(query, [match_id])
        match = cursor.fetchone()  # Fetch the result
        match_winner=cursor.callfunc('Find_Match_Winner',str,[match_id])
        highest_scorer=cursor.callfunc('Find_Highest_Scorer',str,[match_id])
        higest_wicket_taker=cursor.callfunc('Find_Highest_Wicket_Taker',str,[match_id])

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
        cursor.execute(query10,[match_id])
        match_umpires=cursor.fetchone()








    context = {
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
        'second_team_score':second_team_score,
        'highest_wicket_taker':higest_wicket_taker,
        'match_umpires':match_umpires
    }
    return render(request, 'matches/match_details.html', context)
