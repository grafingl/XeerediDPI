@echo off
chcp 65001 >nul
:: 65001 - UTF-8


set SRVCNAME=XeerediDPI

net stop %SRVCNAME%
sc delete %SRVCNAME%

net stop "WinDivert"
sc delete "WinDivert"
net stop "WinDivert14"
sc delete "WinDivert14"

echo Служба XeerediDPI удалена. Процесс WinDivert остановлен.
pause
