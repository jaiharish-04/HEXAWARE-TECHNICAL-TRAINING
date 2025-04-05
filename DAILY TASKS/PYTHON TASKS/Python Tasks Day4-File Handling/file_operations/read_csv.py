import csv

def read_csv_file(filename):
    with open(filename, newline='', encoding='utf-8') as file:
        reader = csv.reader(file)
        return [row for row in reader]
