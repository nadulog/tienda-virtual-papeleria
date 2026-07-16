@echo off
title BloomDate - Servidor local
cd /d "%~dp0"
echo.
echo Iniciando la tienda BloomDate...
echo.
echo Cuando aparezca la direccion, abri http://localhost:5173
echo No cierres esta ventana mientras uses la tienda.
echo.
npm.cmd run dev -- --host 0.0.0.0
echo.
echo El servidor se detuvo. Presiona una tecla para cerrar.
pause >nul
