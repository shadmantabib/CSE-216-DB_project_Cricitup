import openpyxl
import random

# Load the existing Excel file
<<<<<<< HEAD
existing_file_name = 'cricket_data_match_18_with_integer_data.xlsx'
=======
existing_file_name = 'cricket_data_match_16_with_integer_data2.xlsx'
>>>>>>> 6a831770a3ec40cda03060ef7fe30c1c39e80cec
workbook = openpyxl.load_workbook(existing_file_name)
sheet = workbook.active

# Get the last used row number in the sheet
last_row = sheet.max_row

# Initialize scorecard_id for the new players
start_scorecard_id = 700 + last_row

# Generate sample data for 6 new batsmen (player_id from 23 to 28)
for person_id in range(23, 29):
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
    match_id = 18  # Set match ID to 16

    # Append data to the sheet
    sheet.append([
        start_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
        balls_batted, given_extra, given_maiden, sixes, fours,
        demerit_points, penalized, tot_catches_taken, match_id
    ])

    # Increment the scorecard_id
    start_scorecard_id += 1

# Generate sample data for 5 new bowlers (player_id from 29 to 33)
for person_id in range(29, 34):
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
<<<<<<< HEAD
    match_id = 18 # Set match ID to 16
=======
    match_id = 17  # Set match ID to 16
>>>>>>> 6a831770a3ec40cda03060ef7fe30c1c39e80cec

    # Append data to the sheet
    sheet.append([
        start_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
        balls_batted, given_extra, given_maiden, sixes, fours,
        demerit_points, penalized, tot_catches_taken, match_id
    ])

    # Increment the scorecard_id
    start_scorecard_id += 1

# Save the updated workbook to the existing file
workbook.save(existing_file_name)

print(f'New data appended to the existing Excel file: {existing_file_name}')
