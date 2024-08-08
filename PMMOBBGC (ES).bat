@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
:: Cambiar el tamaño de la consola (ancho=70, alto=15)
mode con: cols=70 lines=15
:: Establecer color (por ejemplo, fondo cian claro con texto negro)
color 1F
title Cambio de Fondo de Batalla PokeMMO NEGRO/Blanco (US)

:Inicio
cls
echo ********************************************************
echo * Cambio de Fondo de Batalla PokeMMO NEGRO/Blanco (US) *
echo ********************************************************
echo Introduce la ruta del archivo ROM a parchear:
set /p romPath=
echo rutaRom: %romPath%

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
echo -----------
echo 5. Autor  -
echo 6. Salir  -
echo -----------
set /p option=Selecciona una opción (1-6): 
echo opción: %option%

:: Crear el archivo de registro
:: set "LOG_FILE=patch_log.txt"
echo [%date% %time%] Ejecución iniciada

:: Comprobar la opción seleccionada
if "%option%"=="1" (
    echo [%date% %time%] Aplicando parche GalaxyBlack
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\GalaxyBlackPatch.xdelta" "patched_GalaxyBlack.nds"
) else if "%option%"=="2" (
    echo [%date% %time%] Aplicando parche NightBeach
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\NightBeachBlackPatch.xdelta" "patched_NightBeach.nds"
) else if "%option%"=="3" (
    echo [%date% %time%] Aplicando parche ParkBlack
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\ParkBlackPatch.xdelta" "patched_ParkBlack.nds"
) else if "%option%"=="4" (
    echo [%date% %time%] Aplicando parche SunsetBeach
    "Xdelta\xdelta.exe" -d -s "%romPath%" "BG.Patch\SunsetBeachBlackPatch.xdelta" "patched_SunsetBeach.nds"
) else if "%option%"=="5" (
    goto autor
) else if "%option%"=="6" (
    echo [%date% %time%] Saliendo...
    goto Fin
) else (
    echo [%date% %time%] Opción inválida. Por favor, selecciona una opción del 1 al 6.
)

pause
cls
goto Menu

:autor
cls
echo ***************************************************
echo *** Cambiador de Fondo de Batalla PokeMMO v1.1 ***
echo *** Autor: josevdr95 ***
echo *** Año: 2024 ***
echo ***************************************************
pause
cls
goto Menu

:Fin
echo [%date% %time%] Ejecución finalizada
exit