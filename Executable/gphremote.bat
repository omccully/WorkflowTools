@echo off
for /f "delims=" %%i in ('git rev-parse --abbrev-ref HEAD') do set "branchName=%%i"

git push --set-upstream origin %branchName%
