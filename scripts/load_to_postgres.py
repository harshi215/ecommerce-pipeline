from urllib.parse import quote_plus  # Makes special characters safe in a URL
import os  # Reads environment settings
from pathlib import Path  # Works with folder paths
import pandas as pd  # Reads CSV files into tables
from dotenv import load_dotenv  # Reads the .env file
from sqlalchemy import create_engine  # Connects pandas to PostgreSQL

load_dotenv()  # Load the database settings from .env

# Build the connection address from the .env values
# quote_plus converts special characters such as @ into safe codes
password = quote_plus(os.getenv("PG_PASSWORD"))

url = (
    f"postgresql+psycopg2://{os.getenv('PG_USER')}:{password}"
    f"@{os.getenv('PG_HOST')}:{os.getenv('PG_PORT')}/{os.getenv('PG_DB')}"
)
engine = create_engine(url)  # The connection that pandas will use

RAW_DIR = Path("data/raw")  # The folder with the CSV files

for csv_file in sorted(RAW_DIR.glob("*.csv")):
    # Turn the file name into a table name, for example
    # olist_orders_dataset.csv -> orders
    table_name = csv_file.stem.replace("olist_", "").replace("_dataset", "")

    df = pd.read_csv(csv_file)  # Read the whole CSV into a table

    # Write the table to PostgreSQL. "replace" means rerunning the script
    # rebuilds the tables instead of adding duplicate rows.
    df.to_sql(
        table_name,
        engine,
        if_exists="replace",
        index=False,  # Don't write pandas' row numbers
        chunksize=10000,  # Send rows in batches
        method="multi",  # Insert several rows per statement
    )
    print(f"Loaded {table_name}: {len(df)} rows")

print("Done.")
