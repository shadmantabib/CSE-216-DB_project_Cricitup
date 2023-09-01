from django.shortcuts import render, redirect
from django.db import connection



def addseries(request):
    if request.method == 'GET':
        if request.session['loginstatus']:
            cursor = connection.cursor()
            sql = "SELECT * FROM TEAM"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()

            team = []
            for r in result:
                team_id = r[0]
                team_name = r[1]

                row = {'team_id': team_id, 'team_name': team_name}
                team.append(row)

            cursor = connection.cursor()
            sql = "SELECT * FROM PLAYER PR, PERSON P WHERE P.personId=PR. playerId"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()
            fullname = ""
            player = []
            for r in result:
                player_id = r[4]
                first_name = r[5]
                second_name = r[6]
                fullname = first_name + " " + second_name

                row = {'player_id': player_id, 'fullname': fullname}
                player.append(row)
            return render(request, 'addseries/index.html', {'team':team, 'player':player})
        else:
            return redirect('login')
    else:
        name = request.POST['name']

        winner = request.POST['winner']
        mots = request.POST['motm']
        team1= request.POST['team1']
        team2 = request.POST['team2']
        team3 = request.POST['team3']
        team4 = request.POST['team4']
        part = mots.split(" ")
        first_name = part[0]
        last_name = part[1]
        cursor = connection.cursor()
        cursor.execute("SELECT MAX(Series_ID) FROM Series")
        max_series_id = cursor.fetchone()[0]
        s_id =  max_series_id  + 1
        cursor = connection.cursor()
        sql = "SELECT TEAM_ID FROM TEAM WHERE Team_Name = '" + team1 + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        team1_id = ""
        for r in result:
            team1_id = r[0]
        cursor = connection.cursor()
        sql = "SELECT TEAM_ID FROM TEAM WHERE Team_Name = '" + team2 + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        team2_id = ""
        for r in result:
            team2_id = r[0]

        if team3!="":
            cursor = connection.cursor()
            sql = "SELECT TEAM_ID FROM TEAM WHERE Team_Name = '" + team3 + "'"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()
            team3_id = ""
            for r in result:
                team3_id = r[0]
        if team4!="":
            cursor = connection.cursor()
            sql = "SELECT TEAM_ID FROM TEAM WHERE Team_Name = '" + team4 + "'"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()
            team4_id = ""
            for r in result:
                team4_id = r[0]


        cursor = connection.cursor()
        sql = "SELECT personId FROM PERSON WHERE FIRST_NAME = '" + first_name + "' AND LAST_NAME='"+last_name+"'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        mots_id=""

        for r in result:
            mots_id = r[0]


       
        cursor = connection.cursor()
        
  



    # Find Team_id based on winner (team1)
    cursor.execute("SELECT Team_id FROM Team WHERE team_name = %s", (winner,))
    team_row = cursor.fetchone()

    # Check if the team exists
    if team_row:
        S_WINNER = team_row[0]  # Get the Team_id
    else:
        # Handle the case where the team name is not found
        S_WINNER = None

    S_ID = s_id
    S_NAME = name
    S_HOST = team1
    S_MOTS = mots_id
    

    # Insert data into the SERIES table using placeholders (%s)
    cursor.execute(
        "INSERT INTO Series (Series_ID, Series_Name, Host, Man_Of_The_Series, Winner, No_Of_Sixes, No_Of_Fours, No_Of_Hat_Tricks) "
        "VALUES (:S_ID, :S_NAME, :S_HOST, :S_MOTS, :S_WINNER, 0, 0, 0)",
        {'S_ID': S_ID, 'S_NAME': S_NAME, 'S_HOST': S_HOST, 'S_MOTS': S_MOTS, 'S_WINNER': S_WINNER}
    )

    cursor.execute("INSERT INTO Team_Participates_In_Series VALUES (:team1_id, :s_id)", {'team1_id': team1_id, 's_id': s_id})
    cursor.execute("INSERT INTO Team_Participates_In_Series VALUES (:team2_id, :s_id)", {'team2_id': team2_id, 's_id': s_id})

    if team3 != "":
        cursor.execute("INSERT INTO Team_Participates_In_Series VALUES (:team3_id, :s_id)", {'team3_id': team3_id, 's_id': s_id})

    if team4 != "":
        cursor.execute("INSERT INTO Team_Participates_In_Series VALUES (:team4_id, :s_id)", {'team4_id': team4_id, 's_id': s_id})

    connection.commit()
    cursor.close()

    return render(request, 'adminpage/index.html')



