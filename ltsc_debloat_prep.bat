@echo off
:: ============================================================================
:: DỰ ÁN: LTSC PREPARATION & EDGE/TELEMETRY KILLER SCRIPT
:: MỤC TIÊU: Đổi Registry nâng cấp LTSC giữ nguyên Data + Tắt dịch vụ ngầm Edge
:: CẦN QUYỀN: Run as Administrator
:: ============================================================================

title LTSC Prep & Edge Debloater Tool
color 0A

:: Kiểm tra quyền Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] KIEM TRA QUYEN: Vui long click chuot phai vao file va chon "Run as Administrator"!
    echo.
    pause
    exit /b
)

echo ============================================================================
echo                     BAT DAU THU THUAT TOI UU HE THONG
echo ============================================================================
echo.

:: 1. TẠO TIỀN ĐỀ NÂNG CẤP LTSC GIỮ NGUYÊN DỮ LIỆU
echo [+] 1. Dang thiet lap Registry sang EditionID "EnterpriseS" (LTSC Prep)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v EditionID /t REG_SZ /d EnterpriseS /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName /t REG_SZ /d "Windows 11 Enterprise LTSC" /f >nul
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v EditionID /t REG_SZ /d EnterpriseS /f >nul
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion" /v ProductName /t REG_SZ /d "Windows 11 Enterprise LTSC" /f >nul
echo     [OK] Da mo khoa tien de cho phep nang cap giu nguyen Apps/Files.

echo.

:: 2. TRIỆT HẠ DỊCH VỤ NGẦM CỦA MICROSOFT EDGE
echo [+] 2. Dang khoi va tat cac dich vu chay ngam cua Microsoft Edge...
taskkill /F /IM msedge.exe /T >nul 2>&1
taskkill /F /IM identity_helper.exe /T >nul 2>&1

sc config edgeupdate start= disabled >nul 2>&1
sc stop edgeupdate >nul 2>&1

sc config edgeupdatem start= disabled >nul 2>&1
sc stop edgeupdatem >nul 2>&1

sc config MicrosoftEdgeElevationService start= disabled >nul 2>&1
sc stop MicrosoftEdgeElevationService >nul 2>&1

reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v StartupBoostEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo     [OK] Da xich co tat ca cac dich vu Edge va tinh nang Startup Boost.

echo.

:: 3. TẮT TELEMETRY
echo [+] 3. Dang khoa dich vu thu thap du lieu Telemetry...
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1

sc config dmwappushservice start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1

echo     [OK] Da giai phong dung luong RAM bi ngon boi Telemetry.

echo.
echo ============================================================================
echo                     HOAN THANH CONG VIEC TOI UU!
echo ============================================================================
echo.
echo QUY TRINH TIEP THEO:
echo 1. Tai file ISO Windows 11 LTSC 2024 chinh chu.
echo 2. Mount file ISO hoac giai nen, chay file setup.exe.
echo 3. Chon option: "Keep personal files and apps" (Giu nguyen du lieu va phan mem).
echo.
echo Bam phim bat ky de thoat...
pause >nul