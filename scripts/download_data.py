import shutil  # Copies files from one folder to another
from pathlib import Path  # Works with folder paths
import kagglehub  # Downloads Kaggle datasets

# Download the dataset. kagglehub returns the folder where it saved the files.
cache_path = Path(kagglehub.dataset_download("olistbr/brazilian-ecommerce"))

# The folder where we want the CSVs for this project
target = Path("data/raw")
target.mkdir(parents=True, exist_ok=True)  # Create the folder if it doesn't exist

# Copy every CSV file into the project folder
for csv_file in cache_path.glob("*.csv"):
    shutil.copy(csv_file, target / csv_file.name)
    print(f"Copied {csv_file.name}")

print("Done. Files are in data/raw")
