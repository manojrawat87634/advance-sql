import pandas as pd
import mariadb
import sys
import numpy as np

# Load CSV
df = pd.read_csv("d.csv")


df = df.replace({np.nan: None})

# Rename columns safely
df.rename(columns={
    "Date": "trade_date",
    "Symbol": "symbol",
    "Series": "series",
    "Prev Close": "prev_close",
    "Open": "open_price",
    "High": "high_price",
    "Low": "low_price",
    "Last": "last_price",
    "Close": "close_price",
    "VWAP": "vwap",
    "Volume": "volume",
    "Turnover": "turnover",
    "Trades": "trades",
    "Deliverable Volume": "deliverable_volume",
    "%Deliverble": "percent_deliverable"
}, inplace=True)

# Convert Date column to DATE (important)
df["trade_date"] = pd.to_datetime(df["trade_date"], errors="coerce").dt.date

# Convert NaN → None
df = df.where(pd.notnull(df), None)

# Convert to tuples (FAST)
data = list(df.itertuples(index=False, name=None))

# print(data[:3])

conn = mariadb.connect(
    user="root",
    password="",
    host="localhost",
    port=3306,
    database="stock_market",
    autocommit=False
)

cursor = conn.cursor()

sql = """
INSERT INTO stock_data (
    trade_date, symbol, series,
    prev_close, open_price, high_price, low_price,
    last_price, close_price, vwap,
    volume, turnover, trades,
    deliverable_volume, percent_deliverable
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
"""

cursor.executemany(sql, data)
conn.commit()

cursor.close()
conn.close()

print(f"{len(data)} rows inserted successfully")

