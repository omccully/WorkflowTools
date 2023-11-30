@echo off
rem This batch file adds all new uncommitted files and commits them
for /f "delims=" %%i in ('git ls-files --others --exclude-standard') do git add "%%i"
