import pandas as pd
import mysql.connector
from i import student

s = student()
s.showinfo()

# -----------------------------
# MySQL Connection
# -----------------------------
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="admin",
    database="stock_market"
)

cursor = conn.cursor()

# -----------------------------
# Read CSV
# -----------------------------
df = pd.read_csv("stock_data.csv")

# Replace NaN with None (important for SQL NULL)
df = df.where(pd.notnull(df), None)

# -----------------------------
# Insert Query
# -----------------------------
query = """
INSERT INTO stock_data (
    trade_date,
    symbol,
    series,
    prev_close,
    open_price,
    high_price,
    low_price,
    last_price,
    close_price,
    vwap,
    volume,
    turnover,
    trades,
    deliverable_volume,
    deliverable_percent
)
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
"""

# -----------------------------
# Insert Each R'ow
# -----------------------------
for _, row in df.iterrows():
    values = (
    row["Date"],
    row["Symbol"],
    row["Series"],
    row["Prev Close"],
    row["Open"],
    row["High"],
    row["Low"],
    row["Last"],
    row["Close"],
    row["VWAP"],
    None if pd.isna(row["Volume"]) else int(row["Volume"]),
    None if pd.isna(row["Turnover"]) else float(row["Turnover"]),
    None if pd.isna(row["Trades"]) else int(row["Trades"]),
    None if pd.isna(row["Deliverable Volume"]) else int(row["Deliverable Volume"]),
    None if pd.isna(row["%Deliverble"]) else float(row["%Deliverble"])
    )

    cursor.execute(query, values)

conn.commit()

print(f"{cursor.rowcount} rows inserted.")

cursor.close()
conn.close()