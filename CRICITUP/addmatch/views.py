from django.shortcuts import render, redirect
from django.db import connection
import pandas as pd
import csv, io


def addmatch(request):
    if request.method == 'GET':
        if request.session['loginstatus']:

            cursor = connection.cursor()
            sql = "SELECT P.PERSONID,P.FIRST_NAME,P.LAST_NAME FROM PLAYER PR, PERSON P WHERE P.personId=PR. playerId"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()
            fullname=""
            player = []
            for r in result:
                player_id=r[0]
                first_name = r[1]
                second_name = r[2]
                fullname=first_name+" "+second_name

                row = {'player_id': player_id, 'fullname': fullname}
                player.append(row)
            cursor = connection.cursor()
            sql = "SELECT * FROM UMPIRE U, PERSON P WHERE P.PERSONID=U.personid"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()

            umpire = []
            for r in result:
                umpire_id = r[0]
                first_name = r[3]
                second_name = r[4]
                fullname = first_name + " " + second_name

                row = {'umpire_id': umpire_id, 'fullname': fullname}
                umpire.append(row)

            cursor = connection.cursor()
            sql = "SELECT * FROM TEAM"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()

            team = []
            for r in result:
                team_id=r[0]
                team_name=r[1]

                row = {'team_id': team_id, 'team_name':team_name}
                team.append(row)
            cursor = connection.cursor()
            sql = "SELECT * FROM SERIES"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()

            series = []
            for r in result:
                series_id=r[0]
                series_name=r[1]

                row = {'series_id': series_id, 'series_name': series_name}
                series.append(row)

            cursor = connection.cursor()
            sql = "SELECT * FROM  VENUE"
            cursor.execute(sql)
            result = cursor.fetchall()
            cursor.close()

            ground = []
            for r in result:
                ground_id=r[0]
                ground_name=r[1]

                row = {'ground_id': ground_id, 'ground_name':ground_name}
                ground.append(row)
            return render(request, 'addmatch/index.html', {'team':team,'player':player,'series':series, 'ground':ground, 'umpire':umpire})
        else:
            return redirect('login')

    else:
        team1 = request.POST['team1']
        team2 = request.POST['team2']
        series_name = request.POST['s_name_in']
        ground_name =request.POST['in_ground']
        
        weather = request.POST['weather']
        
        
        ump1 = request.POST['ump1']
        partu1 = ump1.split(" ")
        first_nameu1 = partu1[0]
        last_nameu1 = partu1[1]
        ump2 = request.POST['ump2']
        partu2 = ump2.split(" ")
        first_nameu2 = partu2[0]
        last_nameu2 = partu2[1]
        ump3 = request.POST['ump3']
        partu3 = ump3.split(" ")
        first_nameu3 = partu3[0]
        last_nameu3 = partu3[1]
        match_date = request.POST['match_date']
       

        cursor = connection.cursor()
        sql = "SELECT PERSONID FROM PERSON WHERE (FIRST_NAME = '" + first_nameu1 + "' AND LAST_NAME='" + last_nameu1 + "') OR (FIRST_NAME = '" + first_nameu2 + "' AND LAST_NAME='" + last_nameu2 + "') OR (FIRST_NAME = '" + first_nameu3 + "' AND LAST_NAME='" + last_nameu3 + "')"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        umpire_id = []

        for r in result:
            um_id = r[0]
            row={'um_id':um_id}
            umpire_id.append(row)
        print(umpire_id)
        cursor = connection.cursor()
        sql = "SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '" + team1 + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        team1_id = ""
        for r in result:
            team1_id = r[0]
        cursor = connection.cursor()
        sql = "SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '" + team2 + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        team2_id = ""
        for r in result:
            team2_id = r[0]
        cursor = connection.cursor()
        sql = "SELECT VENUE_ID FROM VENUE WHERE ADDRESS= '" + ground_name + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        ground_id = ""
        for r in result:
            ground_id = r[0]
        cursor = connection.cursor()
        sql = "SELECT SERIES_ID FROM SERIES WHERE SERIES_NAME = '" + series_name + "'"
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        series_id = ""
        for r in result:
            series_id = r[0]
        
        cursor = connection.cursor()
        cursor.execute("SELECT MAX(MATCH_ID) FROM MATCH")
        max_series_id = cursor.fetchone()[0]
        in_match_id=  max_series_id  + 1
        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO MATCH VALUES(:mID,:mmotm_id,:mweather,:mwinner,:mteam1id,:mteam2id,:gID,:sID)",
            {
                'mID': in_match_id,
                'mmotm_id': None,
                'mweather': weather,
                'mwinner': None,
                'mteam1id': team1_id,
                'mteam2id': team2_id,
                'gID': ground_id,
                'sID': series_id
            }
        )
        connection.commit()
        cursor.execute(
            "INSERT INTO PLAYS VALUES(:M_ID,:T_ID,TO_DATE(:M_DATE,'YYYY-MM-DD'))",
            {
                'M_ID': in_match_id,
                'T_ID': team1_id,
                'M_DATE': match_date,
            }
        )

# Insert the second team ID into the PLAYS table
        cursor.execute(
            "INSERT INTO PLAYS VALUES(:M_ID,:T_ID,TO_DATE(:M_DATE,'YYYY-MM-DD'))",
            {
                'M_ID': in_match_id,
                'T_ID': team2_id,
                'M_DATE': match_date,
            }
        )
        for r in umpire_id:
            cursor.execute(
                "INSERT INTO MATCH_umpire VALUES(:M_ID,:U_ID,)",
                {
                    'M_ID': in_match_id,
                    'U_ID': r['um_id'],
                    
                }
        )
        connection.commit()
        if 'player_score' in request.FILES:
            excel_file = request.FILES['player_score']
            if excel_file.name.endswith('.xlsx'):
                try:
                    # Read the Excel file into a pandas DataFrame
                    df = pd.read_excel(excel_file)

                    # Iterate through the DataFrame rows
                    for index, row in df.iterrows():
                        scorecard_id = row['scorecard_id']
                        person_id = row['person_id']
                        overs_bowled = row['overs_bowled']
                        wicket = row['wicket']
                        given_run = row['given_run']
                        scored_run = row['scored_run']
                        balls_batted = row['balls_batted']
                        given_extra = row['given_extra']
                        given_maiden = row['given_maiden']
                        sixes = row['sixes']
                        fours = row['fours']
                        demerit_points = row['demerit_points']
                        penalized = row['penalized']
                        tot_catches_taken = row['tot_catches_taken']
                        match_id = row['match_id']

                        if match_id == in_match_id:
                            cursor.execute(
                                "INSERT INTO SCORECARD VALUES(:sID,:PID,:obowled,:takenwickets,:givenruns,:totruns,:ballfaced,:givenextra,:maiden, :sixes,:fours,:demeritpoints,:penalized,:totalcatchestaken,:matchid)",
                                {
                                    'sID': scorecard_id,
                                    'PID': person_id,
                                    'obowled': overs_bowled,
                                    'takenwickets': wicket,
                                    'givenruns': given_run,
                                    'totruns': scored_run,
                                    'ballfaced': balls_batted,
                                    'givenextra': given_extra,
                                    'maiden': given_maiden,
                                    'sixes': sixes,
                                    'fours': fours,
                                    'demeritpoints': demerit_points,
                                    'penalized': penalized,
                                    'totalcatchestaken': tot_catches_taken,
                                    'matchid': match_id,
                                }
                            )
                            connection.commit()
                
                except Exception as e:
                    print("Error processing Excel file:", str(e))
                    # Handle the error or provide a user-friendly error message.

        cursor.close()

        return render(request, 'adminpage/index.html')