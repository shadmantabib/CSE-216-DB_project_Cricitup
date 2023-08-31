from django.shortcuts import render
from django.db import connection

# Create your views here.
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.db import IntegrityError
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.shortcuts import HttpResponse


# Create your views here.

def loginuser(request):
    if request.method == 'GET':
        request.session["loginstatus"] = False
        return render(request, 'loginpage/login.html')
    else:
        user = authenticate(request, username=request.POST['name'], password=request.POST['password'])
   
        if user is None:
            return render(request, 'loginpage/login.html', {"error": "*username or password is wrong"})
        else:
            request.session['loginstatus'] = True
            data = {'name': user}
            print(str(user))
            request.session['username'] = str(user)
            return redirect('adminpage:adminpage')
