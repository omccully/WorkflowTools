@echo off

set "file=%temp%\WorkflowTools\cdr-path.txt"

py %~dp0\Python\cdr.py %file% %1

if not exist "%file%" (
    echo The file "%file%" does not exist. Exiting.
    exit /b
)

for /f "usebackq delims=" %%I in ("%file%") do (
    if exist "%%I" (
        cd /d "%%I"
        exit /b
    ) else (
        echo The directory "%%I" does not exist. Exiting.
        exit /b
    )
)
