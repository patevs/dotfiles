@ECHO OFF

:: --------------------------------- ::
:: scripts/examples/cmd/powercfg.cmd ::
:: --------------------------------- ::

ECHO. & ECHO Script to generate a Battery Report using powercrg utility & ECHO.

:: powercfg /?
::  /ENERGY            Analyzes the system for common energy-efficiency and
::                     battery life problems.
::  /BATTERYREPORT     Generates a report of battery usage.
::  /SLEEPSTUDY        Generates a diagnostic system power transition report.
::  /SRUMUTIL          Dumps Energy Estimation data from System Resource Usage
::                     Monitor (SRUM).
::  /SYSTEMSLEEPDIAGNOSTICS
::                     Generates a diagnostic report of system sleep transitions.
::  /SYSTEMPOWERREPORT Generates a diagnostic system power transition report.

CALL powercfg /BATTERYREPORT

GOTO :EOF

:: EOF ::
