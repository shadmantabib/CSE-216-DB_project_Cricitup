import openpyxl
import random

# Create a new Excel workbook and add a sheet
new_file_name = 'new_cricket_data3.xlsx'
workbook = openpyxl.Workbook()
sheet = workbook.active

# Define the header row
header_row = [
    'SCORECARD_ID', 'PLAYER_ID', 'OVERS_BOWLED', 'WICKET', 'GIVEN_RUN', 'SCORED_RUN',
    'BALLS_BATTED', 'GIVEN_EXTRA', 'GIVEN_MAIDEN', 'SIXES', 'FOURS',
    'DEMERIT_POINTS', 'PENALIZED', 'TOT_CATCHES_TAKEN', 'MATCH_ID'
]

# Append the header row to the sheet
sheet.append(header_row)

# Initialize scorecard_id for the new players
start_scorecard_id = 1050

# Function to add batsman-type data
def add_batsman_data(player_ids, match_id):
    global start_scorecard_id  # Declare start_scorecard_id as a global variable
    for person_id in player_ids:
        overs_bowled = 0
        wicket = 0
        given_run = 0
        scored_run = random.randint(0, 100)
        balls_batted = random.randint(20, 60)  # Batsmen face more balls
        given_extra = 0
        given_maiden = 0
        sixes = random.randint(0, 3)  # Batsmen hit fewer sixes
        fours = random.randint(0, 6)  # Batsmen hit fewer fours
        demerit_points = 0
        penalized = 0  # Represent penalized as 0 for False and 1 for True
        tot_catches_taken = random.randint(0, 3)

        # Append data to the sheet
        sheet.append([
            start_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
            balls_batted, given_extra, given_maiden, sixes, fours,
            demerit_points, penalized, tot_catches_taken, match_id
        ])

        # Increment the scorecard_id
        start_scorecard_id += 1

# Function to add bowler-type data
def add_bowler_data(player_ids, match_id):
    global start_scorecard_id  # Declare start_scorecard_id as a global variable
    for person_id in player_ids:
        overs_bowled = random.randint(4, 10)  # Bowlers bowl fewer overs
        wicket = random.randint(0, 3)  # Bowlers take fewer wickets
        given_run = random.randint(10, 50)  # Bowlers concede more runs
        scored_run = 0  # Set scored_run to 0 for bowlers
        balls_batted = 0  # Set balls_batted to 0 for bowlers
        given_extra = random.randint(0, 5)
        given_maiden = random.randint(0, 1)
        sixes = 0  # Set sixes to 0 for bowlers
        fours = 0  # Set fours to 0 for bowlers
        demerit_points = random.randint(0, 2)  # Represent demerit_points as integers
        penalized = random.randint(0, 1)  # Represent penalized as 0 for False and 1 for True
        tot_catches_taken = random.randint(0, 2)

        # Append data to the sheet
        sheet.append([
            start_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
            balls_batted, given_extra, given_maiden, sixes, fours,
            demerit_points, penalized, tot_catches_taken, match_id
        ])

        # Increment the scorecard_id
        start_scorecard_id += 1

# Add batsman-type data for player IDs 1 to 7
add_batsman_data(range(1, 8), match_id=17)

# Add bowler-type data for player IDs 8 to 11
add_bowler_data(range(8, 12), match_id=17)

# Add batsman-type data for player IDs 23 to 28
add_batsman_data(range(23, 29), match_id=17)

# Add bowler-type data for player IDs 29 to 33
add_bowler_data(range(29, 34), match_id=17)

# Save the new workbook to a file
workbook.save(new_file_name)

print(f'New data saved to the Excel file: {new_file_name}')
