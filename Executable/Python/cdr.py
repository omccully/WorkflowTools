import os
import sys
import pyperclip

def list_folders(path, filter_text=None):
    folders = []
    for item in os.listdir(path):
        if os.path.isdir(os.path.join(path, item)):
             if filter_text is None or filter_text.lower() in item.lower():
                folders.append(item)
    return folders

def write_to_file(file_path, file_contents):
    # Create directory if it doesn't exist
    directory = os.path.dirname(file_path)
    os.makedirs(directory, exist_ok=True)

    # Write contents to the file
    with open(file_path, 'w') as file:
        file.write(file_contents)

def change_directory(temp_file_path, new_working_dir):
    write_to_file(temp_file_path, new_working_dir);
    print("Selected path: " + new_working_dir);

def main(temp_file_path, filter_text):
    username = os.getlogin()
    repo_path = f"C:\\Users\\{username}\\Source\\Repos"

    folders = list_folders(repo_path, filter_text)

    if len(folders) == 1:
        selected_folder = folders[0]
        selected_path = os.path.join(repo_path, selected_folder)
        change_directory(temp_file_path, selected_path)
    else:
        print("Folders in the Visual Studio default repository:")
        for index, folder in enumerate(folders):
            print(f"{index + 1}. {folder}")

        while True:
            try:
                selection = int(input("Enter the folder number to change the working directory to (0 to exit): "))
                if selection == 0:
                    break
                if selection > 0 and selection <= len(folders):
                    selected_folder = folders[selection - 1]
                    selected_path = os.path.join(repo_path, selected_folder)
                    change_directory(temp_file_path, selected_path)
                    break
                else:
                    print("Invalid selection. Please try again.")
            except ValueError:
                print("Invalid input. Please enter a number.")

if __name__ == "__main__":
    temp_file_path = sys.argv[1]
    if len(sys.argv) > 2:
        filter_text = sys.argv[2]
    else:
        filter_text = None
    main(temp_file_path, filter_text)
