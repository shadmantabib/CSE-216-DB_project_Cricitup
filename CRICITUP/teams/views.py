from django.shortcuts import render
from django.db import connection

def team_records(request):
    # Execute the SQL query
    with connection.cursor() as cursor:
        cursor.execute("SELECT TEAM_ID,Team_Name, TEAM_RATING, ROWNUM AS Team_Rank FROM ( SELECT TEAM_ID,Team_Name, TEAM_RATING FROM Team ORDER BY TEAM_RATING DESC ) ranked_teams")
        teams = cursor.fetchall()

    # Prepare the data for rendering
    team_records = [{'Team_id': team[0], 'Team_Name': team[1],'Team_rank':team[3]} for team in teams]

    return render(request, 'teams/teams.html', {'teams': team_records})

def team_detail(request, team_id):
    # Execute the SQL query to fetch team details
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT Team_id, Team_Name
            FROM Team
            WHERE Team_id = %s
        """, [team_id])
        team = cursor.fetchone()  # Fetch the result
    
        # Call the function to get the hosted series count
        team_name = team[1]  # Extract the team name from the query result

        # Call the function using callfunc
        hosted_series_count = cursor.callfunc('GetHostedSeriesCountForTeam', int, [team_name])
        win_series_count = cursor.callfunc('GetSeriesWinsForTeam', int, [team[0]])
        
        # Retrieve team stats using SQL query
        cursor.execute("""
    SELECT statId,
           NVL(noOfWins, 0) as noOfWins,
           NVL(noOfLosses, 0) as noOfLosses,
           NVL(noOfDraws, 0) as noOfDraws,
           NVL(matchAbandoned, 0) as matchAbandoned,
           NVL(matchNotPlayed, 0) as matchNotPlayed,
           NVL(pointsSoFar, 0) as pointsSoFar
    FROM Team_Stats
    WHERE Team_id = %s
""", [team_id])
        team_stats_rows = cursor.fetchall()  # Fetch the team stats rows

        context = {
            'team': team,
            'hosted_series_count': hosted_series_count,
            'win_series_count': win_series_count,
            'team_stats_rows': team_stats_rows,  # Pass team stats rows to the context
        }
        
    return render(request, 'teams/team_detail.html', context)

