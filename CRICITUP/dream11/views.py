import json
from django.shortcuts import render
from django.db import connection
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


# Create your views here.
def make_your_dream11(request):
    players = []
    players_batting_rank=[]
    dream11_players=[]

    cursor=connection.cursor()
    sql_query = "SELECT (FIRST_NAME ||' '||LAST_NAME) FULL_NAME, NATIONALITY, TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM DATE_OF_BIRTH) AGE,IMAGE_URL,PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID"
    cursor.execute(sql_query)
    players = cursor.fetchall()
    sql_query2="""
SELECT (PR.FIRST_NAME ||' '||PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,PR.IMAGE_URL,PL.PLAYERID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
JOIN DREAM11 D ON PR.PERSONID=D.PLAYERID
"""
    cursor.execute(sql_query2)
    dream11_players=cursor.fetchall()

    context = {
        'players': players,
        'dream11_players':dream11_players
    }

    return render(request, 'dream11/dream11.html', context)
@csrf_exempt
def add_player_to_dream11(request):
    if request.method == 'POST':
        try:
            player_id = request.POST.get('playerId')

            

            with connection.cursor() as cursor:
                sql_query = "INSERT INTO DREAM11 (PLAYERID) VALUES (%s)"
                cursor.execute(sql_query, [player_id])

            return JsonResponse({'success': True})
        except Exception as e:
            return JsonResponse({'error': str(e)})

    return JsonResponse({'error': 'Invalid request method'})
def remove_player_from_dream11(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            player_id = data.get('playerId')
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM DREAM11 WHERE PLAYERID = %s", [player_id])
            updated_team = retrieve_updated_dream11_team()

            return JsonResponse({'success': True, 'team': updated_team})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})

def retrieve_updated_dream11_team():

    cursor = connection.cursor()
    sql_query = """
        SELECT (PR.FIRST_NAME ||' '||PR.LAST_NAME) FULL_NAME, PR.NATIONALITY, PL.TYPE, EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM PR.DATE_OF_BIRTH) AGE,PR.IMAGE_URL,PL.PLAYERID
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
        JOIN DREAM11 D ON PR.PERSONID = D.PLAYERID
    """
    cursor.execute(sql_query)
    dream11_players = cursor.fetchall()
    return dream11_players

def get_player_id_by_name(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        player_name = data.get('playerName', '')
        print(player_name)
        # Execute the raw SQL query to find the player ID based on the player's name
        with connection.cursor() as cursor:
            sql_query = """
                SELECT PL.PLAYERID FROM PLAYER PL
                JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
                WHERE (PR.FIRST_NAME ||' '||PR.LAST_NAME)=%s
            """
            cursor.execute(sql_query, [player_name])
            result = cursor.fetchone()

            if result:
                player_id = result[0]
                print(player_id)
                response_data = {'playerId': player_id}
                return JsonResponse(response_data)
            else:
                return JsonResponse({'error': 'Player not found'}, status=404)

    return JsonResponse({'error': 'Invalid request'}, status=400)