from django.shortcuts import render
from django.db import connection



def home(request):
    return render(request, 'cricitup/index.html')


# def teams(request):
#     return render(request, 'cricitup/team.html')
# def players(request):
#     return render(request,'players/players.html')
# def coaches(request):
#     return render(request, 'coaches/coaches.html')

