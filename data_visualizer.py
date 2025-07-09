
import pandas as pd

# Path to the .parquet file
file_path = '/scratch/azureml/cr/j/607aa695a47b4c5981289a1b425cab84/cap/data-capability/wd/INPUT_asdf/verl/verl/data/simplelr_zoo/train.parquet'

df = pd.read_parquet(file_path)
print(df['prompt'][0])