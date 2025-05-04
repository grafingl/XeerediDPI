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

sc create XeerediDPI binPath= "\"%CD%\tools\winws.exe\" --wf-tcp=80,443,2099,5222,5223,8393-8400,7844 --wf-udp=443,5000-5500,7844,50000-50100 --filter-udp=443 --ipset-exclude=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=fake --dpi-desync-repeats=3 --dpi-desync-fooling=badseq --dpi-desync-fakedsplit-pattern=0xDEADBEEF --dpi-desync-fake-quic=\"%CD%\bin\qquic_initial_www_google_com.bin\" --new --filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake,tamper --dpi-desync-fake-stun=\"%CD%\bin\stun.bin\" --dpi-desync-repeats=2 --new --filter-udp=443 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=fake,tamper --dpi-desync-repeats=6 --dpi-desync-any-protocol=1 --dpi-desync-fake-quic=\"%CD%\bin\qquic_initial_www_google_com.bin\" --new --filter-tcp=443 --ipset-exclude=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --dpi-desync-autottl=2 --dpi-desync-fooling=badseq --dpi-desync-repeats=6 --dpi-desync-fakedsplit-pattern=0xDEADBEEF --dpi-desync-fake-tls=\"%CD%\bin\ttls_clienthello_www_google_com.bin\" --new --filter-tcp=80 --dpi-desync=syndata,fake,multisplit --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=\"%CD%\bin\ttls_clienthello_www_google_com.bin\" --new --filter-udp=5000-5500 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata --new --filter-tcp=2099 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --dpi-desync-fakedsplit-pattern=0xDEADBEEF --dpi-desync-fooling=badseq --new --filter-tcp=5222 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata --new --filter-tcp=5223 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata,fake,fakeddisorder --dpi-desync-split-pos=1,sniext+1,host+1,midsld-2,midsld,midsld+2,endhost-1 --dpi-desync-fakedsplit-pattern=0xDEADBEEF --dpi-desync-fooling=badseq --new --filter-tcp=8393-8400 --ipset=\"%CD%\bin\ex-cloud.txt\" --dpi-desync=syndata --filter-tcp=7844 --dpi-desync=syndata,multisplit --dpi-desync-split-pos=5 --dpi-desync-fooling=md5sig --new --filter-udp=7844 --dpi-desync=fake,tamper --dpi-desync-any-protocol=1 --new" start= auto displayname= "XeerediDPI"

sc description XeerediDPI "XeerediDPI by Grafingl"

sc start "XeerediDPI"

endlocal
pause