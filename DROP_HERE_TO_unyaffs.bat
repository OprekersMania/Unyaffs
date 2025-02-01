@echo off
setlocal enabledelayedexpansion

:: Cari lokasi unyaffs.exe secara otomatis
set "unyaffs_path=%~dp0unyaffs.exe"

:: Cek apakah unyaffs.exe ada
if not exist "%unyaffs_path%" (
    echo ERROR: unyaffs.exe not found in script directory!
    pause
    exit /b
)

:: Cek apakah ada file yang di-drag & drop
if "%~1"=="" (
    echo Drag and drop a YAFFS image onto this script!
    pause
    exit /b
)

:: Loop untuk menangani banyak file yang di-drag & drop
for %%F in (%*) do (
    set "input_file=%%~F"
    set "input_folder=%%~dpF"
    set "filename=%%~nF"
    set "output_folder=!input_folder!!filename!"

    echo Extracting "!input_file!" to "!output_folder!"...

    mkdir "!output_folder!" 2>nul
    "%unyaffs_path%" "!input_file!" "!output_folder!"
    
    echo Done extracting to "!output_folder!"
)

