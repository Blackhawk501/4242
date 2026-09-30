@echo off
setlocal EnableDelayedExpansion
mode con cols=120 lines=35
color 1F
title Windows Update Simulation

for /f "tokens=2 delims==" %%A in ('wmic os get caption /value 2^>nul') do set "OS=%%A"

:loop
cls
echo.
echo.
echo              Windows Update
echo.
echo              Installing updates...
echo.
echo              Progress: !PERCENT!%%
echo.
echo              Please do not turn off your computer.
echo.

set /a PERCENT+=1
if !PERCENT! LEQ 100 (
    timeout /t 1 /nobreak >nul
    goto loop
)

cls
echo.
echo.
echo              Update completed successfully.
echo.
timeout /t 3 /nobreak >nul
exit
