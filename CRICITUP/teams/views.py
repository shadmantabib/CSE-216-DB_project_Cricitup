from django.shortcuts import render
from django.db import connection

def team_records(request):
    # Execute the SQL query
    with connection.cursor() as cursor:
        cursor.callproc('RESET_RATING')
        cursor.callproc('Rating_Update')
        # cursor.fetchall()
        # transaction.commit()  # Ensure the transaction is committed
        cursor.execute("SELECT TEAM_ID,Team_Name, TEAM_RATING, ROWNUM AS Team_Rank FROM ( SELECT TEAM_ID,Team_Name, TEAM_RATING FROM Team ORDER BY TEAM_RATING DESC ) ranked_teams")
        teams = cursor.fetchall()

    # Prepare the data for rendering
    team_records = [{'Team_id': team[0], 'Team_Name': team[1],'Team_rank':team[3]} for team in teams]

    return render(request, 'teams/teams.html', {'teams': team_records})
    return render(request, 'cricitup/index.html', {'teams': team_records})

def team_detail(request, team_id):
    # Execute the SQL query to fetch team details
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT Team_id, Team_Name
            FROM Team
            WHERE Team_id = %s
        """, [team_id])
        team = cursor.fetchone()  # Fetch the result
        team_stats_rows=[]
        all_matches=[]
        players=[]
    
        # Call the function to get the hosted series count
        team_name = team[1]  # Extract the team name from the query result

        # Call the function using callfunc
        hosted_series_count = cursor.callfunc('GetHostedSeriesCountForTeam', int, [team_name])
        win_series_count = cursor.callfunc('GetSeriesWinsForTeam', int, [team[0]])
        
        # Retrieve team stats using SQL query
        cursor.execute("""
    SELECT statId,
           NVL(noOfWins, 0) ,
           NVL(noOfLosses, 0) ,
           NVL(pointsSoFar, 0)
    FROM Team_Stats
    WHERE Team_id = %s
""", [team_id])
        team_stats_rows = cursor.fetchone()  # Fetch the team stats rows

        query="""
SELECT MATCH_ID,
           (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM1_ID) || ' vs ' || (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM2_ID) || ' -' || MATCH_ID AS NAME,
           MAN_OF_THE_MATCH,WEATHER,WINNER,(SELECT ADDRESS FROM VENUE V WHERE V.VENUE_ID=M.VENUE_ID) GROUND
    FROM MATCH M
		WHERE TEAM1_ID=%s OR TEAM2_ID=%s
		
"""
        query2="""
		SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
		WHERE pl.TEAM_ID=%s
"""
        cursor.execute(query,[team_id,team_id])
        all_matches=cursor.fetchall()
        cursor.execute(query2,[team_id])
        players=cursor.fetchall()

        context = {
            'team': team,
            'hosted_series_count': hosted_series_count,
            'win_series_count': win_series_count,
            'team_stats_rows': team_stats_rows,
            'all_matches':all_matches,
            'players':players
        }
        
    return render(request, 'teams/team_detail.html', context)


