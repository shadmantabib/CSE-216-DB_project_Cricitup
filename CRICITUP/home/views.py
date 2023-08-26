from django.shortcuts import render
from django.db import connection


def home(request):
    return render(request, 'cricitup/index.html')


def teams(request):
    # Execute the SQL query
    with connection.cursor() as cursor:
        cursor.execute("SELECT Team_Name FROM Team")
        teams = cursor.fetchall()

    # Prepare the data for rendering
    team_records = [{'Team_Name': team[0]} for team in teams]

    return render(request, 'cricitup/team.html', {'teams': team_records})

def players(request):
    return render(request,'cricitup/players.html')
