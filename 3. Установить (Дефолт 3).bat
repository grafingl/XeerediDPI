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

sc create "XeerediDPI" binPath= "%TOOLS%winws.exe --wf-tcp=80,443,2099,5222,5223,8393-8400 --wf-udp=443,50000-50100 --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=3 --dpi-desync-fooling=badseq --new --filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=2 --new --filter-tcp=80 --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --dpi-desync=split --dpi-desync-split-pos=10 --dpi-desync-autottl --dpi-desync-fooling=badseq --dpi-desync-repeats=4 --new --filter-tcp=2099 --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1 --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-autottl=1:3-20 --dpi-desync-any-protocol=1 --dpi-desync-fooling=badseq,md5sig --new --filter-tcp=5222 --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1 --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-autottl=1:3-20 --dpi-desync-any-protocol=1 --dpi-desync-fooling=badseq,md5sig --new --filter-tcp=5223 --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1 --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-autottl=1:3-20 --dpi-desync-any-protocol=1 --dpi-desync-fooling=badseq,md5sig --new --filter-tcp=8393-8400 --dpi-desync=syndata,fake,fakedsplit --dpi-desync-split-pos=1 --dpi-desync-fakedsplit-pattern=0x00 --dpi-desync-autottl=1:3-20 --dpi-desync-any-protocol=1 --dpi-desync-fooling=badseq,md5sig" start= auto

sc description "XeerediDPI" "XeerediDPI by Grafingl"

sc start "XeerediDPI"

endlocal
pause