import re
import webbrowser
import sys
import subprocess

url = subprocess.check_output(["git", "remote", "get-url", "origin"]).decode("utf-8").strip()

url = re.sub(r'^ssh:\/\/git@ssh\.(sshhub|github)\.com(:[\d]+)\/', 'https://github.com/', url)

if url.endswith(".git"):
    url = url[:-4]

if len(sys.argv) == 2:
    url += "/" + sys.argv[1]

print('Opening ' + url)

webbrowser.open(url)
