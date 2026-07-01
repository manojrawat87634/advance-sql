import mariadb

conn = mariadb.connect(
    user="root",
    password="",
    host="localhost",
    port=3306,
    database="institute",
)
cursor = conn.cursor()

sql = "INSERT INTO student ( email, age) VALUES ( ?, ?)"
total_rows = 10000000
batch_size = 100000
# user1@example.com
try:
    for start in range(0, total_rows, batch_size):
        batch_data = [( f"user{i}@example.com", 18 + (i % 53))
                      for i in range(start, start + batch_size)]
        cursor.executemany(sql, batch_data)
        conn.commit()
        print(f"inserted {start}")
except mariadb.Error as e:
    print("Error:", e)
    conn.rollback()
finally:
    cursor.close()
    conn.close()

print("Insertion completed successfully!")