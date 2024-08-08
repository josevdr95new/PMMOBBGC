@echo off
setlocal enabledelayedexpansion

:Inicio
cls
echo ***********************************************
echo * PokeMMO Battle Background Change BLACK (US) *
echo ***********************************************
echo Introduce la ruta del archivo ROM a parchear:
set /p romPath=
echo romPath: %romPath%

:: Comprobar si el archivo existe
if exist "%romPath%" (
    echo El archivo existe. Procediendo al menú de parches...
    goto Menu
) else (
    echo El archivo no existe. Por favor, introduce una ruta válida.
    pause
    goto Inicio
)

:Menu
cls
echo Selecciona un parche para aplicar:
echo ****************
echo 1. GalaxyBlack *
echo 2. NightBeach  *
echo 3. ParkBlack   *
echo 4. SunsetBeach *
echo ****************
echo ----------
echo 5. Autor -
echo 6. Salir -
echo ----------
set /p option=Selecciona una opción (1-5): 
echo option: %option%

:: Crear el archivo de registro
set "LOG_FILE=patch_log.txt"
echo [%date% %time%] Inicio de ejecución

:: Comprobar la opción seleccionada
if "%option%"=="1" (
    echo [%date% %time%] Aplicando parche GalaxyBlack
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\GalaxyBlackPatch.xdelta" "parched_GalaxyBlack.nds"
) else if "%option%"=="2" (
    echo [%date% %time%] Aplicando parche NightBeach
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\NightBeachBlackPatch.xdelta" "parched_NightBeach.nds"
) else if "%option%"=="3" (
    echo [%date% %time%] Aplicando parche ParkBlack
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\ParkBlackPatch.xdelta" "parched_ParkBlack.nds"
) else if "%option%"=="4" (
    echo [%date% %time%] Aplicando parche SunsetBeach
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\SunsetBeachBlackPatch.xdelta" "parched_SunsetBeach.nds"
) else if "%option%"=="5" (
    goto autor
) else if "%option%"=="6" (
    echo [%date% %time%] Saliendo...
    goto Fin
) else (
    echo [%date% %time%] Opción no válida. Por favor, selecciona una opción del 1 al 6.
)

pause
cls
goto Menu

:autor
cls
echo *********************************************
echo PokeMMO Battle Background Change BLACK (US) *
echo josevdr95                                   *
echo v1.0                                        *
echo 2024                                        *
echo *********************************************
pause
cls
goto Menu

:Fin
echo [%date% %time%] Fin de ejecución
exit