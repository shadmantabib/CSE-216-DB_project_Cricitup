from django.shortcuts import render
from django.db import connection
def searchPlayer(request):
    print("hello")

    name=request.GET.get('name')
    persons=[]
    if name:
        with connection.cursor() as cursor:
            sql_query = "SELECT first_name,last_name,nationality FROM Person P, Player PL WHERE P.PERSONID = PL.PLAYERID AND P.FIRST_NAME LIKE %s"
            cursor.execute(sql_query,('{}%'.format(name),))
            persons=cursor.fetchall()
    
    print(persons)
    context= {
        'name': name,
        'persons': persons,

    }
    return render(request,'test2/index.html',context)

def gototestsql(request):
    return render(request, 'testsql/player_list.html')




