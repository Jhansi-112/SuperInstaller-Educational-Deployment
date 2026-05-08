@echo off
setlocal enabledelayedexpansion
title School One-Click Installer (Auto + Logs)
echo ==================================================
echo Installing Education Software (7 apps + prerequisites)...
echo ==================================================
echo.

echo Please run this script as Administrator for best results.
echo.

:: Create logs folder
set "LOGDIR=%~dp0logs"
if not exist "%LOGDIR%" mkdir "%LOGDIR%"

:: Clear/initialize summary
if exist "%LOGDIR%\summary.log" del "%LOGDIR%\summary.log" 2>nul
echo Installation run: %date% %time% > "%LOGDIR%\summary.log"
echo. >> "%LOGDIR%\summary.log"

:: -------------------------
:: Pre-Requisites
:: -------------------------
:: Java Runtime (32-bit)
echo Installing: Java Runtime (JRE 8u461)...
if exist "%~dp0jre-8u461-windows-i586-iftw.exe" (
  "%~dp0jre-8u461-windows-i586-iftw.exe" /s > "%LOGDIR%\java.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: jre-8u461-windows-i586-iftw.exe
  set "rc=1"
)
call :log_status "Java-8u461" %rc%

:: .NET Framework 4.8
echo Installing: .NET Framework 4.8...
if exist "%~dp0ndp48-web.exe" (
  "%~dp0ndp48-web.exe" /quiet /norestart > "%LOGDIR%\dotnet.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: ndp48-web.exe
  set "rc=1"
)
call :log_status ".NET-Framework-4.8" %rc%

:: Visual C++ Redistributable
echo Installing: Visual C++ Redistributable (x86)...
if exist "%~dp0VC_redist.x86.exe" (
  "%~dp0VC_redist.x86.exe" /quiet /norestart > "%LOGDIR%\vcredist.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: VC_redist.x86.exe
  set "rc=1"
)
call :log_status "VC++-2015-2022-x86" %rc%

:: -------------------------
:: 1) TuxTyping
echo Installing: TuxTyping...
if exist "%~dp0tuxtype-1.8.1-win32-installer.exe" (
  "%~dp0tuxtype-1.8.1-win32-installer.exe" /S > "%LOGDIR%\tuxtyping.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: tuxtype-1.8.1-win32-installer.exe
  set "rc=1"
)
call :log_status "TuxTyping" %rc%

:: 2) Childsplay
echo Installing: Childsplay...
if exist "%~dp0childsplay-1.6_win32.exe" (
  "%~dp0childsplay-1.6_win32.exe" /S > "%LOGDIR%\childsplay.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: childsplay-1.6_win32.exe
  set "rc=1"
)
call :log_status "Childsplay" %rc%

:: 3) GCompris
echo Installing: GCompris...
if exist "%~dp0gcompris-qt-4.3.1-win32-gcc.exe" (
  "%~dp0gcompris-qt-4.3.1-win32-gcc.exe" /S > "%LOGDIR%\gcompris.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: gcompris-qt-4.3.1-win32-gcc.exe
  set "rc=1"
)
call :log_status "GCompris" %rc%

:: 4) Krita
echo Installing: Krita (x86)...
if exist "%~dp0krita-x86-4.4.2-setup.exe" (
  "%~dp0krita-x86-4.4.2-setup.exe" /VERYSILENT /NORESTART /SP- /LOG="%LOGDIR%\krita.log"
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: krita-x86-4.4.2-setup.exe
  set "rc=1"
)
call :log_status "Krita-4.4.2" %rc%

:: 5) OpenShot
echo Installing: OpenShot...
if exist "%~dp0openshot-v3.2.1-x86.exe" (
  "%~dp0openshot-v3.2.1-x86.exe" /VERYSILENT /NORESTART /SP- /LOG="%LOGDIR%\openshot.log"
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: openshot-v3.2.1-x86.exe
  set "rc=1"
)
call :log_status "OpenShot" %rc%

:: 6) Python
echo Installing: Python 3.13.2...
if exist "%~dp0python-3.13.2.exe" (
  "%~dp0python-3.13.2.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 > "%LOGDIR%\python.log" 2>&1
  set "rc=%ERRORLEVEL%"
) else (
  echo Missing: python-3.13.2.exe
  set "rc=1"
)
call :log_status "Python-3.13.2" %rc%

:: 7) MIT App Inventor Tools (search)
echo Searching for MIT App Inventor Tools installer...
set "MITPATH="

for /f "delims=" %%F in ('dir /b /a-d "%~dp0MIT_App_Inventor_Tools*.exe" 2^>nul') do set "MITPATH=%~dp0%%F"
if not defined MITPATH for /f "delims=" %%F in ('dir /b /a-d "%~dp0*App_Inventor*.exe" 2^>nul') do set "MITPATH=%~dp0%%F"

if defined MITPATH (
  echo Found MIT installer: "%MITPATH%"
  "%MITPATH%" /S > "%LOGDIR%\mit_appinventor.log" 2>&1
  set "rc=%ERRORLEVEL%"
  call :log_status "MIT_AppInventor" %rc%
) else (
  echo ERROR: MIT App Inventor installer not found.
  echo Put "MIT_App_Inventor_Tools_30.265.0_win_setup.exe" in this folder.
  echo [%date% %time%] [MISSING] MIT_AppInventor >> "%LOGDIR%\summary.log"
  start "" "%~dp0"
)

:: -------------------------
echo.
echo ==================================================
type "%LOGDIR%\summary.log"
echo ==================================================
echo.
echo Individual logs are in: %LOGDIR%
echo If any installer failed, check its .log file.
echo.

pause
endlocal
exit /b 0

:: -------------------------
:: Label must be placed at end
:log_status
if %2% EQU 0 (
  echo [%date% %time%] [OK]     %1 >> "%LOGDIR%\summary.log"
) else (
  echo [%date% %time%] [FAILED] %1 >> "%LOGDIR%\summary.log"
)
exit /b
