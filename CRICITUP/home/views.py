from django.shortcuts import render
from django.db import connection



def home(request):
    return render(request, 'cricitup/index.html')

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

    
    return render(request, 'cricitup/index.html', {'teams': team_records})


