import os  # Reads environment settings
import psycopg2  # Connects Python to PostgreSQL
from dotenv import load_dotenv  # Reads the .env file

load_dotenv()  # Loads the values from .env

conn = psycopg2.connect(  # Opens the connection
    host=os.getenv("PG_HOST"),
    port=os.getenv("PG_PORT"),
    dbname=os.getenv("PG_DB"),
    user=os.getenv("PG_USER"),
    password=os.getenv("PG_PASSWORD"),
)

cur = conn.cursor()  # A cursor runs SQL commands
cur.execute("SELECT version();")  # Ask PostgreSQL for its version
print(cur.fetchone()[0])  # Print the answer

cur.close()
conn.close()
