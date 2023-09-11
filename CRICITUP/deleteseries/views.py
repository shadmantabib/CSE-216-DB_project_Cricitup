from django.http import JsonResponse
from django.shortcuts import render
from django.db import connection
from django.shortcuts import redirect



def deleteseries(request):
    with connection.cursor() as cursor:
        
        cursor.execute("SELECT SERIES_ID, SERIES_NAME, HOST, SERIES_IMAGE FROM SERIES")
        serieses = cursor.fetchall()
       

    return render(request, 'deleteseries/index.html', {'series_records': serieses})
def delete_series(request, series_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM Series WHERE Series_ID = %s", [series_id])
    return redirect('adminpage:adminpage')  # Redirect to a suitable URL after deletion