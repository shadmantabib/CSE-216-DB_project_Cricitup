from django.shortcuts import render
from django.db import connection

def series_records(request):
    with connection.cursor() as cursor:
        cursor.callproc('RESET_RATING')
        cursor.callproc('Rating_Update')
        cursor.execute("SELECT SERIES_ID, SERIES_NAME, HOST, SERIES_IMAGE FROM SERIES")
        serieses = cursor.fetchall()
        cursor.callproc('WINNER_UPDATE')
        cursor.callproc('FIND_SERIES_WINNER')
        cursor.callproc('SERIES_FOUR_SIX_UPDATE')
        cursor.callproc('HIGHEST_RUN_IN_SERIES')
        cursor.callproc('MAN_OF_THE_SERIES')

    return render(request, 'series/series.html', {'series_records': serieses})

def series_detail(request, series_id):
    cursor = connection.cursor()

    # Execute the PL/SQL query to fetch series details
    series_query = """
    SELECT SERIES_ID, SERIES_NAME, HOST, MAN_OF_THE_SERIES, WINNER, SIX, FOUR,
    HIGHEST_WICKET_TAKER, HIGHEST_RUN_SCORER, HIGHESTRUN, HIGHESTWICKET
    FROM SERIES WHERE SERIES_ID=%s
    """
    cursor.execute(series_query, [series_id])
    series_detail = cursor.fetchone()  # Fetch a single row

    # Execute the PL/SQL query to fetch match IDs
    match_query = "SELECT MATCH_ID FROM MATCH WHERE SERIES_ID=%s"
    cursor.execute(match_query, [series_id])
    match_ids = cursor.fetchall()  # Fetch all rows

    # Execute queries to fetch person details
    def fetch_person_name(person_id):
        cursor.execute("SELECT (first_name || ' ' || last_name) FROM PERSON WHERE PERSONID=%s", [person_id])
        person_name = cursor.fetchone()
        return person_name[0] if person_name else None


    man_of_the_series = fetch_person_name(series_detail[3])
    highest_wicket_taker = fetch_person_name(series_detail[7])
    
    team_query="""
SELECT TEAM_NAME FROM team WHERE TEAM_ID=%s
"""
    match_query="""

SELECT MATCH_ID,
           (SELECT TEAM_NAME FROM TEAM T WHERE T.TEAM_ID=M.TEAM1_ID) || ' vs ' || (SELECT TEAM_NAME FROM TEAM T WHERE T.  	TEAM_ID=M.TEAM2_ID) || ' -' || MATCH_ID AS NAME,
           MAN_OF_THE_MATCH,WEATHER,WINNER,(SELECT ADDRESS FROM VENUE V WHERE V.VENUE_ID=M.VENUE_ID) GROUND
    FROM MATCH M
		
    WHERE SERIES_ID = %s
"""
    cursor.execute(match_query,[series_id])
    all_matches=cursor.fetchall()
    cursor.execute(team_query,[series_detail[4]])
    
    winners=cursor.fetchone()[0]
    cursor.execute("SELECT (first_name || ' ' || last_name) FROM PERSON WHERE PERSONID=%s", [series_detail[8]])
    highest_run_scorer=cursor.fetchone()[0]

    context = {
        'series_detail': series_detail,
        'match_ids': match_ids,
        'man_of_the_series': man_of_the_series,
        'highest_wicket_taker': highest_wicket_taker,
        'highest_run_scorer': highest_run_scorer,
        'winners':winners,
        'all_matches':all_matches
    }

    return render(request, 'series/series_details.html', context)
