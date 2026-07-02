import pandas as pd
from sqlalchemy import create_engine

# ---------------------------
# MySQL Connection
# ---------------------------
username = "root"
password = "admin"
host = "localhost"
port = 3306
database = "ecom"

engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}"
)

# ---------------------------
# CSV File
# ---------------------------
csv_file = r"./dataset/events.csv"

# ---------------------------
# Table Name
# ---------------------------
table_name = "events"

# ---------------------------
# Read CSV
# ---------------------------
df = pd.read_csv(csv_file)

# ---------------------------
# Upload Data
# ---------------------------
df.to_sql(
    table_name,
    con=engine,
    if_exists="append",
    index=False,
    method="multi"
)

print(f"{len(df)} rows inserted into {table_name}")