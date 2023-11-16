@echo off
setlocal EnableDelayedExpansion

for /f "tokens=*" %%a in ('git remote get-url origin') do (
    set "url=%%a"
)

set "url=!url:.git=!"

set arg=%1

if not "%arg%"=="" (
    set url=%url%/%arg%
)

echo Launching %url%
start "" "!url!"
