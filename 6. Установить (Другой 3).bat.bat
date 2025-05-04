@echo off
chcp 65001 >nul
:: 65001 - UTF-8

cd /d %~dp0

set BIN=%~dp0bin\
set TOOLS=%~dp0tools\

if not exist "%BIN%hostlist.txt" (
    echo Файл hostlist.txt не найден в папке bin.
    pause
    exit /b
)

if not exist "%BIN%quic_initial_www_google_com.bin" (
    echo Файл quic_initial_www_google_com.bin не найден в папке bin.
    pause
    exit /b
)

if not exist "%BIN%tls_clienthello_www_google_com.bin" (
    echo Файл tls_clienthello_www_google_com.bin не найден в папке bin.
    pause
    exit /b
)

if not exist "%TOOLS%winws.exe" (
    echo Файл winws.exe не найден в папке tools.
    pause
	exit /b
)

if not exist "%BIN%hostlist.txt" (
    echo Файл list-general.txt не найден в папке bin.
	pause
    exit /b
)

if not exist "%BIN%ipset-cloudflare.txt" (
    echo Файл ipset-cloudflare.txt не найден в папке bin.
	pause
    exit /b
)

sc create XeerediDPI binPath= "\"%CD%\tools\winws.exe\" --wf-tcp=80,443 --wf-udp=443,50000-50100 --filter-udp=443 --hostlist=\"%CD%\bin\hostlist.txt\" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=\"%CD%\bin\quic_initial_www_google_com.bin\" --new --filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new --filter-tcp=80 --hostlist=\"%CD%\bin\hostlist.txt\" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist=\"%CD%\bin\hostlist.txt\" --dpi-desync=split --dpi-desync-split-pos=1 --dpi-desync-autottl --dpi-desync-fooling=badseq --dpi-desync-repeats=8 --new --filter-udp=443 --ipset=\"%CD%\bin\ipset-cloudflare.txt\" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=\"%CD%\bin\quic_initial_www_google_com.bin\" --new --filter-tcp=80 --ipset=\"%CD%\bin\ipset-cloudflare.txt\" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --ipset=\"%CD%\bin\ipset-cloudflare.txt\" --dpi-desync=split --dpi-desync-split-pos=1 --dpi-desync-autottl --dpi-desync-fooling=badseq --dpi-desync-repeats=8" start= auto displayname= "XeerediDPI"

sc description XeerediDPI "XeerediDPI by Grafingl"

sc start "XeerediDPI"

endlocal
pause