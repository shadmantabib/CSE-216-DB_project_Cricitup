from django.shortcuts import render



def home(request):
    return render(request, 'cricitup/index.html')


def teams(request):
    return render(request, 'cricitup/team.html')