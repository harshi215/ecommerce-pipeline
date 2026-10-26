from pathlib import Path  # Lets us work with file paths
import pandas as pd  # pandas reads tables

RAW_DIR = Path("data/raw")  # The folder with the raw CSVs

# Go through every CSV file in alphabetical order
for csv_file in sorted(RAW_DIR.glob("*.csv")):
    df = pd.read_csv(csv_file)  # Read the file into a table
    rows, cols = df.shape  # Count the rows and columns
    print(f"{csv_file.name}: {rows} rows, {cols} columns")
