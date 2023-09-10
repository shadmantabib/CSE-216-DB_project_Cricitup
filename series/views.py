from django.shortcuts import render
from django.db import connection

def series_records(request):
    with connection.cursor() as cursor:
        cursor.callproc('RESET_RATING')
        cursor.callproc('Rating_Update')
        cursor.execute("SELECT SERIES_ID, SERIES_NAME,HOST,SERIES_IMAGE FROM SERIES")
        serieses = cursor.fetchall()
        cursor.callproc('WINNER_UPDATE')
        cursor.callproc('FIND_SERIES_WINNER')
        cursor.callproc('SERIES_FOUR_SIX_UPDATE')
        cursor.callproc('HIGHEST_RUN_IN_SERIES')
        



    

    return render(request, 'series/series.html', {'series_records': serieses})

def series_detail(request, series_id):


    # Execute the PL/SQL query to fetch team details
    with connection.cursor() as cursor:
        query="""


"""







    context = {
       
    }
    return render(request, 'series/series_detail.html', context)
