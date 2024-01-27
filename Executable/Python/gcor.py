import os
import subprocess
import sys

# Get the list of git branch names
branches = subprocess.check_output(["git", "branch", "--format", "%(refname:short)"]).decode().splitlines()

# Filter the branches by the optional command line argument
if len(sys.argv) > 1:
    branches = [b for b in branches if sys.argv[1].lower() in b.lower()]

# Check out the selected branch
if len(branches) == 1:
    subprocess.run(["git", "checkout", branches[0]])
else:
    # Print the branches and ask the user to select one
    print("Select a branch:")
    for i, b in enumerate(branches, start=1):
        print(f"[{i}] {b}")
    selection = int(input("Enter branch number: "))
    subprocess.run(["git", "checkout", branches[selection - 1]])
