CREATE OR REPLACE PROCEDURE ADD_TO_DREAM11(id IN NUMBER) IS 
counts NUMBER:=0;
BEGIN
 INSERT INTO LOG_TABLE (USERNAME, DESCRIPTION, DATETIME)
  VALUES (USER, 'Add_to_dream11 ' || ' has been called', SYSDATE);
SELECT COUNT(*) INTO counts
FROM DREAM11 
WHERE PLAYERID=id;
-- IF count =0 THEN  
IF counts =0 THEN 
INSERT INTO DREAM11(PLAYERID) VALUES(id);
END IF;
END;



CREATE OR REPLACE FUNCTION Find_Highest_Scorer(id NUMBER) RETURN VARCHAR2 IS
    highest_scorer_name VARCHAR2(100) := 'Data Not Found'; -- Initialize with a default value
    highest_runs NUMBER := 0;

BEGIN
    -- Get the highest runs for the match
    BEGIN
        SELECT MAX(Total_Runs) INTO highest_runs FROM Scorecard WHERE Match_id = id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for the match
            RETURN highest_scorer_name; -- Return 'Data Not Found'
    END;

    -- Get the name of the highest scorer
    BEGIN
        SELECT PLAYER_NAME
        INTO highest_scorer_name
        FROM (
            SELECT S.PLAYER_ID, (P.FIRST_NAME || ' ' || P.LAST_NAME) AS PLAYER_NAME
            FROM Scorecard S
            JOIN PERSON P ON S.PLAYER_ID = P.PERSONID
            WHERE S.MATCH_ID = id
            ORDER BY S.Total_Runs DESC
        )
        WHERE ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for the highest scorer
            RETURN highest_scorer_name; -- Return 'Data Not Found'
    END;

    RETURN highest_scorer_name; -- Return the highest scorer's name
END;




CREATE OR REPLACE FUNCTION Find_Highest_Wicket_Taker(id NUMBER) RETURN VARCHAR2 IS
    highest_taker_name VARCHAR2(100) := 'Data Not Found'; -- Initialize with a default value
    highest_wickets NUMBER := 0;

BEGIN
    -- Get the highest wickets for the match
    BEGIN
        SELECT MAX(TAKEN_WICKETS) INTO highest_wickets FROM Scorecard WHERE Match_id = id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for the match
            RETURN highest_taker_name; -- Return 'Data Not Found'
    END;

    -- Get the name of the highest wicket-taker
    BEGIN
        SELECT PLAYER_NAME
        INTO highest_taker_name
        FROM (
            SELECT S.PLAYER_ID, (P.FIRST_NAME || ' ' || P.LAST_NAME) AS PLAYER_NAME
            FROM Scorecard S
            JOIN PERSON P ON S.PLAYER_ID = P.PERSONID
            WHERE S.MATCH_ID = id
            ORDER BY S.TAKEN_WICKETS DESC
        )
        WHERE ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for the highest wicket-taker
            RETURN highest_taker_name; -- Return 'Data Not Found'
    END;

    RETURN highest_taker_name; -- Return the highest wicket-taker's name
END;



CREATE OR REPLACE FUNCTION Find_Match_Winner(mid NUMBER) RETURN VARCHAR2 IS
    team1_total_runs NUMBER := 0;
    team2_total_runs NUMBER := 0;
    team1_id NUMBER;
    team2_id NUMBER;
    winner_team_id NUMBER;
    winner_team_name VARCHAR2(100);

BEGIN
    -- Get the team IDs for the match
    SELECT TEAM1_ID, TEAM2_ID INTO team1_id, team2_id FROM MATCH WHERE MATCH_ID = mid;

    -- Calculate total runs scored by Team 1
    BEGIN
        SELECT SUM(Total_Runs)
        INTO team1_total_runs
        FROM Scorecard
        JOIN Player
        ON Scorecard.PLAYER_ID = Player.PLAYERID
        WHERE Match_id = mid AND Player.Team_id = team1_id
        GROUP BY Player.Team_id, Match_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for Team 1
            team1_total_runs := 0;
    END;

    -- Calculate total runs scored by Team 2
    BEGIN
        SELECT SUM(Total_Runs)
        INTO team2_total_runs
        FROM Scorecard
        JOIN Player
        ON Scorecard.PLAYER_ID = Player.PLAYERID
        WHERE Match_id = mid AND Player.Team_id = team2_id
        GROUP BY Player.Team_id, Match_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Handle the case where there is no data for Team 2
            team2_total_runs := 0;
    END;

    -- Determine the winner based on total runs
    IF team1_total_runs > team2_total_runs THEN
        winner_team_id := team1_id;
    ELSIF team1_total_runs < team2_total_runs THEN
        winner_team_id := team2_id;
    ELSE
        RETURN 'Match Tied';
    END IF;

    -- Get the winner's team name based on the winner_team_id
    SELECT TEAM_NAME INTO winner_team_name
    FROM Team
    WHERE Team_id = winner_team_id;

    RETURN winner_team_name; -- Return the winner's team name
END;




CREATE OR REPLACE PROCEDURE FIND_SERIES_WINNER IS 
team1 NUMBER;
team2 NUMBER ;
team1win NUMBER;
team2win NUMBER;
winners NUMBER;
BEGIN
for R IN  (SELECT SERIES_ID FROM series)
LOOP
SELECT TEAM1_ID,TEAM2_ID INTO team1,team2  FROM MATCH 
WHERE SERIES_ID=R.SERIES_ID
AND ROWNUM=1;

SELECT count(*) INTO team1win 
FROM series s join match m
on s.SERIES_ID=m.SERIES_ID
AND m.TEAM1_ID=m.WINNER
AND m.SERIES_ID=R.SERIES_ID;


SELECT count(*) INTO team2win 
FROM series s join match m
on s.SERIES_ID=m.SERIES_ID
AND m.TEAM2_ID=m.WINNER
AND m.SERIES_ID=R.SERIES_ID;

IF team1win>=team2win THEN
winners:=team1;
ELSE 
winners:=team2; 
END IF;

UPDATE SERIES 
SET WINNER=winners
WHERE SERIES_ID=R.SERIES_ID;

END LOOP;
END;




CREATE OR REPLACE FUNCTION GET_ID_FROM_NAME(NAME VARCHAR2) 
RETURN NUMBER IS 
ID NUMBER;
BEGIN
SELECT PLAYERID INTO ID FROM PLAYER PL JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
WHERE (FIRST_NAME ||' '||LAST_NAME)=NAME;
RETURN ID;
END;



CREATE OR REPLACE FUNCTION GET_STATS_OF_VENUE(VENUEID NUMBER) RETURN VARCHAR2 IS
    highestrun NUMBER;
    highestwicket NUMBER;
    highestsix NUMBER;
    highestfour NUMBER;
    highestcatch NUMBER;
    venue NUMBER;
    playerexists NUMBER := 0;
    result VARCHAR2(100);
BEGIN
    venue := VENUEID;

    INSERT INTO LOG_TABLE (USERNAME, DESCRIPTION, DATETIME)
    VALUES (USER, 'Get_Stat_Venue function' || ' has been called', SYSDATE);

    SELECT COUNT(*) INTO playerexists FROM MATCH WHERE VENUE_ID = venue;

    IF playerexists > 0 THEN
        FOR R IN (SELECT MATCH_ID FROM MATCH WHERE VENUE_ID = venue)
        LOOP
            FOR S IN (SELECT PLAYER_ID, TAKEN_WICKETS, TOTAL_RUNS, TOTAL_SIXES_HIT, TOTAL_FOURS_HIT, TOTAL_CATCHES_TAKEN FROM SCORECARD WHERE MATCH_ID = R.MATCH_ID)
            LOOP
                SELECT COUNT(*) INTO playerexists FROM PLAYER_VENUE WHERE PLAYERID = S.PLAYER_ID;

                IF playerexists = 1 THEN
                    UPDATE PLAYER_VENUE
                    SET RUN = RUN + S.TOTAL_RUNS,
                        WICKET = WICKET + S.TAKEN_WICKETS,
                        SIX = SIX + S.TOTAL_SIXES_HIT,
                        FOUR = FOUR + S.TOTAL_FOURS_HIT,
                        CATCH = CATCH + S.TOTAL_CATCHES_TAKEN
                    WHERE PLAYERID = S.PLAYER_ID;
                ELSE
                    INSERT INTO PLAYER_VENUE (PLAYERID, RUN, WICKET, SIX, FOUR, CATCH)
                    VALUES (S.PLAYER_ID, S.TOTAL_RUNS, S.TAKEN_WICKETS, S.TOTAL_SIXES_HIT, S.TOTAL_FOURS_HIT, S.TOTAL_CATCHES_TAKEN);
                END IF;
            END LOOP;
        END LOOP;

        SELECT PLAYERID INTO highestrun
        FROM PLAYER_VENUE
        WHERE RUN = (SELECT MAX(RUN) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestwicket
        FROM PLAYER_VENUE
        WHERE WICKET = (SELECT MAX(WICKET) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestsix
        FROM PLAYER_VENUE
        WHERE SIX = (SELECT MAX(SIX) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestfour
        FROM PLAYER_VENUE
        WHERE FOUR = (SELECT MAX(FOUR) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestcatch
        FROM PLAYER_VENUE
        WHERE CATCH = (SELECT MAX(CATCH) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        DELETE FROM PLAYER_VENUE;

        result := highestrun || ',' || highestwicket || ',' || highestsix || ',' || highestfour || ',' || highestcatch;
    ELSE
        result := NULL;
    END IF;

    RETURN result;
END;




CREATE OR REPLACE FUNCTION GET_STATS_OF_VENUE(VENUEID NUMBER) RETURN VARCHAR2 IS
    highestrun NUMBER;
    highestwicket NUMBER;
    highestsix NUMBER;
    highestfour NUMBER;
    highestcatch NUMBER;
    venue NUMBER;
    playerexists NUMBER := 0;
    result VARCHAR2(100);
BEGIN
    venue := VENUEID;

    INSERT INTO LOG_TABLE (USERNAME, DESCRIPTION, DATETIME)
    VALUES (USER, 'Get_Stat_Venue function' || ' has been called', SYSDATE);

    SELECT COUNT(*) INTO playerexists FROM MATCH WHERE VENUE_ID = venue;

    IF playerexists > 0 THEN
        FOR R IN (SELECT MATCH_ID FROM MATCH WHERE VENUE_ID = venue)
        LOOP
            FOR S IN (SELECT PLAYER_ID, TAKEN_WICKETS, TOTAL_RUNS, TOTAL_SIXES_HIT, TOTAL_FOURS_HIT, TOTAL_CATCHES_TAKEN FROM SCORECARD WHERE MATCH_ID = R.MATCH_ID)
            LOOP
                SELECT COUNT(*) INTO playerexists FROM PLAYER_VENUE WHERE PLAYERID = S.PLAYER_ID;

                IF playerexists = 1 THEN
                    UPDATE PLAYER_VENUE
                    SET RUN = RUN + S.TOTAL_RUNS,
                        WICKET = WICKET + S.TAKEN_WICKETS,
                        SIX = SIX + S.TOTAL_SIXES_HIT,
                        FOUR = FOUR + S.TOTAL_FOURS_HIT,
                        CATCH = CATCH + S.TOTAL_CATCHES_TAKEN
                    WHERE PLAYERID = S.PLAYER_ID;
                ELSE
                    INSERT INTO PLAYER_VENUE (PLAYERID, RUN, WICKET, SIX, FOUR, CATCH)
                    VALUES (S.PLAYER_ID, S.TOTAL_RUNS, S.TAKEN_WICKETS, S.TOTAL_SIXES_HIT, S.TOTAL_FOURS_HIT, S.TOTAL_CATCHES_TAKEN);
                END IF;
            END LOOP;
        END LOOP;

        SELECT PLAYERID INTO highestrun
        FROM PLAYER_VENUE
        WHERE RUN = (SELECT MAX(RUN) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestwicket
        FROM PLAYER_VENUE
        WHERE WICKET = (SELECT MAX(WICKET) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestsix
        FROM PLAYER_VENUE
        WHERE SIX = (SELECT MAX(SIX) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestfour
        FROM PLAYER_VENUE
        WHERE FOUR = (SELECT MAX(FOUR) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        SELECT PLAYERID INTO highestcatch
        FROM PLAYER_VENUE
        WHERE CATCH = (SELECT MAX(CATCH) FROM PLAYER_VENUE)
        AND ROWNUM <= 1;

        DELETE FROM PLAYER_VENUE;

        result := highestrun || ',' || highestwicket || ',' || highestsix || ',' || highestfour || ',' || highestcatch;
    ELSE
        result := NULL;
    END IF;

    RETURN result;
END;






CREATE OR REPLACE FUNCTION GetHostedSeriesCountForTeam(teamName_in VARCHAR2) RETURN NUMBER AS
    v_hosted_series_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_hosted_series_count
    FROM Series s
    JOIN Team_Participates_In_Series tps ON s.Series_ID = tps.Series_ID
    JOIN Team t ON tps.Team_ID = t.Team_id
    WHERE t.Team_Name = teamName_in AND s.Host = teamName_in;

    RETURN v_hosted_series_count;
END GetHostedSeriesCountForTeam;


CREATE OR REPLACE FUNCTION GetSeriesWinsForTeam(team_id NUMBER) RETURN NUMBER AS
    win_count NUMBER;
BEGIN
 INSERT INTO LOG_TABLE (USERNAME, DESCRIPTION, DATETIME)
  VALUES (USER, 'Series_win function' || ' has been called', SYSDATE);
    SELECT COUNT(s.Winner) INTO win_count
    FROM Team_Participates_In_Series tpis
    JOIN Series s ON tpis.Series_ID = s.Series_ID AND tpis.Team_ID = s.Winner
    WHERE tpis.Team_ID = team_id;

    RETURN win_count;
END;


CREATE OR REPLACE PROCEDURE HIGHEST_RUN_IN_SERIES IS
  playerid NUMBER;
  run NUMBER;
BEGIN
  FOR R IN (SELECT SERIES_ID FROM series)
  LOOP
    -- Initialize variables to NULL
    playerid := NULL;
    run := NULL;

    -- Handle the NO_DATA_FOUND exception
    BEGIN
      SELECT PLAYER_ID, SUM(TOTAL_RUNS) INTO playerid, run
      FROM SCORECARD S
      JOIN MATCH M ON S.MATCH_ID = M.MATCH_ID
      WHERE M.SERIES_ID = R.SERIES_ID
      GROUP BY PLAYER_ID
      HAVING SUM(TOTAL_RUNS) >= ALL (
        SELECT SUM(TOTAL_RUNS)
        FROM SCORECARD S2
        JOIN MATCH M2 ON S2.MATCH_ID = M2.MATCH_ID
        WHERE M2.SERIES_ID = R.SERIES_ID
        GROUP BY PLAYER_ID
      )
      FETCH FIRST 1 ROW ONLY;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        -- Handle the case when there is no matching data in the SCORECARD table
        -- You can log the exception or take appropriate action here
        playerid := NULL;
        run := NULL;
    END;

    -- Update the SERIES table only if playerid and run are not NULL
    IF playerid IS NOT NULL AND run IS NOT NULL THEN
      UPDATE SERIES
      SET HIGHEST_RUN_SCORER = playerid,
          HIGHESTRUN = run
      WHERE SERIES_ID = R.SERIES_ID;
    END IF;

  END LOOP;
END;


CREATE OR REPLACE PROCEDURE HIGHEST_RUN_SCORER(VENUEID IN  NUMBER,highestrun OUT NUMBER,highestwicket OUT NUMBER,highestsix OUT NUMBER,highestfour OUT NUMBER,highestcatch OUT NUMBER) IS 
venue NUMBER;

playerexists NUMBER:=0;
BEGIN
venue:=VENUEID;
FOR R IN (SELECT MATCH_ID FROM MATCH WHERE VENUE_ID=venue)
LOOP 
FOR S IN (SELECT PLAYER_ID,TAKEN_WICKETS,TOTAL_RUNS,TOTAL_SIXES_HIT,TOTAL_FOURS_HIT,TOTAL_CATCHES_TAKEN FROM SCORECARD WHERE MATCH_ID=R.MATCH_ID)
LOOP 
SELECT COUNT(*) INTO playerexists FROM PLAYER_VENUE WHERE 
PLAYERID=S.PLAYER_ID;
IF playerexists=1 THEN 
UPDATE PLAYER_VENUE 
SET RUN=RUN+S.TOTAL_RUNS,
		WICKET=WICKET+S.TAKEN_WICKETS,
		SIX=SIX+S.TOTAL_SIXES_HIT,
		FOUR=FOUR+S.TOTAL_FOURS_HIT,
		CATCH=CATCH+S.TOTAL_CATCHES_TAKEN
		WHERE PLAYERID=S.PLAYER_ID;
ELSE 
INSERT INTO PLAYER_VENUE(PLAYERID,RUN,WICKET,SIX,FOUR,CATCH) 
VALUES(S.PLAYER_ID,S.TOTAL_RUNS,S.TAKEN_WICKETS,S.TOTAL_SIXES_HIT,S.TOTAL_FOURS_HIT,S.TOTAL_CATCHES_TAKEN);
END IF;


END LOOP;

END LOOP;

SELECT PLAYERID INTO highestrun 
FROM PLAYER_VENUE
WHERE RUN =(SELECT MAX(RUN) FROM PLAYER_VENUE)
AND ROWNUM <= 1;
DBMS_OUTPUT.PUT_LINE(highestrun);


SELECT PLAYERID INTO highestwicket 
FROM PLAYER_VENUE
WHERE WICKET =(SELECT MAX(WICKET) FROM PLAYER_VENUE)
AND ROWNUM <= 1;


SELECT PLAYERID INTO highestsix 
FROM PLAYER_VENUE
WHERE SIX =(SELECT MAX(SIX) FROM PLAYER_VENUE)
AND ROWNUM <= 1;


SELECT PLAYERID INTO highestfour 
FROM PLAYER_VENUE
WHERE FOUR =(SELECT MAX(FOUR) FROM PLAYER_VENUE)
AND ROWNUM <= 1;


SELECT PLAYERID INTO highestcatch 
FROM PLAYER_VENUE
WHERE CATCH =(SELECT MAX(CATCH) FROM PLAYER_VENUE)
AND ROWNUM <= 1;

END;




CREATE OR REPLACE PROCEDURE HIGHEST_WICKET_IN_SERIES IS
  playerid NUMBER;
  wicket NUMBER;
BEGIN
  FOR R IN (SELECT SERIES_ID FROM series)
  LOOP
    playerid := NULL;
    wicket := NULL;

    BEGIN
      SELECT PLAYER_ID, SUM(TAKEN_WICKETS) INTO playerid, wicket
      FROM SCORECARD S
      JOIN MATCH M ON S.MATCH_ID = M.MATCH_ID
      WHERE M.SERIES_ID = R.SERIES_ID
      GROUP BY PLAYER_ID
      HAVING SUM(TAKEN_WICKETS) >= ALL (
        SELECT SUM(TAKEN_WICKETS)
        FROM SCORECARD S2
        JOIN MATCH M2 ON S2.MATCH_ID = M2.MATCH_ID
        WHERE M2.SERIES_ID = R.SERIES_ID
        GROUP BY PLAYER_ID
      )
      FETCH FIRST 1 ROW ONLY;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
       
        playerid := NULL;
        wicket := NULL;
    END;

    IF playerid IS NOT NULL AND wicket IS NOT NULL THEN
      UPDATE SERIES
      SET HIGHEST_WICKET_TAKER = playerid,
          HIGHESTWICKET = wicket
      WHERE SERIES_ID = R.SERIES_ID;
    END IF;

  END LOOP;
END;



CREATE OR REPLACE PROCEDURE MAN_OF_THE_SERIES IS 
run NUMBER;
matches NUMBER;
wicket NUMBER;
runratio NUMBER;
wicketratio NUMBER;
mots NUMBER;
BEGIN
for R IN  (SELECT SERIES_ID,HIGHEST_RUN_SCORER,HIGHEST_WICKET_TAKER FROM series)
LOOP
SELECT HIGHESTRUN,HIGHESTWICKET INTO run,wicket FROM SERIES
WHERE SERIES_ID=R.SERIES_ID;
SELECT COUNT(*) into matches FROM MATCH WHERE SERIES_ID=R.SERIES_ID;
runratio:=run/matches;
wicketratio:=wicket/matches;
runratio:=runratio/100;
wicketratio:=wicketratio/4;
IF runratio>=wicketratio THEN
mots:=R.HIGHEST_RUN_SCORER;
ELSE 
mots:=
R.HIGHEST_WICKET_TAKER;
END IF;
UPDATE SERIES S 
SET MAN_OF_THE_SERIES=mots
WHERE S.SERIES_ID=R.SERIES_ID;
END LOOP;
END;


CREATE OR REPLACE PROCEDURE Rating_Update IS 

run1 NUMBER:=0;
run2 NUMBER :=0;
winner NUMBER;
looser NUMBER;

BEGIN
FOR M IN (SELECT MATCH_ID,TEAM1_ID,TEAM2_ID FROM MATCH)
LOOP
	
	SELECT SUM(TOTAL_RUNS) INTO run1 FROM SCORECARD WHERE MATCH_ID=M.MATCH_ID
	AND PLAYER_ID IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID=M.TEAM1_ID);
	
	SELECT SUM(TOTAL_RUNS) INTO run2 FROM SCORECARD WHERE MATCH_ID=M.MATCH_ID
	AND PLAYER_ID IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID=M.TEAM2_ID);
	IF run1 IS NOT NULL AND run2 IS NOT NULL THEN 
		IF run1 >run2 THEN 
		winner:=M.TEAM1_ID;
		looser:=M.TEAM2_ID;
		ELSE 
		winner :=M.TEAM2_ID;
		looser :=M.TEAM1_ID;
		END IF;
	
		UPDATE TEAM_STATS
		SET NOOFWINS=NVL(NOOFWINS,0)+1,
		POINTSSOFAR=NVL(POINTSSOFAR,0)+2
		WHERE TEAM_ID=winner;
		UPDATE TEAM_STATS
		SET NOOFLOSSES=NVL(NOOFLOSSES,0)+1,
		POINTSSOFAR=NVL(POINTSSOFAR,0)-1
		WHERE TEAM_ID=looser;
		UPDATE MATCH 
		SET WINNER=winner
		WHERE MATCH_ID=M.MATCH_ID;
-- 	
		UPDATE TEAM 
		SET TEAM_RATING=TEAM_RATING+2
		WHERE TEAM_ID=winner;
	
		UPDATE TEAM 
		SET TEAM_RATING=TEAM_RATING-1
		WHERE TEAM_ID=looser;
	END IF;
	
END LOOP;

END;


CREATE OR REPLACE PROCEDURE RESET_RATING IS 

BEGIN

UPDATE TEAM 
SET TEAM_RATING=0;
DELETE FROM TEAM_STATS;
INSERT INTO TEAM_STATS(STATID,TEAM_ID)
SELECT TEAM_ID,TEAM_ID FROM TEAM;
END;




CREATE OR REPLACE PROCEDURE SERIES_FOUR_SIX_UPDATE IS 
sixs NUMBER;
fours NUMBER;
BEGIN
for R IN  (SELECT SERIES_ID FROM series)
LOOP

SELECT SUM(TOTAL_FOURS_HIT) into fours FROM SCORECARD S JOIN MATCH M 
ON  S.MATCH_ID=M.MATCH_ID
WHERE M.SERIES_ID=R.SERIES_ID;

SELECT SUM(TOTAL_SIXES_HIT) INTO sixs FROM SCORECARD S JOIN MATCH M 
ON  S.MATCH_ID=M.MATCH_ID
WHERE M.SERIES_ID=R.SERIES_ID;

UPDATE SERIES 
SET SIX=sixs,
FOUR=fours 
WHERE SERIES_ID=R.SERIES_ID;

END LOOP;
END;




CREATE OR REPLACE PROCEDURE TEAM_STRENGTH_UPDATE IS
  batting NUMBER := 0;
  bowling NUMBER := 0;
  total NUMBER := 0;
  counts NUMBER := 0;
BEGIN
  FOR T IN (SELECT TEAM_ID FROM TEAM) LOOP
    BEGIN
      SELECT SUM(NVL(RANK, 100)) INTO batting FROM batting_rank
      WHERE playerid IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID = T.TEAM_ID);
			
      SELECT SUM(NVL(RANK, 100)) INTO bowling
      FROM (
        SELECT RANK
        FROM BOWLING_RANK
        WHERE playerid IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID = T.TEAM_ID)
        ORDER BY NVL(RANK, 100) ASC
        FETCH FIRST 6 ROWS ONLY
      );

      SELECT COUNT(*) INTO counts FROM TEAM_STRENGTH WHERE TEAMID = T.TEAM_ID;

      IF counts = 1 THEN
        UPDATE TEAM_STRENGTH SET BATTING = batting, BOWLING = bowling WHERE TEAMID = T.TEAM_ID;
      ELSE
        INSERT INTO TEAM_STRENGTH (TEAMID, BATTING, BOWLING) VALUES (T.TEAM_ID, batting, bowling);
      END IF;

      DBMS_OUTPUT.PUT_LINE('Team ' || T.TEAM_ID || ': Batting = ' || batting || ', Bowling = ' || bowling);
      UPDATE TEAM_STRENGTH
			SET TOTAL=batting+bowling 
			WHERE TEAMID=T.TEAM_ID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for team ' || T.TEAM_ID);
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred for team ' || T.TEAM_ID || ': ' || SQLERRM);
    END;
  END LOOP;
  
  COMMIT; 
END;


CREATE OR REPLACE PROCEDURE UPDATE_BATTING_RANK IS 
BEGIN

FOR R IN ( SELECT PL.PLAYERID ID ,DENSE_RANK() OVER (ORDER BY  NVL(NVL(TOTAL_RUN,0)*AVG,0) DESC) AS RANK
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
				JOIN BATTING_STAT BS  ON PL.PLAYERID=BS.PLAYERID
				ORDER BY  NVL(NVL(TOTAL_RUN,0)*AVG,0) DESC
)
LOOP
	UPDATE BATTING_RANK 
	SET RANK=R.RANK 
	WHERE PLAYERID=R.ID;

END LOOP;
END;


CREATE OR REPLACE PROCEDURE UPDATE_BOWLING_RANK IS 
BEGIN

FOR R IN ( 
	SELECT PL.PLAYERID ID,DENSE_RANK() OVER (ORDER BY  NVL(NVL(BOWLING_AVG,0)/NVL(BS.WICKETS,0),0) ASC) AS RANK
        FROM PLAYER PL
        JOIN PERSON PR ON PL.PLAYERID = PR.PERSONID
				JOIN BOWLING_STAT BS  ON PL.PLAYERID=BS.PLAYERID
				WHERE WICKETS >0 
)
LOOP
	UPDATE BOWLING_RANK 
	SET RANK=R.RANK 
	WHERE PLAYERID=R.ID;

END LOOP;
END;




CREATE OR REPLACE PROCEDURE UPDATE_DREAM11_STATS  IS 
bats NUMBER:=0;
bowls NUMBER:=0;
totals NUMBER :=0;
counts NUMBER :=0;
BEGIN
SELECT SUM(BT.RANK) BAT INTO bats FROM DREAM11 D  JOIN BATTING_RANK BT 
ON D.PLAYERID=BT.PLAYERID
JOIN BOWLING_RANK BL ON 
D.PLAYERID=BL.PLAYERID;

SELECT SUM(RANK) INTO bowls FROM (
SELECT NVL(BL.RANK,150) AS RANK  FROM DREAM11 D  
JOIN BOWLING_RANK BL ON 
D.PLAYERID=BL.PLAYERID
ORDER BY NVL(BL.RANK,150) ASC
FETCH FIRST 6 ROWS ONLY
);
totals:=bats+bowls;
SELECT COUNT(*) INTO counts FROM DREAM11STATS ;
DBMS_OUTPUT.PUT_LINE(bats||bowls||totals||counts);
IF counts=1 THEN
  UPDATE DREAM11STATS 
  SET BAT=bats,
  BOWL=bowls,
  TOTAL=totals;
ELSE
INSERT INTO DREAM11STATS VALUES(bats,bowls,totals);
END IF;

END;


CREATE OR REPLACE PROCEDURE WINNER_UPDATE IS 

run1 NUMBER := 0;
run2 NUMBER := 0;
winners NUMBER;
loosers NUMBER;

BEGIN
  FOR M IN (SELECT MATCH_ID, TEAM1_ID, TEAM2_ID FROM MATCH)
  LOOP
    SELECT SUM(TOTAL_RUNS) INTO run1 FROM SCORECARD WHERE MATCH_ID = M.MATCH_ID
      AND PLAYER_ID IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID = M.TEAM1_ID);

    SELECT SUM(TOTAL_RUNS) INTO run2 FROM SCORECARD WHERE MATCH_ID = M.MATCH_ID
      AND PLAYER_ID IN (SELECT PLAYERID FROM PLAYER WHERE TEAM_ID = M.TEAM2_ID);

    IF run1 IS NOT NULL AND run2 IS NOT NULL THEN
      IF run1 > run2 THEN 
        winners := M.TEAM1_ID;
        loosers := M.TEAM2_ID;
      ELSE 
        winners := M.TEAM2_ID;
        loosers := M.TEAM1_ID;
      END IF;

			DBMS_OUTPUT.PUT_LINE('Winner: ' || winners);

      UPDATE MATCH
      SET WINNER = winners
      WHERE MATCH_ID = M.MATCH_ID;

    END IF;
  END LOOP;
END;