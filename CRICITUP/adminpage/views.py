from django.shortcuts import render, redirect, HttpResponse
from django.db import connection

def adminpage(request):
    print(str(request.session['loginstatus']))
    if request.session['loginstatus']:
        #name=request.user.first_name
        name = request.session['username']
        print(name)
        return render(request, 'adminpage/index.html', {'name': name})
    else:
        return redirect('login')

# Create your views here.
