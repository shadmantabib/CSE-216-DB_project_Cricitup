# Define the filename for the SQL update file
sql_update_file = "update_VENUE_image_urls.sql"

# Open the file in write mode
with open(sql_update_file, "w") as file:
    # Loop through VENUE_ID values from 1 to 9
    for venue_id in range(1, 10):
        # Calculate the corresponding IMAGEURL value
        image_url = 500 + venue_id  # Starting from 500.jpg and incrementing by 1

        # Generate the SQL update statement
        sql_statement = f"UPDATE venue\nSET IMAGEURL = '{image_url}.jpg'\nWHERE VENUE_ID = {venue_id};\n"

        # Write the SQL statement to the file
        file.write(sql_statement)

print(f"SQL update statements have been written to '{sql_update_file}'.")