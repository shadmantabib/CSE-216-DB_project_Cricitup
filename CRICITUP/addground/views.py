from django.shortcuts import render, redirect
from django.db import connection

def addground(request):
    if request.method == 'GET':
        if request.session['loginstatus']:
            return render(request, 'addground/index.html')
        else:
            return redirect('login')
    else:
        # Get data from the form
        address = request.POST['address']
        city = request.POST['city']
        street_no = request.POST['street_no']
        file = request.FILES['image']

      
        

        # Handle the uploaded image file
        handle_uploaded_file(file)
        # Get the maximum existing venue_id and increment by 1
        cursor = connection.cursor()
        cursor.execute("SELECT MAX(Venue_id) FROM Venue")
        max_venue_id = cursor.fetchone()[0]
        venue_id = max_venue_id + 1

        # Insert data into Venue table
        cursor.execute(
            "INSERT INTO Venue (Venue_id, Address, City, Street_No, HighestScoringMatch, HighestWicketMatch, Demerit_Point, ImageUrl) "
            "VALUES (:venue_id, :address, :city, :street_no, 0, 0, 0, :image)",
            {
                'venue_id': venue_id,
                'address': address,
                'city': city,
                'street_no': street_no,
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
