@echo off
chcp 65001 >nul
title Sistem Yonetimi - AYASCELL
color D

setlocal enabledelayedexpansion
:main
cls
echo ======================================
echo      Sistem Yonetimi - AYASCELL
echo ======================================
echo --Lutfen bir islem secin--
echo 0. cikis
echo h. Hakkinda
echo.
echo.Bilgisayar Islemleri
echo.==============================
echo 1. Bilgisayari kapat
echo 2. Bilgisayari yeniden baslat
echo 3. Bilgisayari uyku moduna al
echo 4. Bilgisayari kilitle
echo.
echo.5. Sistem Islemleri
echo.6. Ag Islemleri
echo.
set /p choice="Seciminizi girin (0-5 veya h): "

if not "!choice!"=="1"  if not "!choice!"=="2" if not "!choice!"=="3" if not  "!choice!"=="4" if not  "!choice!"=="5" if not  "!choice!"=="6" if not  "!choice!"=="h" if not  "!choice!"=="0"  (
    echo.
    echo Girdiginiz deger -- 0-5 veya h -- degil. tekrar deneyin...
    pause
    goto main
)

if "%choice%"=="" ( 
    echo Lutfen bir sayi girin.
    pause
goto main
)

if "%choice%"=="5" (goto sistemislevierii)
if "%choice%"=="6" (goto agistemleri)


goto brommm

rem ////////////////////////////////////////////////////////////

:sistemislevierii
:sismain
cls
echo.==============================
echo.      Sistem Islemleri
echo.==============================
echo 0. Ana Sayfa
echo 1. Sistem Bilgileri
echo 2. Detayli Sistem Bilgileri
echo 3. Disk Temizleme
echo 4. Ag Baglantisini Kontrol Et
echo 5. Sistem Guncellemelerini Kontrol Et
echo a. Tum Programlari ve Paketleri Guncelle
echo.
echo 6. Sistem Dosyalarini Kontrol Et ve Onar - Yonetici izni gerekir
echo 7. Windows'u Onar --DISM araci ile--  - Yonetici izni gerekir
echo 8. Sistem Dosyalarini ve Windows'u onar  - Yonetici izni gerekir
echo 9. Windows Kurulu Disk Hatasi Kontrol ve Onarim  - Yonetici izni gerekir
echo 10. Gereksiz Dosyalari Temizle
echo 11. Pil Sagligi Raporu Olustur
echo 12. Disk Sagligi
echo 13. DNS onbellegini Sil - Yonetici izni onerilir
echo.
set /p sistemislemlerig="Seciminizi girin (0-13): "

 if not "!sistemislemlerig!"=="1" if not "!sistemislemlerig!"=="a" if not "!sistemislemlerig!"=="2" if not "!sistemislemlerig!"=="3" if not "!sistemislemlerig!"=="4" if not "!sistemislemlerig!"=="5" if not "!sistemislemlerig!"=="6" if not "!sistemislemlerig!"=="7" if not "!sistemislemlerig!"=="8" if not "!sistemislemlerig!"=="0" if not "!sistemislemlerig!"=="9" if not "!sistemislemlerig!"=="10" if not "!sistemislemlerig!"=="11" if not "!sistemislemlerig!"=="12" if not "!sistemislemlerig!"=="13" (
    echo.
     echo Girdiginiz deger -- 0-13 veya h -- degil. tekrar deneyin...
     pause
     goto sismain
 )


if "%sistemislemlerig%"=="a" (
    cls
echo =======================================
echo  Tum Programlari ve Paketleri Guncelle
echo =======================================
winget upgrade --all
    echo.
    echo Tum guncellemeler tamamlandi.
    pause
    goto sismain
)


if "%sistemislemlerig%"=="1" (
    cls
echo ======================================
echo           Sistem Bilgileri
echo ======================================
    systeminfo
    echo.
    pause
    goto sismain
)

if "%sistemislemlerig%"=="2" (
    cls
echo ======================================
echo        Detayli Sistem Bilgileri
echo ======================================
    systeminfo
    echo.
    echo Islemci Bilgileri:
    wmic cpu get name, currentclockspeed, maxclockspeed, numberofcores, numberoflogicalprocessors
    echo ----------------------
    echo Bellek Bilgileri:
    wmic memorychip get capacity, speed, manufacturer, partnumber
    echo ----------------------
    echo Disk Bilgileri:
    wmic diskdrive get model, size, serialnumber
    echo ----------------------
    echo Ag Bilgileri:
    wmic nic get name, macaddress, speed
    echo ----------------------
    echo Grafik Karti Bilgisi:
    wmic path win32_videocontroller get name, adapterram
    echo ----------------------
    echo Isletim Sistemi Bilgileri:
    wmic os get caption, version, buildnumber, osarchitecture
    echo ----------------------
    pause
    goto sismain
)

if "%sistemislemlerig%"=="3" (
    cls
    echo Disk Temizleme baslatiliyor...
    cleanmgr
    pause
    goto sismain
)

if "%sistemislemlerig%"=="4" (goto gooot )

if "%sistemislemlerig%"=="0" (goto main)

if "%sistemislemlerig%"=="5" (
    cls
    echo Sistem guncellemeleri kontrol ediliyor...
    start ms-settings:windowsupdate
    pause
    goto sismain
)


goto iler


rem --------------------- ag baglantisi
:gooot

:mainn
cls
echo ======================================
echo       Ag Baglantisini Kontrol Et
echo ======================================
echo Lutfen kontrol etmek istediginiz agi secin:
echo 1. Google -google.com-
echo 2. Valorant -valorant.com-
echo 3. Yandex -yandex.com-
echo 4. Diger -IP adresi girin-
echo 5. Sistem Ana Sayfa
echo 6. Ag Ana Sayfa
set internet=1
set internet=1
set /p internet="Seciminizi girin (1-6): "

rem Kullanicinin girdigi degeri kontrol et
if "%internet%"=="1" (
    echo Google'a ping atiliyor...
    ping google.com
) else if "%internet%"=="2" (
    echo Valorant'a ping atiliyor...
    ping 104.160.143.212
) else if "%internet%"=="3" (
    echo Yandex'e ping atiliyor...
    ping yandex.com
) else if "%internet%"=="4" ( goto kendtest
)else if "%internet%"=="5" ( goto sismain
)else if "%internet%"=="6" ( goto agmain
)else (
    echo Gecersiz secim. Lutfen 1-4 arasinda bir deger girin.
)

goto agiler
:kendtest
    set /p ip="Lutfen test etmek istediginiz IP adresini girin: "
    echo.
    echo %ip% adresine ping atiliyor...
    ping %ip%
    echo.
:agiler
pause
goto mainn


rem ------------------------- dosya temizleme
:sutlamadosya

:mainnnn
cls
echo ======================================
echo       Gereksiz Dosyalari Temizle
echo ======================================
echo Gereksiz dosyalari sileceginiz islemi secin:
echo 1. Gereksiz dosyalari sil
echo 2. cop Kutusunu bosalt - Yonetici izni gerekir
echo 3. Tarayici onbelleklerini temizle
echo 4. Sistem Ana Sayfa
set dosyag=1
set dosyag=1
set /p dosyag="Seciminizi girin (1-4): "

rem Kullanicinin girdigi degeri kontrol et
if "%dosyag%"=="1" (
:: Gecici dosyalari sil
    echo Gecici dosyalar siliniyor...
    del /s /f /q C:\Windows\Temp\*.*
    del /s /f /q %USERPROFILE%\appdata\local\temp\*.*

) else if "%dosyag%"=="2" (
:: cop kutusunu bosalt
echo cop kutusu bosaltiliyor...
rd /s /q C:\$Recycle.Bin
) else if "%dosyag%"=="3" ( goto kendtesttt

) else if "%dosyag%"=="5" ( goto sismain
)else (
    echo Gecersiz secim. Lutfen 1-5 arasinda bir deger girin.
)

goto agilerrr
:kendtesttt
    echo Tum tarayicilarin onbellekleri temizleniyor...
:: Google Chrome onbellegini temizle
IF EXIST "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\" (
    echo Firefox onbellegi temizleniyor...
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
)

:: Microsoft Edge onbellegini temizle
IF EXIST "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\" (
    echo Edge onbellegi temizleniyor...
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
)
    echo.
:agilerrr
pause
goto mainnnn

rem ------------------------- dosya temizleme

:iler
rem //////////////////////////////////////////////////////////// buraya atladi


if "%sistemislemlerig%"=="6" (
cls
@echo off
:: Yonetici izni kontrolu
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yonetici izni gerektiriyor.
    echo Lutfen dosyayi "Yonetici olarak calistir" secenegi ile acin.
    pause
    goto sismain
)
    echo Sistem dosyalari kontrol ediliyor ve onariliyor...
    sfc /scannow
    echo.
    echo Islem tamamlandi.
    pause
    goto sismain
)

if "%sistemislemlerig%"=="" ( 
    echo Lutfen bir sayi girin.
    pause
goto sismain
)


if "%sistemislemlerig%"=="7" (
    cls
    :: Yonetici izni kontrolu
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yonetici izni gerektiriyor.
    echo Lutfen dosyayi "Yonetici olarak calistir" secenegi ile acin.
    pause
    goto sismain
)
    echo DISM ile sistem goruntusu onariliyor...
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo Islem tamamlandi.
    pause
    goto sismain
)



if "%sistemislemlerig%"=="8" (
    cls
        :: Yonetici izni kontrolu
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yonetici izni gerektiriyor.
    echo Lutfen dosyayi "Yonetici olarak calistir" secenegi ile acin.
    pause
    goto sismain
)
    echo Sistem dosyalari kontrol ediliyor ve onariliyor...
    sfc /scannow
    echo.
    echo SFC islemi tamamlandi. simdi DISM ile sistem goruntusunu onariyoruz...
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo DISM islemi tamamlandi.
    pause
    goto sismain
)



if "%sistemislemlerig%"=="9" (
cls
chcp 65001 >nul
title Disk Hatasi Kontrol ve Onarim


:: Yonetici izni kontrolu
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yonetici izni gerektiriyor.
    echo Lutfen dosyayi "Yonetici olarak calistir" secenegi ile acin.
    pause
    goto sismain
)

echo Isletim sisteminin kurulu oldugu diski buluyor...
set OSDrive=%SystemDrive%

echo Kurulu isletim sistemi diski: %OSDrive%
echo Disk hatalarini kontrol etmek ve onarmak icin %OSDrive% surucusunu kontrol ediyor...
echo Lutfen bekleyin...

chkdsk %OSDrive% /f /r

echo.
echo Islem tamamlandi. Herhangi bir hata bulunursa, lutfen yukaridaki ciktiyi kontrol edin.
pause
 goto sismain
)

rem -------------------------------------------------------------------------------------------------------------------------------

if "%sistemislemlerig%"=="10" (goto sutlamadosya)

if "%sistemislemlerig%"=="11" (
    cls
rem -------------------------- PIL SAgLIgI
powercfg /batteryreport /output "%LOCALAPPDATA%\battery_report.html"
echo Pil raporunuz olusturuldu...
start %LOCALAPPDATA%\battery_report.html
rem -------------------------- PIL SAgLIgI
pause
 goto sismain
)


if "%sistemislemlerig%"=="12" (
rem -------------------------- SSD SAgLIgI
cls
echo ======================================
echo             Disk Sagligi
echo ======================================
wmic diskdrive get model,name,size,status
rem -------------------------- SSD SAgLIgI
pause
 goto sismain
)


if "%sistemislemlerig%"=="13" (
    ipconfig /flushdns
    echo DNS onbellegi temizlendi.
    pause
    goto sismain
)


pause
goto main

rem -------------------------------------------------------------------------------------------------------------------------------

cls
:agistemleri

:agmain
cls
echo.==============================
echo.      Ag Islemleri
echo.==============================
echo 0. Ana Sayfa
echo 1. Ag Baglantisini Kontrol Et
echo 2. Agi Optimize Et
echo...............................................................
echo 3. Agi yenile Ve Optimize Et
echo guvenlik duvari varsayilana doner-Yonetici izni onerilir
echo...............................................................
echo 4. Tum Ag Ayarlarini Sifirla 
echo guvenlik duvari varsayilana doner-wifi sifreleri silinir-Yonetici izni onerilir
echo...............................................................
echo 5. Ag sifreleri Haric Agi Sifirla - Yonetici izni onerilir
echo 5. DNS onbellegini Temizle - Yonetici izni onerilir
echo.
set /p agislemleriggg="Seciminizi girin (0-5): "

 if not "!agislemleriggg!"=="1" if not "!agislemleriggg!"=="2"  if not "!agislemleriggg!"=="3"  if not "!agislemleriggg!"=="4"  if not "!agislemleriggg!"=="5"  if not "!agislemleriggg!"=="0"   (
    echo.
     echo Girdiginiz deger -- 0-13 veya h -- degil. tekrar deneyin...
     pause
     goto agmain
 )

if "%agislemleriggg%"=="0" (goto main)

if "%agislemleriggg%"=="1" (goto gooot)

if "%agislemleriggg%"=="2" (
cls
echo Agi optimize etme islemi baslatiliyor...
timeout /t 2 >nul

:: DNS onbellegini temizle
ipconfig /flushdns

:: Ag baglantilarini yenile
ipconfig /release
ipconfig /renew
echo.
echo Agi optimize etme islemi tamamlandi.
pause
goto agmain
)

if "%agislemleriggg%"=="3" (
cls
echo Agi optimize etme ve yenileme islemi baslatiliyor...
timeout /t 2 >nul

:: DNS onbellegini temizle
ipconfig /flushdns

:: Ag baglantilarini yenile
ipconfig /release
ipconfig /renew

:: guvenlik duvarini varsayilana dondur
netsh advfirewall reset
echo.
echo Agi optimize etme ve yenileme islemi tamamlandi.
pause
goto agmain
)

if "%agislemleriggg%"=="4" (
cls
echo Agi optimize etme ve tum agi sifirlama islemi baslatiliyor...
timeout /t 2 >nul

:: DNS onbellegini temizle
ipconfig /flushdns

:: Ag baglantilarini yenile
ipconfig /release
ipconfig /renew

:: Ag ayarlarini sifirla
netsh int ip reset
netsh winsock reset

:: guvenlik duvarini varsayilana dondur
netsh advfirewall reset
echo.
echo Agi optimize etme ve tum agi sifirlama islemi tamamlandi.
pause
goto agmain
)

if "%sistemislemlerig%"=="5" (
    ipconfig /flushdns
    echo DNS onbellegi temizlendi.
    pause
    goto sismain
)

pause
goto main




:brom

:brommm


if "%choice%"=="0" (
    cls
    echo cikis yapiliyor...
    timeout /t 2 >nul
    exit /b
)


if "%choice%"=="h" (
    cls
echo ======================================
echo               HAKKINDA
echo ======================================
    echo Gelistirici: AYASCELL
    echo ----------------------
    echo Aciklama:
    echo.======================================
    echo   CMD de komut yazmayi bilmeyen veya acemisi olanlara hitap eder.
    echo Bu bir bat dosyasidir ve kullanicinin problemlerini basit bir
    echo sekilde cozmeyi amaclar.
    echo.======================================
    echo Amac:
    echo   Bu arac, bilgisayarinizi belirlediginiz zamanlayiciya gore
    echo kapatma, uyku moduna alma, kilitleme ve yeniden baslatma
    echo islemlerini gerceklestirmenizi saglar.
    echo Ayrica bilgisayarinizin bilgilerini detayli olarak gorebilir,
    echo bozuk sistem dosyalarinizi onarabilir, ag gecikme testi
    echo yapabilir ve ag sorunlarinizi cozebilirsiniz.
    echo.
    echo.======================================
    echo --yonetici izni gerektirir-- ve --yonetici izni onerilir-- gerektiren
    echo islemleri kesinlikle programi yonetici izni ile baslatip calistirmaniz gerekmektedir.
    echo Aksi takdirde islemler baslamayabilir veya basarisizlikla sonuclanabilir.
    echo.======================================
    echo.
    echo Surum:1.0
    echo ----------------------
    echo AYASCELL
    echo ----------------------

    pause
    goto main
)


set /p countdown="Geri sayim suresini (saniye cinsinden) girin: "

if not "%countdown%"=="" (
    for /L %%i in (1,1,%countdown%) do (
        if %%i lss 1 (
            echo Lutfen gecerli bir sayi girin.
            exit /b
        )
    )
) else (
    echo Lutfen bir sayi girin.
    exit /b
)



set /a total=countdown
set /a barLength=50

set "action="
if "%choice%"=="1" (
    set "action=kapatilacak"
) else if "%choice%"=="2" (
    set "action=yeni baslatilacak"
) else if "%choice%"=="3" (
    set "action=uyku moduna alinacak"
) else if "%choice%"=="4" (
    set "action=kilitlenecek"
) else (
    echo Gecersiz secim!
    timeout /t 1 >nul
    goto main
)

:loop
cls
set /a minutes=countdown/60
set /a seconds=countdown%%60

set /a progress=100 - (countdown * 100 / total)
set /a filledLength=(progress * barLength) / 100
set /a emptyLength=barLength - filledLength
set "bar="
set "emptyBar="

for /L %%i in (1,1,!filledLength!) do set "bar=!bar!█"
for /L %%i in (1,1,!emptyLength!) do set "emptyBar=!emptyBar!░"

echo Bilgisayariniz !minutes! dakika !seconds! saniye sonra %action%...
echo.
echo [!bar!!emptyBar!] !progress!%%

timeout /t 1 >nul
set /a countdown-=1

if !countdown! gtr 0 (
    goto loop
)

cls
if "%choice%"=="1" (
    echo Bilgisayar kapatiliyor...
    timeout /t 2 >nul
    shutdown /s /t 0
) else if "%choice%"=="2" (
    echo Bilgisayar yeniden baslatiliyor...
    timeout /t 2 >nul
    shutdown /r /t 0
) else if "%choice%"=="3" (
    echo Bilgisayar uyku moduna aliniyor...
    timeout /t 2 >nul
    rundll32.exe powrprof.dll,SetSuspendState Sleep
) else if "%choice%"=="4" (
    echo Bilgisayar kilitleniyor...
    timeout /t 2 >nul
    rundll32.exe user32.dll,LockWorkStation
)

echo Islem tamamlandi.
timeout /t 2 >nul
exit /b