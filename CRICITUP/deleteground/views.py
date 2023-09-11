from django.http import JsonResponse
from django.shortcuts import render
from django.db import connection
from django.shortcuts import redirect



def deleteground(request):
    with connection.cursor() as cursor:
        query = """
        SELECT
            V.VENUE_ID,
            V.ADDRESS,
            V.CITY,
            V.STREET_NO,
			V.IMAGEURL
        FROM VENUE V
        """
        cursor.execute(query)
        venues_data = cursor.fetchall()

    context = {
        'venues': venues_data
    }

    return render(request, 'deleteground/index.html', context)
       

   
def delete_ground(request, venue_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM Venue WHERE Venue_ID = %s", [venue_id])
    return redirect('adminpage:adminpage')  # Redirect to a suitable URL after deletion