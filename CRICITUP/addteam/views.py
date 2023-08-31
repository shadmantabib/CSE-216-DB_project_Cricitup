from django.shortcuts import render, redirect
from django.db import connection

def addteam(request):
    if request.method == 'GET':
        if request.session['loginstatus']:
            return render(request, 'addteam/index.html')
        else:
            return redirect('login')
    else:
        # Get data from the form
        
      
        name = request.POST['full_name']
        file = request.FILES['file_image']
        fname = file.name
        handle_uploaded_file(file)
        cursor = connection.cursor()



        # Handle the uploaded image file
        handle_uploaded_file(file)
        # Get the maximum existing venue_id and increment by 1
        cursor = connection.cursor()
        cursor.execute("SELECT MAX(Team_id) FROM Team")
        max_team_id = cursor.fetchone()[0]
        team_id =  max_team_id  + 1

        # Insert data into Venue table
        cursor.execute(
            "INSERT INTO TEAM (Team_id, Team_Name,Team_rating,Image_URL) "
            "VALUES (:team_id, :name,0,:image)",
            {
                'team_id': team_id,
                'name': name,
                'image':file.name,
            }
        )
        connection.commit()
        cursor.close()

        return render(request, 'adminpage/index.html')


def handle_uploaded_file(f):
    with open('static/cricitup/images/' + f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)         
