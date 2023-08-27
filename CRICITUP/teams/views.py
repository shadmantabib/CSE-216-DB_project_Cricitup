from django.shortcuts import render
from django.db import connection

def team_records(request):
    # Execute the SQL query
    with connection.cursor() as cursor:
        cursor.execute("SELECT Team_id, Team_Name FROM Team order by team_rating")
        teams = cursor.fetchall()

    # Prepare the data for rendering
    team_records = [{'Team_id': team[0], 'Team_Name': team[1]} for team in teams]

    return render(request, 'teams/teams.html', {'teams': team_records})

def team_detail(request, team_id):
    # Execute the PL/SQL query to fetch team details
    with connection.cursor() as cursor:
        cursor.execute("SELECT Team_id, Team_Name FROM Team WHERE Team_id = %s", [team_id])
        team = cursor.fetchone()  # Fetch the result
    
    context = {
        'team': team
    }
    return render(request, 'teams/team_detail.html', context)
