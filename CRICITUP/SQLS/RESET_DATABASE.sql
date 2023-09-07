DELETE FROM BATTING_STAT;
DELETE FROM BOWLING_STAT;
DELETE FROM FIELDING_STAT;
DELETE FROM TEAM_STATS;
DELETE FROM SCORECARD;
DELETE FROM MATCH_UMPIRE WHERE MATCH_ID >15;
DELETE FROM PLAYS WHERE MATCH_ID >15;
DELETE FROM MATCH WHERE MATCH_ID >15;
DELETE FROM TEAM WHERE TEAM_ID >9;
DELETE FROM PERSON WHERE PERSONID>118;
DELETE FROM PLAYER WHERE PLAYERID>99;
DELETE FROM UMPIRE WHERE PERSONID>109;
DELETE FROM COACH WHERE PERSONID >118;
DELETE FROM VENUE WHERE VENUE_ID>9;
DELETE FROM TEAM_PARTICIPATES_IN_SERIES 
WHERE SERIES_ID>5;
DELETE FROM SERIES 
WHERE SERIES_ID>5;
DELETE FROM BOWLER WHERE PLAYERID>99;
DELETE FROM BATSMAN WHERE PLAYERID>99;
INSERT INTO TEAM_STATS(STATID,TEAM_ID)
SELECT TEAM_ID,TEAM_ID FROM TEAM;
UPDATE  TEAM 
SET TEAM_RATING=0;

INSERT INTO FIELDING_STAT(STATID,PLAYERID)
SELECT PLAYERID,PLAYERID FROM PLAYER ;

INSERT INTO BATTING_STAT(STATID,PLAYERID)
SELECT PLAYERID,PLAYERID FROM PLAYER;
INSERT INTO BOWLING_STAT(STATID,PLAYERID)
SELECT PLAYERID,PLAYERID FROM PLAYER;
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (1, 1, 0, 0, 0, 43, 50, 0, 0, 2, 1, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (2, 2, 0, 0, 0, 15, 20, 0, 0, 1, 2, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (3, 3, 0, 0, 0, 32, 40, 0, 0, 0, 4, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (4, 4, 0, 0, 0, 21, 28, 0, 0, 0, 3, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (5, 8, 0, 0, 0, 14, 15, 0, 0, 0, 2, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (6, 7, 0, 0, 0, 8, 12, 0, 0, 0, 1, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (7, 10, 0, 0, 0, 7, 10, 0, 0, 0, 1, 0, 0, 0, 1);

-- Bangladesh Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (8, 5, 4.0, 2, 25, 2, 3, 0, 1, 0, 0, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (9, 6, 5.0, 1, 28, 1, 2, 1, 0, 0, 0, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (10, 11, 4.0, 0, 18, 0, 0, 3, 0, 0, 0, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (11, 9, 5.0, 2, 30, 3, 4, 0, 1, 0, 0, 0, 0, 0, 1);

-- India Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (12, 12, 0, 0, 0, 120, 130, 0, 0, 1, 12, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (13, 13, 0, 0, 0, 85, 100, 1, 0, 0, 9, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (14, 14, 0, 0, 0, 70, 80, 0, 0, 0, 7, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (15, 15, 0, 0, 0, 105, 120, 1, 0, 1, 9, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (16, 16, 0, 0, 0, 30, 40, 0, 0, 1, 2, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (17, 17, 0, 0, 0, 22, 30, 0, 0, 0, 3, 0, 0, 0, 1);

-- India Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (18, 18, 10.0, 3, 50, 6, 10, 0, 0, 0, 0, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (19, 19, 9.0, 1, 55, 15, 20, 1, 0, 1, 2, 0, 0, 1, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (20, 20, 10.0, 2, 65, 10, 15, 0, 0, 0, 1, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (21, 21, 10.0, 1, 50, 20, 30, 1, 0, 0, 2, 0, 0, 0, 1);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (22, 22, 9.0, 0, 45, 2, 5, 0, 0, 0, 0, 0, 0, 0, 1);


--2nd Match

-- Bangladesh Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (23, 1, 0, 0, 0, 65, 80, 0, 0, 3, 8, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (24, 2, 0, 0, 0, 28, 40, 0, 0, 0, 3, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (25, 3, 0, 0, 0, 42, 55, 0, 0, 2, 4, 0, 0, 1, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (26, 4, 0, 0, 0, 18, 25, 0, 0, 0, 2, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (27, 8, 0, 0, 0, 10, 12, 0, 0, 0, 1, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (28, 7, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (29, 10, 0, 0, 0, 2, 5, 0, 0, 0, 0, 0, 0, 0, 2);

-- Bangladesh Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (30, 5, 9.0, 3, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (31, 6, 8.0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (32, 11, 7.0, 0, 30, 0, 0, 3, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (33, 9, 8.0, 2, 45, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2);
    -- India Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (34, 12, 0, 0, 0, 102, 90, 0, 0, 7, 9, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (35, 13, 0, 0, 0, 88, 75, 0, 0, 3, 6, 0, 0, 0, 2);

-- Continue inserting data for the remaining India batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (36, 14, 0, 0, 0, 12, 20, 0, 0, 0, 1, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (37, 15, 0, 0, 0, 28, 30, 0, 0, 0, 4, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (38, 16, 0, 0, 0, 14, 15, 0, 0, 0, 1, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (39, 17, 0, 0, 0, 8, 10, 0, 0, 0, 1, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (40, 18, 0, 0, 0, 32, 25, 0, 0, 1, 3, 0, 0, 0, 2);

-- India Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (41, 19, 10.0, 2, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (42, 20, 9.0, 1, 47, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2);
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (43, 21, 10.0, 0, 55, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES
    (44, 22, 7.0, 0, 42, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2);


-- Bangladesh Batsmen
-- Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (45, 1, 0, 0, 0, 65, 70, 0, 0, 3, 5, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (46, 2, 0, 0, 0, 42, 55, 0, 0, 1, 4, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (47, 3, 0, 0, 0, 35, 45, 0, 0, 0, 3, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (48, 4, 0, 0, 0, 28, 40, 0, 0, 0, 2, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (49, 8, 0, 0, 0, 18, 25, 0, 0, 0, 1, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (50, 7, 0, 0, 0, 12, 20, 0, 0, 0, 1, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (51, 10, 0, 0, 0, 8, 15, 0, 0, 0, 1, 0, 0, 0, 3);

-- Bangladesh Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (52, 5, 6.0, 1, 40, 5, 10, 0, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (53, 6, 5.0, 2, 30, 3, 5, 0, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (54, 11, 4.0, 1, 20, 2, 5, 1, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (55, 9, 6.0, 2, 35, 3, 6, 1, 0, 0, 0, 0, 0, 1, 3);
-- India Batsmen
-- Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (56, 12, 0, 0, 0, 85, 90, 0, 0, 4, 6, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (57, 13, 0, 0, 0, 62, 70, 0, 0, 3, 5, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (58, 14, 0, 0, 0, 45, 50, 0, 0, 1, 4, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (59, 15, 0, 0, 0, 35, 40, 0, 0, 0, 3, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (60, 16, 0, 0, 0, 22, 25, 0, 0, 0, 2, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (61, 17, 0, 0, 0, 15, 18, 0, 0, 0, 1, 0, 0, 0, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (62, 18, 0, 0, 0, 10, 12, 0, 0, 0, 1, 0, 0, 0, 3);

-- India Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (63, 19, 7.0, 2, 45, 3, 6, 0, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (64, 20, 6.0, 1, 50, 1, 3, 2, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (65, 21, 6.0, 2, 40, 5, 8, 0, 0, 0, 0, 0, 0, 1, 3);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (66, 22, 5.0, 0, 30, 0, 1, 2, 0, 0, 0, 0, 0, 0, 3);
-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (67, 23, 0, 0, 0, 35, 40, 0, 0, 0, 4, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (68, 24, 0, 0, 0, 18, 25, 0, 0, 0, 2, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (69, 25, 0, 0, 0, 28, 35, 0, 0, 1, 2, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (70, 26, 0, 0, 0, 24, 30, 0, 0, 0, 2, 0, 0, 1, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (71, 27, 0, 0, 0, 12, 15, 0, 0, 0, 1, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (72, 28, 0, 0, 0, 8, 10, 0, 0, 0, 1, 0, 0, 1, 4);

-- Pakistan Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (73, 29, 4.0, 1, 25, 2, 3, 0, 1, 0, 0, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (74, 30, 5.0, 2, 28, 1, 2, 1, 0, 0, 0, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (75, 31, 4.0, 0, 18, 0, 0, 3, 0, 0, 0, 0, 0, 1, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (76, 32, 5.0, 2, 30, 3, 4, 0, 1, 0, 0, 0, 0, 0, 4);

-- Continue for the remaining bowlers
-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (77, 33, 0, 0, 0, 10, 12, 0, 0, 0, 1, 0, 0, 0, 4);

-- Continue with the rest of the players
-- South Africa Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (78, 67, 0, 0, 0, 42, 45, 0, 0, 2, 5, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (79, 68, 0, 0, 0, 25, 28, 0, 0, 1, 3, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (80, 69, 0, 0, 0, 32, 35, 0, 0, 0, 3, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (81, 70, 0, 0, 0, 18, 20, 0, 0, 0, 2, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (82, 71, 0, 0, 0, 10, 12, 0, 0, 0, 1, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (83, 72, 0, 0, 0, 8, 10, 0, 0, 0, 1, 0, 0, 0, 4);

-- South Africa Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (84, 73, 4.0, 2, 27, 3, 4, 0, 1, 0, 0, 0, 0, 1, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (85, 74, 5.0, 1, 32, 1, 2, 1, 0, 0, 0, 0, 0, 0, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (86, 75, 4.0, 0, 18, 0, 0, 3, 0, 0, 0, 0, 0, 1, 4);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (87, 76, 5.0, 1, 30, 2, 3, 0, 1, 0, 0, 0, 0, 0, 4);

-- Continue with the rest of the players
-- South Africa Batsman
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (88, 77, 0, 0, 0, 14, 18, 0, 0, 0, 1, 0, 0, 0, 4);

-- Continue with the rest of the players
-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (89, 23, 0, 0, 0, 42, 50, 0, 0, 1, 5, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (90, 24, 0, 0, 0, 28, 35, 0, 0, 0, 3, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (91, 25, 0, 0, 0, 18, 25, 0, 0, 0, 2, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (92, 26, 0, 0, 0, 32, 40, 0, 0, 0, 3, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (93, 27, 0, 0, 0, 14, 20, 0, 0, 0, 1, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (94, 28, 0, 0, 0, 7, 10, 0, 0, 0, 1, 0, 0, 0, 5);

-- Pakistan Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (95, 29, 4.0, 1, 28, 2, 3, 0, 1, 0, 0, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (96, 30, 5.0, 2, 35, 1, 2, 1, 0, 0, 0, 0, 0, 0, 5);
-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (97, 31, 0, 0, 0, 18, 20, 0, 0, 0, 2, 0, 0, 0, 5);

-- Pakistan Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (98, 32, 4.0, 0, 30, 2, 3, 0, 0, 0, 0, 0, 0, 1, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (99, 33, 5.0, 2, 22, 1, 2, 0, 1, 0, 0, 0, 0, 0, 5);
-- South Africa Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (100, 67, 0, 0, 0, 24, 35, 0, 0, 0, 4, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (101, 68, 0, 0, 0, 32, 40, 0, 0, 1, 3, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (102, 69, 0, 0, 0, 18, 25, 0, 0, 0, 2, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (103, 70, 0, 0, 0, 28, 35, 0, 0, 1, 3, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (104, 71, 0, 0, 0, 12, 15, 0, 0, 0, 1, 0, 0, 0, 5);

-- South Africa Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (105, 72, 4.0, 1, 30, 3, 4, 0, 0, 0, 0, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (106, 73, 5.0, 2, 28, 1, 2, 1, 0, 0, 0, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (107, 74, 4.0, 0, 20, 0, 0, 4, 0, 0, 0, 0, 0, 1, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (108, 75, 5.0, 2, 22, 1, 2, 0, 1, 0, 0, 0, 0, 0, 5);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (109, 76, 4.0, 0, 28, 2, 3, 0, 0, 0, 0, 0, 0, 1, 5);

-- South Africa Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (110, 77, 0, 0, 0, 35, 50, 0, 0, 1, 4, 0, 0, 0, 5);
-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (111, 23, 0, 0, 0, 28, 35, 0, 0, 0, 3, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (112, 24, 0, 0, 0, 22, 30, 0, 0, 0, 2, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (113, 25, 0, 0, 0, 18, 25, 0, 0, 0, 2, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (114, 26, 0, 0, 0, 32, 40, 0, 0, 1, 3, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (115, 27, 0, 0, 0, 16, 20, 0, 0, 0, 1, 0, 0, 0, 6);

-- Pakistan Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (116, 28, 4.0, 1, 28, 1, 2, 0, 0, 0, 0, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (117, 29, 5.0, 2, 32, 2, 3, 0, 1, 0, 0, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (118, 30, 4.0, 0, 20, 0, 0, 2, 0, 0, 0, 0, 0, 1, 6);

-- Pakistan Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (119, 31, 0, 0, 0, 28, 35, 0, 0, 0, 2, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (120, 32, 0, 0, 0, 16, 25, 0, 0, 0, 1, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (121, 33, 0, 0, 0, 10, 15, 0, 0, 0, 1, 0, 0, 0, 6);
-- South Africa Batsmen
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (122, 67, 0, 0, 0, 45, 55, 0, 0, 1, 6, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (123, 68, 0, 0, 0, 32, 45, 0, 0, 0, 4, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (124, 69, 0, 0, 0, 28, 30, 0, 0, 0, 3, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (125, 70, 0, 0, 0, 18, 20, 0, 0, 0, 2, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (126, 71, 0, 0, 0, 24, 25, 0, 0, 0, 3, 0, 0, 0, 6);

-- South Africa Bowlers
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (127, 72, 4.0, 1, 28, 1, 2, 0, 0, 0, 0, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (128, 73, 5.0, 2, 35, 2, 3, 0, 1, 0, 0, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (129, 74, 4.0, 0, 20, 0, 0, 2, 0, 0, 0, 0, 0, 1, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (130, 75, 0, 0, 0, 28, 35, 0, 0, 0, 2, 0, 0, 0, 6);

INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (131, 76, 0, 0, 0, 16, 20, 0, 0, 0, 1, 0, 0, 0, 6);
-- South Africa Batsman
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (132, 77, 0, 0, 0, 22, 25, 0, 0, 0, 2, 0, 0, 0, 6);

UPDATE match 
set team1_id=8,
team2_id=9 
where match_id IN (10,11,12);
UPDATE match 
set team1_id=2,
team2_id=6 
where match_id IN (13,14,15);
DELETE FROM PLAYS 
WHERE MATCH_ID IN (10,11,12);
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (10, 8, TO_DATE('2023-08-24', 'YYYY-MM-DD'));
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (10, 9, TO_DATE('2023-08-24', 'YYYY-MM-DD'));

-- Match 11
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (11, 8, TO_DATE('2023-08-25', 'YYYY-MM-DD'));
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (11, 9, TO_DATE('2023-08-25', 'YYYY-MM-DD'));

-- Match 12
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (12, 8, TO_DATE('2023-08-26', 'YYYY-MM-DD'));
INSERT INTO Plays (Match_id, Team_id, Schedule) VALUES (12, 9, TO_DATE('2023-08-26', 'YYYY-MM-DD'));

-- Scorecard data for Afghanistan players
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (199, 78, 5, 3, 35, 12, 150, 5, 0, 1, 2, 0, 0, 1, 10);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (200, 79, 4, 2, 42, 18, 180, 2, 0, 0, 3, 0, 0, 0, 10);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (201, 80, 4, 1, 28, 8, 120, 3, 0, 0, 0, 0, 0, 0, 10);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (202, 81, 5, 4, 19, 55, 240, 1, 1, 2, 7, 0, 0, 0, 10);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (203, 82, 5, 0, 38, 25, 132, 2, 0, 1, 3, 0, 0, 0, 10);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (204, 83, 4, 2, 30, 42, 132, 0, 0, 3, 5, 0, 0, 0, 10);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (205, 84, 2, 0, 0, 8, 60, 0, 0, 0, 1, 0, 0, 0, 10);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (206, 85, 4, 1, 45, 14, 180, 4, 0, 0, 2, 0, 0, 0, 10);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (207, 86, 3, 3, 28, 6, 90, 1, 0, 0, 1, 0, 0, 0, 10);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (208, 87, 4, 2, 37, 23, 120, 2, 0, 0, 4, 0, 0, 0, 10);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (209, 88, 3, 1, 29, 17, 108, 1, 0, 1, 3, 0, 0, 1, 10);

-- Scorecard data for West Indies players
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (210, 89, 5, 3, 38, 28, 150, 6, 0, 2, 1, 0, 1, 0, 10);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (211, 90, 5, 2, 40, 32, 180, 4, 0, 3, 2, 0, 0, 0, 10);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (212, 91, 3, 1, 25, 18, 90, 3, 0, 1, 3, 0, 0, 0, 10);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (213, 92, 6, 3, 48, 45, 210, 2, 0, 4, 4, 0, 0, 0, 10);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (214, 93, 5, 2, 37, 28, 150, 3, 0, 3, 2, 0, 0, 0, 10);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (215, 94, 4, 1, 30, 22, 120, 1, 0, 2, 1, 0, 0, 0, 10);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (216, 95, 4, 2, 36, 35, 144, 2, 0, 4, 2, 0, 0, 0, 10);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (217, 96, 5, 1, 42, 14, 180, 3, 0, 0, 0, 0, 0, 0, 10);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (218, 97, 3, 0, 22, 8, 90, 2, 0, 0, 1, 0, 0, 0, 10);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (219, 98, 6, 3, 47, 52, 240, 1, 0, 3, 4, 0, 0, 0, 10);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (220, 99, 4, 2, 35, 19, 120, 4, 0, 1, 3, 0, 1, 0, 10);

-- Scorecard data for Afghanistan players for the second match (Match_id = 11)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (221, 78, 5, 2, 38, 25, 120, 4, 0, 1, 2, 0, 0, 1, 11);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (222, 79, 4, 1, 32, 22, 90, 3, 0, 1, 1, 0, 0, 0, 11);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (223, 80, 6, 3, 45, 35, 150, 2, 0, 2, 3, 0, 0, 0, 11);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (224, 81, 5, 2, 37, 28, 132, 1, 0, 0, 2, 0, 0, 0, 11);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (225, 82, 4, 1, 30, 15, 90, 2, 0, 0, 0, 0, 0, 0, 11);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (226, 83, 4, 2, 35, 32, 120, 0, 0, 1, 2, 0, 0, 0, 11);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (227, 84, 3, 0, 18, 8, 60, 1, 0, 0, 1, 0, 0, 0, 11);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (228, 85, 5, 3, 42, 42, 180, 2, 0, 1, 5, 0, 0, 0, 11);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (229, 86, 5, 2, 38, 28, 150, 3, 0, 0, 2, 0, 0, 0, 11);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (230, 87, 6, 3, 47, 35, 180, 4, 0, 2, 4, 0, 0, 0, 11);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (231, 88, 5, 1, 35, 26, 132, 1, 0, 0, 2, 0, 0, 0, 11);




-- Scorecard data for West Indies players for the second match (Match_id = 11)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (232, 89, 4, 1, 32, 18, 120, 3, 0, 1, 2, 0, 0, 0, 11);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (233, 90, 5, 3, 42, 30, 150, 2, 0, 2, 3, 0, 0, 0, 11);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (234, 91, 5, 2, 38, 28, 132, 1, 0, 1, 1, 0, 0, 0, 11);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (235, 92, 6, 2, 47, 38, 180, 3, 0, 2, 4, 0, 0, 0, 11);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (236, 93, 4, 1, 30, 15, 90, 2, 0, 0, 1, 0, 0, 0, 11);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (237, 94, 3, 0, 18, 6, 60, 1, 0, 0, 0, 0, 0, 0, 11);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (238, 95, 4, 2, 35, 30, 120, 0, 0, 1, 2, 0, 0, 0, 11);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (239, 96, 5, 1, 40, 22, 150, 2, 0, 0, 1, 0, 0, 0, 11);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (240, 97, 5, 2, 45, 32, 180, 3, 0, 2, 3, 0, 0, 0, 11);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (241, 98, 4, 1, 32, 15, 120, 2, 0, 0, 1, 0, 0, 0, 11);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (242, 99, 6, 3, 50, 42, 210, 4, 0, 2, 4, 0, 0, 0, 11);


-- Updated total_balls_faced for Afghanistan players
-- Player 1
UPDATE Scorecard SET Total_Balls_Faced = 36 WHERE Scorecard_id = 221;

-- Player 2
UPDATE Scorecard SET Total_Balls_Faced = 29 WHERE Scorecard_id = 222;

-- Player 3
UPDATE Scorecard SET Total_Balls_Faced = 35 WHERE Scorecard_id = 223;

-- Player 4
UPDATE Scorecard SET Total_Balls_Faced = 31 WHERE Scorecard_id = 224;

-- Player 5
UPDATE Scorecard SET Total_Balls_Faced = 20 WHERE Scorecard_id = 225;

-- Player 6
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 226;

-- Player 7
UPDATE Scorecard SET Total_Balls_Faced = 15 WHERE Scorecard_id = 227;

-- Player 8
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 228;

-- Player 9
UPDATE Scorecard SET Total_Balls_Faced = 35 WHERE Scorecard_id = 229;

-- Player 10
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 230;

-- Player 11
UPDATE Scorecard SET Total_Balls_Faced = 34 WHERE Scorecard_id = 231;


-- Updated total_balls_faced for West Indies players
-- Player 1
UPDATE Scorecard SET Total_Balls_Faced = 32 WHERE Scorecard_id = 232;

-- Player 2
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 233;

-- Player 3
UPDATE Scorecard SET Total_Balls_Faced = 28 WHERE Scorecard_id = 234;

-- Player 4
UPDATE Scorecard SET Total_Balls_Faced = 38 WHERE Scorecard_id = 235;

-- Player 5
UPDATE Scorecard SET Total_Balls_Faced = 15 WHERE Scorecard_id = 236;

-- Player 6
UPDATE Scorecard SET Total_Balls_Faced = 6 WHERE Scorecard_id = 237;

-- Player 7
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 238;

-- Player 8
UPDATE Scorecard SET Total_Balls_Faced = 22 WHERE Scorecard_id = 239;

-- Player 9
UPDATE Scorecard SET Total_Balls_Faced = 32 WHERE Scorecard_id = 240;

-- Player 10
UPDATE Scorecard SET Total_Balls_Faced = 15 WHERE Scorecard_id = 241;

-- Player 11
UPDATE Scorecard SET Total_Balls_Faced = 42 WHERE Scorecard_id = 242;



-- Scorecard data for Afghanistan players for the third match (Match_id = 12)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (243, 78, 6, 3, 40, 35, 132, 2, 0, 2, 2, 0, 0, 0, 12);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (244, 79, 5, 2, 35, 28, 120, 1, 0, 1, 3, 0, 0, 0, 12);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (245, 80, 4, 1, 30, 22, 90, 2, 0, 0, 1, 0, 0, 0, 12);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (246, 81, 6, 3, 45, 38, 150, 2, 0, 1, 2, 0, 0, 0, 12);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (247, 82, 5, 1, 38, 15, 132, 1, 0, 0, 1, 0, 0, 0, 12);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (248, 83, 4, 1, 32, 18, 120, 1, 0, 1, 2, 0, 0, 0, 12);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (249, 84, 5, 2, 42, 32, 150, 2, 0, 0, 2, 0, 0, 0, 12);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (250, 85, 6, 3, 50, 42, 180, 3, 0, 2, 4, 0, 0, 0, 12);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (251, 86, 5, 2, 45, 30, 150, 2, 0, 0, 3, 0, 0, 0, 12);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (252, 87, 4, 1, 32, 18, 120, 1, 0, 1, 2, 0, 0, 0, 12);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (253, 88, 3, 0, 20, 6, 90, 1, 0, 0, 0, 0, 0, 0, 12);


-- Updated total_balls_faced for Afghanistan players in the third match
-- Player 1
UPDATE Scorecard SET Total_Balls_Faced = 35 WHERE Scorecard_id = 243;

-- Player 2
UPDATE Scorecard SET Total_Balls_Faced = 28 WHERE Scorecard_id = 244;

-- Player 3
UPDATE Scorecard SET Total_Balls_Faced = 22 WHERE Scorecard_id = 245;

-- Player 4
UPDATE Scorecard SET Total_Balls_Faced = 38 WHERE Scorecard_id = 246;

-- Player 5
UPDATE Scorecard SET Total_Balls_Faced = 15 WHERE Scorecard_id = 247;

-- Player 6
UPDATE Scorecard SET Total_Balls_Faced = 18 WHERE Scorecard_id = 248;

-- Player 7
UPDATE Scorecard SET Total_Balls_Faced = 32 WHERE Scorecard_id = 249;

-- Player 8
UPDATE Scorecard SET Total_Balls_Faced = 42 WHERE Scorecard_id = 250;

-- Player 9
UPDATE Scorecard SET Total_Balls_Faced = 30 WHERE Scorecard_id = 251;

-- Player 10
UPDATE Scorecard SET Total_Balls_Faced = 18 WHERE Scorecard_id = 252;

-- Player 11
UPDATE Scorecard SET Total_Balls_Faced = 6 WHERE Scorecard_id = 253;
-- Scorecard data for West Indies players for the third match (Match_id = 12)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (254, 89, 6, 2, 42, 38, 150, 3, 0, 0, 2, 0, 0, 0, 12);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (255, 90, 5, 1, 38, 32, 132, 2, 0, 1, 3, 0, 0, 0, 12);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (256, 91, 6, 3, 48, 42, 162, 1, 0, 2, 4, 0, 0, 0, 12);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (257, 92, 5, 2, 40, 28, 120, 1, 0, 1, 2, 0, 0, 0, 12);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (258, 93, 6, 3, 45, 38, 150, 2, 0, 1, 2, 0, 0, 0, 12);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (259, 94, 4, 1, 32, 15, 120, 1, 0, 0, 1, 0, 0, 0, 12);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (260, 95, 5, 2, 42, 28, 132, 2, 0, 1, 3, 0, 0, 0, 12);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (261, 96, 6, 3, 50, 38, 162, 1, 0, 2, 4, 0, 0, 0, 12);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (262, 97, 5, 2, 45, 32, 120, 2, 0, 1, 2, 0, 0, 0, 12);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (263, 98, 6, 3, 48, 42, 150, 1, 0, 2, 3, 0, 0, 0, 12);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (264, 99, 5, 2, 40, 28, 132, 1, 0, 1, 2, 0, 0, 0, 12);


-- Scorecard data for India players for the match (Match_id = 13)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (265, 12, 0, 0, 0, 45, 50, 0, 0, 1, 7, 0, 0, 1, 13);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (266, 13, 0, 0, 0, 62, 65, 0, 0, 2, 5, 0, 0, 0, 13);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (267, 14, 7, 3, 38, 14, 20, 1, 0, 0, 1, 0, 0, 0, 13);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (268, 15, 5, 1, 32, 18, 25, 0, 0, 1, 2, 0, 0, 1, 13);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (269, 16, 0, 0, 0, 35, 40, 0, 0, 1, 4, 0, 0, 0, 13);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (270, 17, 4, 1, 25, 28, 35, 0, 0, 1, 3, 0, 0, 1, 13);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (271, 18, 0, 0, 0, 42, 55, 0, 0, 0, 5, 0, 0, 0, 13);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (272, 19, 6, 2, 38, 22, 30, 0, 0, 0, 2, 0, 0, 0, 13);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (273, 20, 5, 3, 40, 28, 35, 0, 0, 0, 2, 0, 0, 0, 13);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (274, 21, 6, 2, 48, 36, 45, 1, 0, 0, 3, 0, 0, 0, 13);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (275, 22, 5, 1, 42, 18, 25, 0, 0, 1, 2, 0, 0, 0, 13);

-- Scorecard data for New Zealand players for the match (Match_id = 13)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (276, 56, 0, 0, 0, 48, 50, 0, 0, 2, 8, 0, 0, 0, 13);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (277, 57, 0, 0, 0, 62, 65, 0, 0, 3, 6, 0, 0, 0, 13);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (278, 58, 0, 0, 0, 42, 55, 0, 0, 1, 7, 0, 0, 0, 13);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (279, 59, 7, 2, 35, 26, 30, 0, 0, 1, 4, 0, 0, 1, 13);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (280, 60, 6, 3, 42, 32, 40, 0, 0, 2, 5, 0, 0, 0, 13);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (281, 61, 4, 0, 28, 12, 15, 0, 0, 0, 2, 0, 0, 0, 13);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (282, 62, 0, 0, 0, 24, 30, 0, 0, 0, 3, 0, 0, 0, 13);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (283, 63, 0, 0, 0, 28, 35, 0, 0, 1, 3, 0, 0, 0, 13);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (284, 64, 7, 2, 48, 18, 25, 0, 0, 0, 2, 0, 0, 1, 13);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (285, 65, 6, 1, 42, 14, 20, 0, 0, 0, 1, 0, 0, 0, 13);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (286, 66, 0, 0, 0, 28, 35, 0, 0, 0, 3, 0, 0, 0, 13);

-- Scorecard data for Indian players for the match (Match_id = 14)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (287, 12, 0, 0, 0, 68, 70, 0, 0, 3, 11, 0, 0, 0, 14);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (288, 13, 0, 0, 0, 42, 45, 0, 0, 1, 6, 0, 0, 0, 14);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (289, 14, 7, 3, 30, 18, 20, 0, 1, 0, 2, 0, 0, 0, 14);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (290, 15, 0, 0, 0, 56, 60, 0, 0, 4, 8, 0, 0, 0, 14);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (291, 16, 0, 0, 0, 38, 40, 0, 0, 2, 5, 0, 0, 0, 14);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (292, 17, 6, 2, 40, 24, 30, 0, 0, 1, 3, 0, 0, 0, 14);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (293, 18, 0, 0, 0, 32, 35, 0, 0, 2, 4, 0, 0, 0, 14);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (294, 19, 0, 0, 0, 46, 50, 0, 0, 1, 7, 0, 0, 0, 14);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (295, 20, 7, 3, 38, 22, 25, 0, 0, 0, 3, 0, 0, 0, 14);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (296, 21, 6, 2, 45, 28, 35, 0, 0, 2, 4, 0, 0, 1, 14);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (297, 22, 0, 0, 0, 12, 15, 0, 0, 0, 2, 0, 0, 0, 14);


-- Scorecard data for New Zealand players for the match (Match_id = 14)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (298, 56, 0, 0, 0, 74, 80, 0, 0, 5, 12, 0, 0, 0, 14);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (299, 57, 0, 0, 0, 36, 40, 0, 0, 2, 5, 0, 0, 0, 14);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (300, 58, 0, 0, 0, 48, 55, 0, 0, 3, 7, 0, 0, 0, 14);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (301, 59, 8, 4, 38, 14, 15, 0, 0, 0, 1, 0, 0, 0, 14);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (302, 60, 6, 2, 42, 28, 30, 0, 0, 1, 4, 0, 0, 0, 14);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (303, 61, 0, 0, 0, 16, 20, 0, 0, 0, 2, 0, 0, 0, 14);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (304, 62, 9, 3, 50, 18, 25, 0, 1, 1, 3, 0, 0, 0, 14);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (305, 63, 8, 2, 40, 16, 20, 0, 0, 0, 1, 0, 0, 0, 14);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (306, 64, 0, 0, 0, 32, 35, 0, 0, 2, 4, 0, 0, 0, 14);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (307, 65, 7, 3, 38, 12, 15, 0, 0, 0, 0, 0, 0, 1, 14);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (308, 66, 0, 0, 0, 18, 25, 0, 0, 1, 2, 0, 0, 0, 14);


-- Scorecard data for Indian players for the match (Match_id = 15)
-- Player 1
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (309, 12, 0, 0, 0, 45, 50, 0, 0, 3, 7, 0, 0, 0, 15);

-- Player 2
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (310, 13, 0, 0, 0, 38, 40, 0, 0, 2, 5, 0, 0, 0, 15);

-- Player 3
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (311, 14, 8, 3, 42, 12, 15, 0, 0, 0, 0, 0, 0, 0, 15);

-- Player 4
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (312, 15, 0, 0, 0, 22, 25, 0, 0, 1, 2, 0, 0, 0, 15);

-- Player 5
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (313, 16, 0, 0, 0, 29, 30, 0, 0, 2, 4, 0, 0, 0, 15);

-- Player 6
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (314, 17, 10, 4, 60, 18, 20, 0, 1, 1, 3, 0, 0, 0, 15);

-- Player 7
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (315, 18, 0, 0, 0, 34, 35, 0, 0, 2, 4, 0, 0, 0, 15);

-- Player 8
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (316, 19, 0, 0, 0, 38, 40, 0, 0, 3, 6, 0, 0, 0, 15);

-- Player 9
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (317, 20, 8, 2, 44, 16, 20, 0, 0, 0, 1, 0, 0, 0, 15);

-- Player 10
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (318, 21, 7, 3, 52, 14, 15, 0, 0, 0, 2, 0, 0, 0, 15);

-- Player 11
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (319, 22, 0, 0, 0, 18, 25, 0, 0, 1, 3, 0, 0, 0, 15);

-- Scorecard data for New Zealand players for the match (Match_id = 15)
-- Player 12
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (320, 56, 0, 0, 0, 42, 45, 0, 0, 3, 7, 0, 0, 0, 15);

-- Player 13
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (321, 57, 0, 0, 0, 38, 40, 0, 0, 2, 5, 0, 0, 0, 15);

-- Player 14
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (322, 58, 8, 3, 42, 14, 15, 0, 0, 1, 2, 0, 0, 0, 15);

-- Player 15
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (323, 59, 0, 0, 0, 28, 30, 0, 0, 1, 3, 0, 0, 0, 15);

-- Player 16
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (324, 60, 0, 0, 0, 26, 25, 0, 0, 1, 3, 0, 0, 0, 15);

-- Player 17
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (325, 61, 10, 4, 55, 18, 20, 0, 1, 2, 3, 0, 0, 0, 15);

-- Player 18
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (326, 62, 0, 0, 0, 32, 35, 0, 0, 3, 5, 0, 0, 0, 15);

-- Player 19
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (327, 63, 0, 0, 0, 26, 30, 0, 0, 1, 3, 0, 0, 0, 15);

-- Player 20
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (328, 64, 0, 0, 0, 24, 25, 0, 0, 0, 2, 0, 0, 0, 15);

-- Player 21
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (329, 65, 0, 0, 0, 28, 30, 0, 0, 0, 3, 0, 0, 0, 15);

-- Player 22
INSERT INTO Scorecard (Scorecard_id, Player_id, Overs_Bowled, Taken_Wickets, Given_Total_Runs, Total_Runs, Total_Balls_Faced, Given_Extras, Maiden_Overs_Given, Total_Sixes_Hit, Total_Fours_Hit, Demerit_Points, Penalized, Total_Catches_Taken, Match_id)
VALUES (330, 66, 0, 0, 0, 30, 35, 0, 0, 2, 4, 0, 0, 0, 15);
