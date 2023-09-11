import json
from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.db import connection, transaction


# Create your views here.
def make_your_dream11(request):
    players = []
    players_batting_rank=[]
    dream11players=[]

    cursor=connection.cursor()
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    sql = """
            SELECT (PR.FIRST_NAME || ' ' || PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,
            PR.IMAGE_URL, D.PLAYERID
            FROM DREAM11 D
            JOIN PERSON PR ON D.PLAYERID = PR.PERSONID
            JOIN PLAYER PL ON PR.PERSONID = PL.PLAYERID
            """
            
        # Delete existing data from DREAM11 table
        # Execute the SQL query to get updated Dream11 player data
    cursor.execute(sql)

    dream11players = cursor.fetchall()
    cursor.execute('SELECT COUNT(*) FROM DREAM11')
    counts=cursor.fetchone()[0]

    context = {
        'players': players,
        'dream11players':dream11players,
        'counts':counts
}

    return render(request, 'dream11/dream11.html', context)

from django.http import JsonResponse
import json

def add_player_to_dream11(request):
    cursor = connection.cursor()
    dream11players=[]
    players=[]
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    if request.method == 'POST':
        selected_player_ids = request.POST.getlist('playerName')
        
        # Check the current count of players in the DREAM11 team
        cursor.execute('SELECT COUNT(*) FROM DREAM11')
        current_count = cursor.fetchone()[0]

        # Check if adding the selected players would exceed the limit of 11
        message = 'Player count exceeds the limit of 11. Please remove some players.'
        for player_id in selected_player_ids:
            cursor.callproc('ADD_TO_DREAM11',[player_id])
            connection.commit()
        sql = """
            SELECT (PR.FIRST_NAME || ' ' || PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,
            PR.IMAGE_URL, D.PLAYERID
            FROM DREAM11 D
            JOIN PERSON PR ON D.PLAYERID = PR.PERSONID
            JOIN PLAYER PL ON PR.PERSONID = PL.PLAYERID
            """
            
        # Delete existing data from DREAM11 table
        # Execute the SQL query to get updated Dream11 player data
        cursor.execute(sql)

        dream11players = cursor.fetchall()
       
        cursor.execute('SELECT COUNT(*) FROM DREAM11')
        counts=cursor.fetchone()[0]
        if current_count + len(selected_player_ids) > 11:
            context= {
                 'players': players,
                'dream11players':dream11players,
                'counts':counts,
                'message':message
            }
            return render(request, 'dream11/dream11.html', context)
        else:

            context = {
        'players': players,
        'dream11players':dream11players,
        'counts':counts
            }
            return render(request, 'dream11/dream11.html', context)
        
        # Return the updated player data and render the template
    
    # Handle other HTTP methods or initial GET request
    return HttpResponse('Invalid request method', status=405)

def reset_dream11(request):
        # Perform the logic to reset the Dream11 table (e.g., delete all records)
    sql = "DELETE FROM DREAM11"
    cursor = connection.cursor()
    cursor.execute(sql)
    players = []
    dream11players=[]

    cursor=connection.cursor()
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    cursor.execute('SELECT COUNT(*) FROM DREAM11')
    counts=cursor.fetchone()[0]
    context = {
        'players': players,
        'dream11players':dream11players,
        'counts':counts
}

    return render(request, 'dream11/dream11.html', context)

def removePlayer(request,playerId):
    players = []
    players_batting_rank=[]
    dream11players=[]
    message='You need to Delete More Player'
    sql_delete="""

DELETE FROM DREAM11 WHERE PLAYERID=%s
"""

    cursor=connection.cursor()
    cursor.execute(sql_delete,[playerId])
    cursor.execute('SELECT COUNT(*) FROM DREAM11')
    counts=cursor.fetchone()[0]
    
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    sql = """
            SELECT (PR.FIRST_NAME || ' ' || PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,
            PR.IMAGE_URL, D.PLAYERID
            FROM DREAM11 D
            JOIN PERSON PR ON D.PLAYERID = PR.PERSONID
            JOIN PLAYER PL ON PR.PERSONID = PL.PLAYERID
            """
            
        # Delete existing data from DREAM11 table
        # Execute the SQL query to get updated Dream11 player data
    cursor.execute(sql)

    dream11players = cursor.fetchall()
    cursor.execute('SELECT COUNT(*) FROM DREAM11')
    counts=cursor.fetchone()[0]
    if counts>11 :
        context = {
        'players': players,
        'dream11players':dream11players,
        'counts':counts,
        'message':message

}   
        return render(request, 'dream11/dream11.html', context)
    else:
        context={
        'players': players,
        'dream11players':dream11players,
        'counts':counts,
    }

        return render(request, 'dream11/dream11.html', context)


def showStats(request):
    players=[]
    dream11players=[]
    counts=[]
    betterteams=[]
    worseteams=[]
    opponentCountries=[]
    cursor = connection.cursor()
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    sql = """
            SELECT (PR.FIRST_NAME || ' ' || PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,
            PR.IMAGE_URL, D.PLAYERID
            FROM DREAM11 D
            JOIN PERSON PR ON D.PLAYERID = PR.PERSONID
            JOIN PLAYER PL ON PR.PERSONID = PL.PLAYERID
            """
            
        # Delete existing data from DREAM11 table
        # Execute the SQL query to get updated Dream11 player data
    cursor.execute(sql)

    dream11players = cursor.fetchall()
    cursor.execute('SELECT COUNT(*) FROM DREAM11')
    counts=cursor.fetchone()[0]
    cursor.callproc('TEAM_STRENGTH_UPDATE')
    cursor.callproc('UPDATE_DREAM11_STATS')
    cursor.callproc('WINNING_CHANCE_CALCULATOR')

    query3="""
SELECT bat,bowl,total FROM DREAM11STATS

"""
    cursor.execute(query3)
    values=cursor.fetchone()

    query2="""
SELECT COUNT(*) + 1 
FROM team_strength
WHERE total <%s
"""
    query4="""
    SELECT TEAMID,TEAM_NAME,IMAGE_URL
FROM team_strength TS
JOIN TEAM T 
ON T.TEAM_ID=TS.TEAMID
WHERE total <%s
    
    """
    query5="""
    SELECT TEAMID,TEAM_NAME,IMAGE_URL
FROM team_strength TS
JOIN TEAM T 
ON T.TEAM_ID=TS.TEAMID
WHERE total >%s

    
    """
    query6="""
    SELECT TEAM_ID,TEAM_NAME FROM TEAM
    
    
    """
    query7="""
    SELECT TEAMID, (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=S.TEAMID) NAME , CHANCE
FROM WINNING_CHANCE S 
    
    """
    cursor.execute(query7)
    chances=cursor.fetchall()
    cursor.execute(query2,[values[2]])
    position=cursor.fetchone()[0]
    cursor.execute(query4,[values[2]])
    betterteams=cursor.fetchall()
    cursor.execute(query5,[values[2]])
    worseteams=cursor.fetchall()
    cursor.execute(query6)
    opponentCountries=cursor.fetchall()
    context={
        'players': players,
        'dream11players':dream11players,
        'counts':counts,
        'position':position,
         'dream11stats':values,
         'betterteams':betterteams,
         'worseteams':worseteams,
         'opponentCountries':opponentCountries,
         'chances':chances
    }
    return render(request, 'dream11/dream11.html', context)


def calculate_winning_chance(request):

        team_id=request.GET.get('team_id')
        players = []
        dream11players = []
        counts = []
        betterteams = []
        worseteams = []
        opponentCountries = []
        cursor = connection.cursor()
        chance = cursor.callfunc('WINNING_CHANCE_CALCULATOR', float, [team_id])

        sql_query = """
            SELECT (FIRST_NAME || ' ' || LAST_NAME) FULL_NAME, NATIONALITY, TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE, IMAGE_URL, PLAYERID
            FROM PLAYER PL
            JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
        """
        cursor.execute(sql_query)
        players = cursor.fetchall()

        sql = """
            SELECT (PR.FIRST_NAME || ' ' || PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE,
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,
            PR.IMAGE_URL, D.PLAYERID
            FROM DREAM11 D
            JOIN PERSON PR ON D.PLAYERID = PR.PERSONID
            JOIN PLAYER PL ON PR.PERSONID = PL.PLAYERID
        """

        # Delete existing data from DREAM11 table
        # Execute the SQL query to get updated Dream11 player data
        cursor.execute(sql)
        dream11players = cursor.fetchall()

        cursor.execute('SELECT COUNT(*) FROM DREAM11')
        counts = cursor.fetchone()[0]

        cursor.callproc('TEAM_STRENGTH_UPDATE')
        cursor.callproc('UPDATE_DREAM11_STATS')

        query3 = """
            SELECT bat, bowl, total FROM DREAM11STATS
        """
        cursor.execute(query3)
        values = cursor.fetchone()

        query2 = """
            SELECT COUNT(*) + 1 
            FROM team_strength
            WHERE total <%s
        """
        query4 = """
            SELECT TEAMID, TEAM_NAME, IMAGE_URL
            FROM team_strength TS
            JOIN TEAM T 
            ON T.TEAM_ID = TS.TEAMID
            WHERE total <%s
        """
        query5 = """
            SELECT TEAMID, TEAM_NAME, IMAGE_URL
            FROM team_strength TS
            JOIN TEAM T 
            ON T.TEAM_ID = TS.TEAMID
            WHERE total >%s
        """
        query6 = """
            SELECT TEAM_ID, TEAM_NAME FROM TEAM
        """
        cursor.execute(query2, [values[2]])
        position = cursor.fetchone()[0]

        cursor.execute(query4, [values[2]])
        betterteams = cursor.fetchall()

        cursor.execute(query5, [values[2]])
        worseteams = cursor.fetchall()

        cursor.execute(query6)
        opponentCountries = cursor.fetchall()

        context = {
            'players': players,
            'dream11players': dream11players,
            'counts': counts,
            'position': position,
            'dream11stats': values,
            'betterteams': betterteams,
            'worseteams': worseteams,
            'opponentCountries': opponentCountries,
            'chance': chance
        }

        return render(request, 'dream11/dream11.html', context)

