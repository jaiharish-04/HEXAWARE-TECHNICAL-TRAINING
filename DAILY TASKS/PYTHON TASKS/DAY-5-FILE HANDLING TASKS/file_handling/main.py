from file_operations.read_txt import read_text_file
from file_operations.read_csv import read_csv_file
from file_operations.read_excel import read_excel_file
from file_operations.convert_json import json_to_text
from file_operations.convert_csv_to_excel import csv_to_excel

# Reading files
print(read_text_file('data/sample.txt'))
print(read_csv_file('data/sample.csv'))
print(read_excel_file('data/sample.xlsx'))

# Converting files
json_to_text('data/sample.json', 'data/output.txt')
csv_to_excel('data/sample.csv', 'data/output.xlsx')
