@echo off

if "%1"=="" (
    for /f "tokens=1,2,3" %%i in ('git remote show origin') do (
        if "%%i"=="HEAD" (
            git pull origin %%k
        )
    )
) else (
    git pull origin %1
)
