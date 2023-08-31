from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.db import IntegrityError
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from django.shortcuts import HttpResponse
from django.db import connection

def signup(request):
    if request.method == 'GET':
        return render(request, 'signup/signup.html')
    else:
        if (request.POST['pass'] == request.POST['re_pass']) and (request.POST['secret_code'] == "1111"):
            try:
                user = User.objects.create_user(request.POST['username'], password=request.POST['pass'],
                                                email=request.POST['email'], first_name=request.POST['first_name'], last_name=request.POST['last_name'])
                user.save()
                login(request, user)
                return render(request, 'adminpage/index.html')
            except IntegrityError:
                return render(request, 'signup/signup.html', {'error': '*username is not available'})

        else:
            return render(request, 'signup/signup.html', {'error': '*password/secret code did not match'})


# Create your views here.
