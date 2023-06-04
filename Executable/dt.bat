@echo off

if [%1]==[] goto BLANK

dotnet test --filter FullyQualifiedName~%1

GOTO DONE

:BLANK
dotnet test

:DONE
