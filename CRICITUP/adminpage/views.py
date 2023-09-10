from django.shortcuts import render, redirect, HttpResponse
from django.db import connection



def adminpage(request):
    try:
        if request.session['loginstatus']:
            # User is authenticated, allow access to the admin page
            name = request.user.username  # Get the username of the authenticated user
            return render(request, 'adminpage/index.html', {'name': name})
    except KeyError:
        # 'loginstatus' key is not present in the session, display a message or redirect to the login page
        pass
    
    return render(request, 'adminpage/login_required.html', {'message': 'Please login first.'})
# Create your views here.
from django.shortcuts import render, redirect
from django.contrib.auth import logout

def logoutuser(request):
    logout(request)
    # Specify the URL to which you want to redirect after logging out
    return redirect('home')  # Change 'loginuser' to your desired URL

