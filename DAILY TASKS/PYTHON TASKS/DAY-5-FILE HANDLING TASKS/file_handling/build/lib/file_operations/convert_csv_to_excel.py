import pandas as pd

def csv_to_excel(csv_file, excel_file):
    df = pd.read_csv(csv_file)
    df.to_excel(excel_file, index=False)
