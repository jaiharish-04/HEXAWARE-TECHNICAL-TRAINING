import json


def json_to_text(json_file, text_file):
    with open(json_file, 'r') as file:
        data = json.load(file)

    with open(text_file, 'w') as file:
        file.write(json.dumps(data, indent=4))
