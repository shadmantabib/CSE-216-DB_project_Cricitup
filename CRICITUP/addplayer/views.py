from django.shortcuts import render, redirect
from django.db import connection

# Create your views here.

def addplayer(request):
    if request.method == 'GET':
        if request.session.get('loginstatus'):
            return render(request, 'addplayer/addplayer.html')
        else:
            return redirect('login')

    else:
        fname = request.POST['first_name']
        lname = request.POST['last_name']
        nationality = request.POST['company']
        ROLE = request.POST['ROLE']
        dob = request.POST['phone_number']
        file = request.FILES['image']

        # Retrieve Team_id based on nationality (assuming Team_Name corresponds to nationality)
        cursor = connection.cursor()
        cursor.execute("SELECT Team_id FROM Team WHERE Team_Name = %s", (nationality,))
        team_id = cursor.fetchone()[0]

        handle_uploaded_file(file)

        # Fetch maximum personId from Person table
        cursor.execute("SELECT MAX(personId) FROM Person")
        max_person_id = cursor.fetchone()[0]
        new_person_id = max_person_id + 1

        # Fetch maximum statId from Player table
        cursor.execute("SELECT MAX(statId) FROM Player")
        max_stat_id = cursor.fetchone()[0]
        new_stat_id = max_stat_id + 1

        # Insert data into Person table
        cursor.execute(
            "INSERT INTO Person (personId, first_name, last_name, nationality, date_of_birth, Image_URL) "
            "VALUES (%s, %s, %s, %s, TO_DATE(%s, 'YYYY-MM-DD'), %s)",
            (new_person_id, fname, lname, nationality, dob, file.name)
        )

        # Insert data into Player table
        cursor.execute(
            "INSERT INTO Player (playerId, type, Team_id, statId) "
            "VALUES (%s, %s, %s, %s)",
            (new_person_id, ROLE, team_id, new_person_id)
        )

        connection.commit()
        cursor.close()

        return render(request, 'adminpage/index.html')


def handle_uploaded_file(f):
    with open('static/cricitup/images/' + f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)
