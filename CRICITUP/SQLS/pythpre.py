# Define the filename for the SQL update file
sql_update_file = "update_VENUE_image_urls.sql"

# Open the file in write mode
with open(sql_update_file, "w") as file:
    # Loop through PERSONID values from 2 to 118
    for person_id in range(1, 9):
        # Generate the SQL update statement
        sql_statement = f"UPDATE venue\nSET IMAGEURL = '{person_id}.JPG'\nWHERE VENUE_ID = {person_id};\n"

        # Write the SQL statement to the file
        file.write(sql_statement)

print(f"SQL update statements have been written to '{sql_update_file}'.")
