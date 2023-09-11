from django.http import JsonResponse
from django.shortcuts import render
from django.db import connection
from django.shortcuts import redirect
def deletematch(request):
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
    return render(request, 'deletematch/index.html', context)
       

  
def delete_match(request, match_id):
    with connection.cursor() as cursor:
        cursor.execute("DELETE FROM Match WHERE MATCH_ID = %s", [match_id])
    return redirect('adminpage:adminpage')  # Redirect to a suitable URL after deletion