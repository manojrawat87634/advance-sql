import mariadb
import random
from datetime import datetime, timedelta

# Connect to the MariaDB database
connection = mariadb.connect(
    host="localhost",          # Change to your database host
    user="root",               # Change to your database user
    password="",       # Change to your database password
    database="test"          # Change to your database name
)

cursor = connection.cursor()

# Define the statuses
statuses = ['Present', 'Absent', 'Late']

# Get the list of students
cursor.execute("SELECT id FROM students")
students = cursor.fetchall()

# Generate attendance for every day of the year 2026
start_date = datetime(2025, 1, 1)
end_date = datetime(2025, 12, 31)

# Iterate through each student and generate attendance records for every day in 2026
attendance_records = []
for student in students:
    student_id = student[0]
    
    current_date = start_date
    while current_date <= end_date:
        # Randomly choose an attendance status
        status = random.choice(statuses)
        # Append the record in the format (student_id, attendance_date, status)
        attendance_records.append((student_id, current_date.strftime('%Y-%m-%d'), status))
        
        # Move to the next day
        current_date += timedelta(days=1)

# Insert attendance records in batches
insert_query = """
INSERT INTO attendance (student_id, attendance_date, status)
VALUES (%s, %s, %s)
"""
cursor.executemany(insert_query, attendance_records)

# Commit the transaction
connection.commit()

print(f"{len(attendance_records)} attendance records inserted.")

# Close the cursor and connection
cursor.close()
connection.close()
