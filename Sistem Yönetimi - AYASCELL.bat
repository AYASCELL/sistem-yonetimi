@echo off
chcp 65001 >nul
title Sistem Yönetimi - AYASCELL
color D

setlocal enabledelayedexpansion
:main
cls
echo ======================================
echo      Sistem Yönetimi - AYASCELL
echo ======================================
echo --Lütfen bir işlem seçin--
echo 0. Çıkış
echo h. Hakkında
echo.
echo.Bilgisayar İşlemleri
echo.==============================
echo 1. Bilgisayarı kapat
echo 2. Bilgisayarı yeniden başlat
echo 3. Bilgisayarı uyku moduna al
echo 4. Bilgisayarı kilitle
echo.
echo.5. Sistem İşlemleri
echo.6. Ağ İşlemleri
echo.
set /p choice="Seçiminizi girin (0-5 veya h): "

if not "!choice!"=="1"  if not "!choice!"=="2" if not "!choice!"=="3" if not  "!choice!"=="4" if not  "!choice!"=="5" if not  "!choice!"=="6" if not  "!choice!"=="h" if not  "!choice!"=="0"  (
    echo.
    echo Girdiğiniz değer -- 0-5 veya h -- değil. tekrar deneyin...
    pause
    goto main
)

if "%choice%"=="" ( 
    echo Lütfen bir sayı girin.
    pause
goto main
)

if "%choice%"=="5" (goto sistemişlevierii)
if "%choice%"=="6" (goto agistemleri)


goto brommm

rem //////////////////////////////////////////////////////////////////////////////////////AYRIK PANEL SİSTEM İŞLEMLERİ----- SİSTEM İŞLEMLERİ

:sistemişlevierii
:sismain
cls
echo.==============================
echo.      Sistem İşlemleri
echo.==============================
echo 0. Ana Sayfa
echo 1. Sistem Bilgileri
echo 2. Detaylı Sistem Bilgileri
echo 3. Disk Temizleme
echo 4. Ağ Bağlantısını Kontrol Et
echo 5. Sistem Güncellemelerini Kontrol Et
echo a. Tüm Programları ve Paketleri Güncelle
echo.
echo 6. Sistem Dosyalarını Kontrol Et ve Onar - Yönetici izni gerekir
echo 7. Windows'u Onar --DISM aracı ile--  - Yönetici izni gerekir
echo 8. Sistem Dosyalarını ve Windows'u onar  - Yönetici izni gerekir
echo 9. Windows Kurulu Disk Hatası Kontrol ve Onarım  - Yönetici izni gerekir
echo 10. Gereksiz Dosyaları Temizle
echo 11. Pil Sağlığı Raporu Oluştur
echo 12. Disk Sağlığı
echo 13. DNS Önbelleğini Sil - Yönetici izni önerilir
echo.
set /p sistemislemlerig="Seçiminizi girin (0-13): "

 if not "!sistemislemlerig!"=="1" if not "!sistemislemlerig!"=="a" if not "!sistemislemlerig!"=="2" if not "!sistemislemlerig!"=="3" if not "!sistemislemlerig!"=="4" if not "!sistemislemlerig!"=="5" if not "!sistemislemlerig!"=="6" if not "!sistemislemlerig!"=="7" if not "!sistemislemlerig!"=="8" if not "!sistemislemlerig!"=="0" if not "!sistemislemlerig!"=="9" if not "!sistemislemlerig!"=="10" if not "!sistemislemlerig!"=="11" if not "!sistemislemlerig!"=="12" if not "!sistemislemlerig!"=="13" (
    echo.
     echo Girdiğiniz değer -- 0-13 veya h -- değil. tekrar deneyin...
     pause
     goto sismain
 )


if "%sistemislemlerig%"=="a" (
    cls
echo =======================================
echo  Tüm Programları ve Paketleri Güncelle
echo =======================================
winget upgrade --all
    echo.
    echo Tüm güncellemeler tamamlandı.
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
echo        Detaylı Sistem Bilgileri
echo ======================================
    systeminfo
    echo.
    echo İşlemci Bilgileri:
    wmic cpu get name, currentclockspeed, maxclockspeed, numberofcores, numberoflogicalprocessors
    echo ----------------------
    echo Bellek Bilgileri:
    wmic memorychip get capacity, speed, manufacturer, partnumber
    echo ----------------------
    echo Disk Bilgileri:
    wmic diskdrive get model, size, serialnumber
    echo ----------------------
    echo Ağ Bilgileri:
    wmic nic get name, macaddress, speed
    echo ----------------------
    echo Grafik Kartı Bilgisi:
    wmic path win32_videocontroller get name, adapterram
    echo ----------------------
    echo İşletim Sistemi Bilgileri:
    wmic os get caption, version, buildnumber, osarchitecture
    echo ----------------------
    pause
    goto sismain
)

if "%sistemislemlerig%"=="3" (
    cls
    echo Disk Temizleme başlatılıyor...
    cleanmgr
    pause
    goto sismain
)

if "%sistemislemlerig%"=="4" (goto gooot )

if "%sistemislemlerig%"=="0" (goto main)

if "%sistemislemlerig%"=="5" (
    cls
    echo Sistem güncellemeleri kontrol ediliyor...
    start ms-settings:windowsupdate
    pause
    goto sismain
)


goto iler
rem //////////////////////////////////////////////////////////// burda başladı atlayı


rem --------------------- ağ bağlantısı
:gooot

:mainn
cls
echo ======================================
echo       Ağ Bağlantısını Kontrol Et
echo ======================================
echo Lütfen kontrol etmek istediğiniz ağı seçin:
echo 1. Google -google.com-
echo 2. Valorant -valorant.com-
echo 3. Yandex -yandex.com-
echo 4. Diğer -IP adresi girin-
echo 5. Sistem Ana Sayfa
echo 6. Ağ Ana Sayfa
set internet=1
set internet=1
set /p internet="Seçiminizi girin (1-6): "

rem Kullanıcının girdiği değeri kontrol et
if "%internet%"=="1" (
    echo Google'a ping atılıyor...
    ping google.com
) else if "%internet%"=="2" (
    echo Valorant'a ping atılıyor...
    ping 104.160.143.212
) else if "%internet%"=="3" (
    echo Yandex'e ping atılıyor...
    ping yandex.com
) else if "%internet%"=="4" ( goto kendtest
)else if "%internet%"=="5" ( goto sismain
)else if "%internet%"=="6" ( goto agmain
)else (
    echo Geçersiz seçim. Lütfen 1-4 arasında bir değer girin.
)

goto agiler
:kendtest
    set /p ip="Lütfen test etmek istediğiniz IP adresini girin: "
    echo.
    echo %ip% adresine ping atılıyor...
    ping %ip%
    echo.
:agiler
pause
goto mainn

rem ------------------------- ağ bağlantısı

rem //////////////////////////////////////////////////////////// TAŞINACAK İLK
rem ------------------------- dosya temizleme
:sutlamadosya

:mainnnn
cls
echo ======================================
echo       Gereksiz Dosyaları Temizle
echo ======================================
echo Gereksiz dosyaları sileceğiniz işlemi seçin:
echo 1. Gereksiz dosyaları sil
echo 2. Çöp Kutusunu boşalt - Yönetici izni gerekir
echo 3. Tarayıcı önbelleklerini temizle
echo 4. Sistem Ana Sayfa
set dosyag=1
set dosyag=1
set /p dosyag="Seçiminizi girin (1-4): "

rem Kullanıcının girdiği değeri kontrol et
if "%dosyag%"=="1" (
:: Geçici dosyaları sil
    echo Geçici dosyalar siliniyor...
    del /s /f /q C:\Windows\Temp\*.*
    del /s /f /q %USERPROFILE%\appdata\local\temp\*.*

) else if "%dosyag%"=="2" (
:: Çöp kutusunu boşalt
echo Çöp kutusu boşaltılıyor...
rd /s /q C:\$Recycle.Bin
) else if "%dosyag%"=="3" ( goto kendtesttt

) else if "%dosyag%"=="5" ( goto sismain
)else (
    echo Geçersiz seçim. Lütfen 1-5 arasında bir değer girin.
)

goto agilerrr
:kendtesttt
    echo Tüm tarayıcıların önbellekleri temizleniyor...
:: Google Chrome önbelleğini temizle
IF EXIST "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\" (
    echo Firefox önbelleği temizleniyor...
    del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
)

:: Microsoft Edge önbelleğini temizle
IF EXIST "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\" (
    echo Edge önbelleği temizleniyor...
    del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
)
    echo.
:agilerrr
pause
goto mainnnn

rem ------------------------- dosya temizleme

:iler
rem //////////////////////////////////////////////////////////// buraya atladı


if "%sistemislemlerig%"=="6" (
cls
@echo off
:: Yönetici izni kontrolü
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yönetici izni gerektiriyor.
    echo Lütfen dosyayı "Yönetici olarak çalıştır" seçeneği ile açın.
    pause
    goto sismain
)
    echo Sistem dosyaları kontrol ediliyor ve onarılıyor...
    sfc /scannow
    echo.
    echo İşlem tamamlandı.
    pause
    goto sismain
)

if "%sistemislemlerig%"=="" ( 
    echo Lütfen bir sayı girin.
    pause
goto sismain
)


if "%sistemislemlerig%"=="7" (
    cls
    :: Yönetici izni kontrolü
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yönetici izni gerektiriyor.
    echo Lütfen dosyayı "Yönetici olarak çalıştır" seçeneği ile açın.
    pause
    goto sismain
)
    echo DISM ile sistem görüntüsü onarılıyor...
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo İşlem tamamlandı.
    pause
    goto sismain
)



if "%sistemislemlerig%"=="8" (
    cls
        :: Yönetici izni kontrolü
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yönetici izni gerektiriyor.
    echo Lütfen dosyayı "Yönetici olarak çalıştır" seçeneği ile açın.
    pause
    goto sismain
)
    echo Sistem dosyaları kontrol ediliyor ve onarılıyor...
    sfc /scannow
    echo.
    echo SFC işlemi tamamlandı. Şimdi DISM ile sistem görüntüsünü onarıyoruz...
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo DISM işlemi tamamlandı.
    pause
    goto sismain
)



if "%sistemislemlerig%"=="9" (
cls
chcp 65001 >nul
title Disk Hatası Kontrol ve Onarım


:: Yönetici izni kontrolü
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Bu dosya yönetici izni gerektiriyor.
    echo Lütfen dosyayı "Yönetici olarak çalıştır" seçeneği ile açın.
    pause
    goto sismain
)

echo İşletim sisteminin kurulu olduğu diski buluyor...
set OSDrive=%SystemDrive%

echo Kurulu işletim sistemi diski: %OSDrive%
echo Disk hatalarını kontrol etmek ve onarmak için %OSDrive% sürücüsünü kontrol ediyor...
echo Lütfen bekleyin...

chkdsk %OSDrive% /f /r

echo.
echo İşlem tamamlandı. Herhangi bir hata bulunursa, lütfen yukarıdaki çıktıyı kontrol edin.
pause
 goto sismain
)

rem -------------------------------------------------------------------------------------------------------------------------------

if "%sistemislemlerig%"=="10" (goto sutlamadosya)

if "%sistemislemlerig%"=="11" (
    cls
rem -------------------------- PİL SAĞLIĞI
powercfg /batteryreport /output "%LOCALAPPDATA%\battery_report.html"
echo Pil raporunuz oluşturuldu...
start %LOCALAPPDATA%\battery_report.html
rem -------------------------- PİL SAĞLIĞI
pause
 goto sismain
)


if "%sistemislemlerig%"=="12" (
rem -------------------------- SSD SAĞLIĞI
cls
echo ======================================
echo             Disk Sağlığı
echo ======================================
wmic diskdrive get model,name,size,status
rem -------------------------- SSD SAĞLIĞI
pause
 goto sismain
)


if "%sistemislemlerig%"=="13" (
    ipconfig /flushdns
    echo DNS önbelleği temizlendi.
    pause
    goto sismain
)


pause
goto main

rem -------------------------------------------------------------------------------------------------------------------------------


rem ////////////////////////////////////////////////////////////////////////////////////////////////////AYRIK PANEL SİSTEM İŞLEMLERİ SON ----- SİSTEM İŞLEMLERİ








rem ////////////////////////////////////////////////////////////////////////////////////////////////////AĞ İŞLEMLERİ İLK ----- AĞ İŞLEMLERİ
cls
:agistemleri

:agmain
cls
echo.==============================
echo.      Ağ İşlemleri
echo.==============================
echo 0. Ana Sayfa
echo 1. Ağ Bağlantısını Kontrol Et
echo 2. Ağı Optimize Et
echo...............................................................
echo 3. Ağı yenile Ve Optimize Et
echo güvenlik duvarı varsayılana döner-Yönetici izni önerilir
echo...............................................................
echo 4. Tüm Ağ Ayarlarını Sıfırla 
echo güvenlik duvarı varsayılana döner-wifi şifreleri silinir-Yönetici izni önerilir
echo...............................................................
echo 5. Ağ Şifreleri Hariç Ağı Sıfırla - Yönetici izni önerilir
echo 5. DNS Önbelleğini Temizle - Yönetici izni önerilir
echo.
set /p agislemleriggg="Seçiminizi girin (0-5): "

 if not "!agislemleriggg!"=="1" if not "!agislemleriggg!"=="2"  if not "!agislemleriggg!"=="3"  if not "!agislemleriggg!"=="4"  if not "!agislemleriggg!"=="5"  if not "!agislemleriggg!"=="0"   (
    echo.
     echo Girdiğiniz değer -- 0-13 veya h -- değil. tekrar deneyin...
     pause
     goto agmain
 )

if "%agislemleriggg%"=="0" (goto main)

if "%agislemleriggg%"=="1" (goto gooot)

if "%agislemleriggg%"=="2" (
cls
echo Ağı optimize etme işlemi başlatılıyor...
timeout /t 2 >nul

:: DNS önbelleğini temizle
ipconfig /flushdns

:: Ağ bağlantılarını yenile
ipconfig /release
ipconfig /renew
echo.
echo Ağı optimize etme işlemi tamamlandı.
pause
goto agmain
)

if "%agislemleriggg%"=="3" (
cls
echo Ağı optimize etme ve yenileme işlemi başlatılıyor...
timeout /t 2 >nul

:: DNS önbelleğini temizle
ipconfig /flushdns

:: Ağ bağlantılarını yenile
ipconfig /release
ipconfig /renew

:: güvenlik duvarını varsayılana döndür
netsh advfirewall reset
echo.
echo Ağı optimize etme ve yenileme işlemi tamamlandı.
pause
goto agmain
)

if "%agislemleriggg%"=="4" (
cls
echo Ağı optimize etme ve tüm ağı sıfırlama işlemi başlatılıyor...
timeout /t 2 >nul

:: DNS önbelleğini temizle
ipconfig /flushdns

:: Ağ bağlantılarını yenile
ipconfig /release
ipconfig /renew

:: Ağ ayarlarını sıfırla
netsh int ip reset
netsh winsock reset

:: güvenlik duvarını varsayılana döndür
netsh advfirewall reset
echo.
echo Ağı optimize etme ve tüm ağı sıfırlama işlemi tamamlandı.
pause
goto agmain
)

if "%sistemislemlerig%"=="5" (
    ipconfig /flushdns
    echo DNS önbelleği temizlendi.
    pause
    goto sismain
)

pause
goto main

rem ////////////////////////////////////////////////////////////////////////////////////////////////////AĞ İŞLEMLERİ SON ----- AĞ İŞLEMLERİ




:brom

:brommm


if "%choice%"=="0" (
    cls
    echo Çıkış yapılıyor...
    timeout /t 2 >nul
    exit /b
)
rem -------------------------------------------------------dosya taşındı

if "%choice%"=="h" (
    cls
echo ======================================
echo               HAKKINDA
echo ======================================
    echo Geliştirici: AYASCELL
    echo ----------------------
    echo Açıklama:
    echo.======================================
    echo   CMD de komut yazmayı bilmeyen veya acemisi olanlara hitap eder.
    echo Bu bir bat dosyasıdır ve kullanıcının problemlerini basit bir
    echo şekilde çözmeyi amaçlar.
    echo.======================================
    echo Amaç:
    echo   Bu araç, bilgisayarınızı belirlediğiniz zamanlayıcıya göre
    echo kapatma, uyku moduna alma, kilitleme ve yeniden başlatma
    echo işlemlerini gerçekleştirmenizi sağlar.
    echo Ayrıca bilgisayarınızın bilgilerini detaylı olarak görebilir,
    echo bozuk sistem dosyalarınızı onarabilir, ağ gecikme testi
    echo yapabilir ve ağ sorunlarınızı çözebilirsiniz.
    echo.
    echo.======================================
    echo --yönetici izni gerektirir-- ve --yönetici izni önerilir-- gerektiren
    echo işlemleri kesinlikle programı yönetici izni ile başlatıp çalıştırmanız gerekmektedir.
    echo Aksi takdirde işlemler başlamayabilir veya başarısızlıkla sonuçlanabilir.
    echo.======================================
    echo.
    echo Sürüm:1.0
    echo ----------------------
    echo AYASCELL
    echo ----------------------

    pause
    goto main
)
rem -------------------------------------------------------dosya taşındı

rem -------------------------

rem ------------------------------------------------------ dosya taşında-

set /p countdown="Geri sayım süresini (saniye cinsinden) girin: "

if not "%countdown%"=="" (
    for /L %%i in (1,1,%countdown%) do (
        if %%i lss 1 (
            echo Lütfen geçerli bir sayı girin.
            exit /b
        )
    )
) else (
    echo Lütfen bir sayı girin.
    exit /b
)



set /a total=countdown
set /a barLength=50

set "action="
if "%choice%"=="1" (
    set "action=kapatılacak"
) else if "%choice%"=="2" (
    set "action=yeni başlatılacak"
) else if "%choice%"=="3" (
    set "action=uyku moduna alınacak"
) else if "%choice%"=="4" (
    set "action=kilitlenecek"
) else (
    echo Geçersiz seçim!
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

echo Bilgisayarınız !minutes! dakika !seconds! saniye sonra %action%...
echo.
echo [!bar!!emptyBar!] !progress!%%

timeout /t 1 >nul
set /a countdown-=1

if !countdown! gtr 0 (
    goto loop
)

cls
if "%choice%"=="1" (
    echo Bilgisayar kapatılıyor...
    timeout /t 2 >nul
    shutdown /s /t 0
) else if "%choice%"=="2" (
    echo Bilgisayar yeniden başlatılıyor...
    timeout /t 2 >nul
    shutdown /r /t 0
) else if "%choice%"=="3" (
    echo Bilgisayar uyku moduna alınıyor...
    timeout /t 2 >nul
    rundll32.exe powrprof.dll,SetSuspendState Sleep
) else if "%choice%"=="4" (
    echo Bilgisayar kilitleniyor...
    timeout /t 2 >nul
    rundll32.exe user32.dll,LockWorkStation
)

echo İşlem tamamlandı.
timeout /t 2 >nul
exit /b