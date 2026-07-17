# import mysql.connector

# # -----------------------------
# # MySQL Connection
# # -----------------------------
# conn = mysql.connector.connect(
#     host="localhost",
#     user="root",
#     password="admin",
#     database="temp"
# )
# cursor = conn.cursor()
# # 1@gmai.com
# # Change 'symbol' to whichever column in 'stock_data' stores the email
# query = "INSERT INTO users (email, password) VALUES (%s)"

# TOTAL_ROWS = 10000000
# BATCH_SIZE = 100000  # Insert 100k rows at a time
# batch = []

# print("Starting bulk email generation and insertion...")

# for i in range(1, TOTAL_ROWS + 1):
#     # Generate the email string and append as a tuple
#     batch.append((f"{i}@gmail.com","password"))
    
#     # When batch is full, execute and clear memory
#     if i % BATCH_SIZE == 0:
#         cursor.executemany(query, batch)
#         conn.commit()
#         print(f"Successfully inserted {i} rows...")
#         batch = [] # Reset the batch list to free up RAM

# # Insert any remaining rows if TOTAL_ROWS wasn't perfectly divisible by BATCH_SIZE
# if batch:
#     cursor.executemany(query, batch)
#     conn.commit()

# print("\nFinished inserting 1 Crore emails successfully!")

# cursor.close()
# conn.close()



# try:
#     print(adfsd)
# except Exception as e:
#     print('error')

