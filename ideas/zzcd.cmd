@echo off
if '%*'=='' cd & exit /b
if '%*'=='-' (
    cd /d %OLDPWD%
    set OLDPWD=%cd%
) else (
    cd /d %*
    if not errorlevel 1 set OLDPWD=%cd%
)

doskey cd=zzcd $*
