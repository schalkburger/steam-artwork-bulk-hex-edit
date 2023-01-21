@echo off
title Steam Artwork Batch HEX Edit Script
for %%f in (input\*.gif) do start /w xvi32/xvi32.exe %%f /s=xvi32/artwork-bulk-hex-edit.xsc
@REM for /D %%a in (*) do rename "%%a" "%%a1"
timeout /t 1 >NUL
if exist input\*.gif (goto COPYFILES) else (goto NOFILES)
:COPYFILES
for /f %%i in ('DIR /b input\*.gif') do (
    echo %%i
    set fn=%%i
    move input\%%i output\
)
echo.
echo Batch editing completed.
goto:eof

:NOFILES
echo There are no files to process.
pause