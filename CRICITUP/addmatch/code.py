import openpyxl
import random
import shutil

# Create a new Excel workbook
workbook = openpyxl.Workbook()

# Select the active sheet (default is the first sheet)
sheet = workbook.active

# Define the starting scorecard_id
start_scorecard_id = 700

# Define the column headings
headings = [
    'scorecard_id', 'person_id', 'overs_bowled', 'wicket', 'given_run', 'scored_run',
    'balls_batted', 'given_extra', 'given_maiden', 'sixes', 'fours',
    'demerit_points', 'penalized', 'tot_catches_taken', 'match_id'
]

# Write headings to the first row
for col_num, heading in enumerate(headings, 1):
    sheet.cell(row=1, column=col_num, value=heading)

# Initialize scorecard_id
current_scorecard_id = start_scorecard_id

# Generate sample data for 6 batsmen (player_id from 1 to 6)
for person_id in range(1, 7):
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
    match_id = 18# Set match ID to 16

    # Write data to the sheet
    sheet.append([
        current_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
        balls_batted, given_extra, given_maiden, sixes, fours,
        demerit_points, penalized, tot_catches_taken, match_id
    ])

    # Increment the scorecard_id
    current_scorecard_id += 1

# Generate sample data for 5 bowlers (player_id from 7 to 11)
for person_id in range(7, 12):
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
    match_id = 17 # Set match ID to 16

    # Write data to the sheet
    sheet.append([
        current_scorecard_id, person_id, overs_bowled, wicket, given_run, scored_run,
        balls_batted, given_extra, given_maiden, sixes, fours,
        demerit_points, penalized, tot_catches_taken, match_id
    ])

    # Increment the scorecard_id
    current_scorecard_id += 1

# Save the workbook to a file
file_name = 'cricket_data_match_18_with_integer_data.xlsx'
workbook.save(file_name)

print(f'Excel file created and populated with integer data: {file_name}')

# Specify the new file path in your working directory
new_file_path = './copy_of_cricket_data_match_18_with_integer_data.xlsx'

# Use shutil to make a copy of the file
shutil.copy(file_name, new_file_path)

print(f'File copied to: {new_file_path}')
