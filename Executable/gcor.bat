@echo off
setlocal EnableDelayedExpansion


if "%1"=="" (
   set i=0
    for /f "tokens=* delims=" %%a in ('git branch --format "%%(refname:short)"') do (
        set /a i+=1
        set branch[!i!]=%%a
    )
) else (
    set i=0
    for /f "tokens=* delims=" %%a in ('git branch --format "%%(refname:short)" ^| find /i "%1"') do (
        set /a i+=1
        set branch[!i!]=%%a
    )
)

if %i%==1 (
    git checkout !branch[1]!
) else (
    echo Select a branch:
    for /l %%i in (1,1,%i%) do (
        echo [%%i] !branch[%%i]!
    )

    set /p selection="Enter branch number: "

    git checkout !branch[%selection%]!
)