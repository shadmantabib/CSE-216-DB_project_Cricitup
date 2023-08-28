from django.shortcuts import render
from django.db import connection

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
    # Define the SQL query using placeholders for parameters
    query = """
    SELECT MATCH_ID,
           (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM1_ID) || ' vs ' || (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM2_ID) || ' -' || MATCH_ID AS NAME,
           MAN_OF_THE_MATCH,WEATHER,WINNER,(SELECT ADDRESS FROM VENUE V WHERE V.VENUE_ID=M.VENUE_ID) GROUND
    FROM MATCH M
		
    WHERE MATCH_ID = %s
    """


    # Execute the PL/SQL query to fetch team details
    with connection.cursor() as cursor:
        cursor.execute(query, [match_id])
        match = cursor.fetchone()  # Fetch the result
        match_winner=cursor.callfunc('Find_Match_Winner',str,[match_id])
    
    context = {
        'match': match,
        'match_winner':match_winner,
    }
    return render(request, 'matches/match_details.html', context)
