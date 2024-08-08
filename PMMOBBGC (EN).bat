@echo off
setlocal enabledelayedexpansion

:Inicio
cls
echo *****************************************************
echo * PokeMMO Battle Background Change BLACK/White (US) *
echo *****************************************************
echo Enter the path of the ROM file to patch:
set /p romPath=
echo romPath: %romPath%

:: Check if the file exists
if exist "%romPath%" (
    echo The file exists. Proceeding to patch menu...
    goto Menu
) else (
    echo The file does not exist. Please enter a valid path.
    pause
    goto Inicio
)

:Menu
cls
echo Select a patch to apply:
echo ****************
echo 1. GalaxyBlack *
echo 2. NightBeach  *
echo 3. ParkBlack   *
echo 4. SunsetBeach *
echo ****************
echo -----------
echo 5. Author -
echo 6. Exit   -
echo -----------
set /p option=Select an option (1-5): 
echo option: %option%

:: Create the log file
:: set "LOG_FILE=patch_log.txt"
echo [%date% %time%] Execution started

:: Check the selected option
if "%option%"=="1" (
    echo [%date% %time%] Applying GalaxyBlack patch
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\GalaxyBlackPatch.xdelta" "patched_GalaxyBlack.nds"
) else if "%option%"=="2" (
    echo [%date% %time%] Applying NightBeach patch
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\NightBeachBlackPatch.xdelta" "patched_NightBeach.nds"
) else if "%option%"=="3" (
    echo [%date% %time%] Applying ParkBlack patch
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\ParkBlackPatch.xdelta" "patched_ParkBlack.nds"
) else if "%option%"=="4" (
    echo [%date% %time%] Applying SunsetBeach patch
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\SunsetBeachBlackPatch.xdelta" "patched_SunsetBeach.nds"
) else if "%option%"=="5" (
    goto author
) else if "%option%"=="6" (
    echo [%date% %time%] Exiting...
    goto Fin
) else (
    echo [%date% %time%] Invalid option. Please select an option from 1 to 6.
)

pause
cls
goto Menu

:author
cls
echo ***************************************************
echo PokeMMO Battle Background Change BLACK/White (US) *
echo josevdr95                                         *
echo v1.0                                              *
echo 2024                                              *
echo ***************************************************
pause
cls
goto Menu

:Fin
echo [%date% %time%] Execution finished
exit