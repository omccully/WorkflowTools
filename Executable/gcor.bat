@echo off
py %~dp0\Python\gcor.py %*


@REM setlocal EnableDelayedExpansion

@REM if "%1"=="" (
@REM    set i=0
@REM     for /f "tokens=* delims=" %%a in ('git branch --format "%%(refname:short)"') do (
@REM         set /a i+=1
@REM         set branch[!i!]=%%a
@REM     )
@REM ) else (
@REM     set i=0
@REM     for /f "tokens=* delims=" %%a in ('git branch --format "%%(refname:short)" ^| find /i "%1"') do (
@REM         set /a i+=1
@REM         set branch[!i!]=%%a
@REM     )
@REM )

@REM if %i%==1 (
@REM     git checkout !branch[1]!
@REM ) else (
@REM     echo Select a branch:
@REM     for /l %%i in (1,1,%i%) do (
@REM         echo [%%i] !branch[%%i]!
@REM     )

@REM     set /p selection="Enter branch number: "

@REM     git checkout !branch[!selection!]!
@REM )