import os

file_type = ".sql"
base_path = r"C:\Users\Ryzen\PycharmProjects\\"
project_name = input(r"Select project name: ") + "\\"
folder_name = input(r"Select folder name: ")

base_path += project_name + folder_name

replace_symbols = [" ", ","]
new_symbol = "_"

print("Please select the folder where the file should be created.")

file_name = input(f"Enter the name for the SQL file (without extension): ")

reformat_name = ""
while file_name:

    for i in file_name:
        if i in replace_symbols:
            i = new_symbol
        if i != ".":
            reformat_name += i

    file_name_with_extension = f"{reformat_name}" + file_type
    reformat_name = ""

    os.makedirs(base_path, exist_ok=True)
    full_file_path = os.path.join(base_path, file_name_with_extension)

    with open(full_file_path, 'w') as file:
        file.write("")

    print(f"File '{file_name_with_extension}' created successfully.")
    file_name = input("Enter the name for the SQL file (without extension): ")
