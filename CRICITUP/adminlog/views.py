from django.shortcuts import render
from django.db import connection
from django.db import transaction
from django.http import JsonResponse


def adminlog(request):
    with connection.cursor() as cursor:
        
        
        query = """
     SELECT * FROM LOG_TABLE order by log_id
        """
        cursor.execute(query)
        results = cursor.fetchall()
     
 
    


    context = {'al': results}
    return render(request, 'adminlog/index.html', context)

def clear_log_table(request):
    if request.method == "POST":
        try:
            with connection.cursor() as cursor:
                # Clear the log table
                cursor.execute("DELETE FROM LOG_TABLE;")
                
                # Reset the sequence
                
                
                
            return JsonResponse({"success": True})
        except Exception as e:
            return JsonResponse({"success": False, "error_message": str(e)})
        



# Create your views here.
