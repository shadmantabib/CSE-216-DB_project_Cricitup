CREATE TABLE Person (
    personId NUMBER PRIMARY KEY,
    first_name VARCHAR2(255),
    last_name VARCHAR2(255),
    nationality VARCHAR2(100),
    date_of_birth DATE,
    Image BLOB
);
CREATE TABLE Umpire (
    personId NUMBER PRIMARY KEY,
    no_of_match_conducted NUMBER,
    FOREIGN KEY (personId) REFERENCES Person(personId)
);
CREATE TABLE Team (
    Team_id NUMBER PRIMARY KEY,
    Team_Name VARCHAR2(255),
);
CREATE TABLE Stats (
    statId NUMBER PRIMARY KEY,
);
CREATE TABLE Player (
    playerId NUMBER PRIMARY KEY,
    type VARCHAR2(50),
    Team_id NUMBER,
    statId NUMBER UNIQUE,
    FOREIGN KEY (personId) REFERENCES Person(personId),
    FOREIGN KEY (Team_id) REFERENCES Team(Team_id),
    FOREIGN KEY (statId) REFERENCES Stats(statId)
);

CREATE TABLE Bowler (
    playerId NUMBER PRIMARY KEY,
    Bowling_Style VARCHAR2(50),
    FOREIGN KEY (playerId) REFERENCES Player(playerId)
);

CREATE TABLE Batsman (
    playerId NUMBER PRIMARY KEY,
    Batting_Style VARCHAR2(50),
    FOREIGN KEY (playerId) REFERENCES Player(playerId)
);

CREATE TABLE Coach (
    personId NUMBER PRIMARY KEY,
    start_date_of_career DATE,
    Team_id NUMBER,
    FOREIGN KEY (personId) REFERENCES Person(personId),
    FOREIGN KEY (Team_id) REFERENCES Team(Team_id)
);

CREATE TABLE Player_Stats (
    statId NUMBER PRIMARY KEY,
    totalMOTM NUMBER,
    totalFairPlayAward NUMBER,
    FOREIGN KEY (statId) REFERENCES Stats(statId)
);

CREATE TABLE Team_Stats (
    statId NUMBER PRIMARY KEY,
    Team_id NUMBER,
    noOfWins NUMBER,
    noOfLosses NUMBER,
    noOfDraws NUMBER,
    matchAbandoned NUMBER,
    matchNotPlayed NUMBER,
    pointsSoFar NUMBER,
    FOREIGN KEY (Team_id) REFERENCES Team(Team_id),
    FOREIGN KEY (statId) REFERENCES Stats(statId) 
);

CREATE TABLE Fielding_Stat (
    statId NUMBER PRIMARY KEY,
    playerId NUMBER,
    Total_Catch NUMBER,
    Run_Out NUMBER,
    Team_id NUMBER,
    FOREIGN KEY(Team_id) REFERENCES Team(Team_id)
    FOREIGN KEY (statId) REFERENCES Player_Stats(statId)
    FOREIGN KEY(playerId) REFERENCES Player(playerId)

);

CREATE TABLE Batting_Stat (
    statId NUMBER PRIMARY KEY,
    playerId NUMBER 
    Hundreds NUMBER,
    Fifties NUMBER,
    Total_Run NUMBER,
    Not_Out NUMBER,
    AVG NUMBER,
    STR_Rate NUMBER,
    FOREIGN KEY (statId) REFERENCES Player_Stats(statId)
    FOREIGN KEY(playerId) REFERENCES Player(playerId)

);

CREATE TABLE Bowling_Stat (
    statId NUMBER PRIMARY KEY,
    playerId NUMBER,
    Wickets NUMBER,
    Five_Wickets NUMBER,
    No_Of_Overs NUMBER,
    Bowling_AVG NUMBER,
    Bowling_Strike_Rate NUMBER,
    No_Of_Hatricks NUMBER,
    playerId NUMBER 
    FOREIGN KEY (statId) REFERENCES Player_Stats(statId)
    FOREIGN KEY (playerId) REFERENCES Player(playerId);
);
CREATE TABLE Venue (
    Venue_id NUMBER PRIMARY KEY,
    Address VARCHAR2(255),
    City VARCHAR2(100),
    Street_No VARCHAR2(50),
    HighestScoringMatch NUMBER,
    HighestWicketMatch NUMBER,
    Demerit_Point NUMBER
);
CREATE TABLE Series (
    Series_ID NUMBER PRIMARY KEY,
    Series_Name VARCHAR2(255),
    Host VARCHAR2(255),
    Man_Of_The_Series NUMBER, 
    Winner NUMBER, 
    No_Of_Sixes NUMBER,
    No_Of_Fours NUMBER,
    No_Of_Hat_Tricks NUMBER
    FOREIGN KEY (Man_Of_The_Series) REFERENCES Player(playerId),
    FOREIGN KEY (Winner) REFERENCES Team(Team_id)
);
CREATE TABLE Team_Participates_In_Series (
    Team_ID NUMBER,
    Series_ID NUMBER,
    PRIMARY KEY (Team_ID, Series_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID),
    FOREIGN KEY (Series_ID) REFERENCES Series(Series_ID)
);
CREATE TABLE Match (
    Match_id NUMBER PRIMARY KEY,
    Man_Of_The_Match NUMBER,
    Weather VARCHAR2(50),
    Winner NUMBER,
    Team1_id NUMBER,
    Team2_id NUMBER,
    Venue_id NUMBER,
    Series_ID NUMBER,
    -- Other attributes related to matches
    FOREIGN KEY (Venue_id) REFERENCES Venue(Venue_id),
    FOREIGN KEY (Series_ID) REFERENCES Series(Series_ID),
    FOREIGN KEY (Winner) REFERENCES Team(Team_id)
);
CREATE TABLE Match_Umpire (
    Match_id NUMBER,
    Umpire_id NUMBER,
    PRIMARY KEY (Match_id, Umpire_id),
    FOREIGN KEY (Match_id) REFERENCES Match(Match_id),
    FOREIGN KEY (Umpire_id) REFERENCES Umpire(personId)
);

CREATE TABLE Plays (
    Match_id NUMBER,
    Team_id NUMBER,
    Schedule DATE,
    PRIMARY KEY (Match_id, Team_id),
    FOREIGN KEY (Match_id) REFERENCES Match(Match_id),
    FOREIGN KEY (Team_id) REFERENCES Team(Team_id)
);
CREATE TABLE Scorecard (
    Scorecard_id NUMBER PRIMARY KEY,
    PLAYER_ID NUMBER,
    Match_id NUMBER , 
    Overs_Bowled NUMBER,
    Taken_Wickets NUMBER,
    Given_Total_Runs NUMBER,
    Total_Runs NUMBER,
    Total_Balls_Faced NUMBER,
    Given_Extras NUMBER,
    Maiden_Overs_Given NUMBER,
    Total_Sixes_Hit NUMBER,
    Total_Fours_Hit NUMBER,
    Demerit_Points NUMBER,
    Penalized NUMBER,
    Total_Catches_Taken NUMBER,
    FOREIGN KEY (Match_id) REFERENCES Match(Match_id)
);




