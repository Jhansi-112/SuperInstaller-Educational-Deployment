@echo off
title School Software Auto Installer
color 0A

:: Define Log File (placed in same folder as script)
set LOGFILE=%~dp0install_log.txt

:: Start logging
echo ====================================== >> "%LOGFILE%"
echo   School Software One-Click Installer   >> "%LOGFILE%"
echo   Started on %DATE% %TIME%              >> "%LOGFILE%"
echo ====================================== >> "%LOGFILE%"
echo. >> "%LOGFILE%"

echo ======================================
echo   School Software One-Click Installer
echo ======================================
echo.

:: Detect OS architecture
echo Detecting System Type...
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set ARCH=32
) else (
    set ARCH=64
)
echo Detected %ARCH%-bit System
echo Detected %ARCH%-bit System >> "%LOGFILE%"
echo.

:: ---- Install Pre-Requisites ----

echo Installing Java Runtime (JRE 8u461)...
if exist "jre-8u461-windows-x64.exe" (
    start /wait "" "jre-8u461-windows-x64.exe" /s
    echo Java Runtime - Done >> "%LOGFILE%"
) else (
    echo Java Runtime - FILE NOT FOUND >> "%LOGFILE%"
)

echo Installing .NET Framework 4.8...
if exist "ndp48-x86-x64-allos-enu.exe" (
    start /wait "" "ndp48-x86-x64-allos-enu.exe" /quiet /norestart
    echo .NET Framework 4.8 - Done >> "%LOGFILE%"
) else (
    echo .NET Framework 4.8 - FILE NOT FOUND >> "%LOGFILE%"
)

echo Installing Visual C++ Redistributable (2015-2022)...
if exist "VC_redist.x64.exe" (
    start /wait "" "VC_redist.x64.exe" /quiet /norestart
    echo VC++ Redistributable - Done >> "%LOGFILE%"
) else (
    echo VC++ Redistributable - FILE NOT FOUND >> "%LOGFILE%"
)

:: ---- Install Common Apps ----

echo Installing Childsplay...
if exist "childsplay-1.6_win32.exe" (
    start /wait "" "childsplay-1.6_win32.exe" /S
    echo Childsplay - Done >> "%LOGFILE%"
) else (
    echo Childsplay - FILE NOT FOUND >> "%LOGFILE%"
)

:: ---- Install 64-bit Apps only if system is 64-bit ----
if "%ARCH%"=="64" (

    echo Installing Scratch...
    if exist "scratch 3.29.1 Setup.exe" (
        start /wait "" "scratch 3.29.1 Setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo Scratch - Done >> "%LOGFILE%"
    ) else (
        echo Scratch - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing Python 3.13.2...
    if exist "python-3.13.2-amd64.exe" (
        start /wait "" "python-3.13.2-amd64.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
        echo Python 3.13.2 - Done >> "%LOGFILE%"
    ) else (
        echo Python 3.13.2 - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing OpenShot...
    if exist "openshot-v3.2.1-x86_64.exe" (
        start /wait "" "openshot-v3.2.1-x86_64.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo OpenShot - Done >> "%LOGFILE%"
    ) else (
        echo OpenShot - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing MIT App Inventor Tools...
    if exist "MIT_App_Inventor_Tools_30.265.0_win_setup64.exe" (
        start /wait "" "MIT_App_Inventor_Tools_30.265.0_win_setup64.exe" /S /VERYSILENT /SUPPRESSMSGBOXES
        echo MIT App Inventor - Done >> "%LOGFILE%"
    ) else (
        echo MIT App Inventor - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing MakeCode Arcade...
    if exist "makecode-arcade-setup-win64.exe" (
        start /wait "" "makecode-arcade-setup-win64.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo MakeCode Arcade - Done >> "%LOGFILE%"
    ) else (
        echo MakeCode Arcade - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing Krita...
    if exist "krita-x64-5.2.6-setup.exe" (
        start /wait "" "krita-x64-5.2.6-setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo Krita - Done >> "%LOGFILE%"
    ) else (
        echo Krita - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing GCompris...
    if exist "gcompris-qt-25.0-win64-gcc.exe" (
        start /wait "" "gcompris-qt-25.0-win64-gcc.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo GCompris - Done >> "%LOGFILE%"
    ) else (
        echo GCompris - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing Kodu Game Lab...
    if exist "KoduSetup_1.6.18.0 (1).exe" (
        start /wait "" "KoduSetup_1.6.18.0 (1).exe" /quiet /norestart
        echo Kodu Game Lab - Done >> "%LOGFILE%"
    ) else (
        echo Kodu Game Lab - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing ScratchJr...
    if exist "ScratchJr-1.3.2.Setup.exe" (
        start /wait "" "ScratchJr-1.3.2.Setup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo ScratchJr - Done >> "%LOGFILE%"
    ) else (
        echo ScratchJr - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing Tux Paint...
    if exist "tuxpaint-0.9.35-3-windows-x86_64-installer.exe" (
        start /wait "" "tuxpaint-0.9.35-3-windows-x86_64-installer.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo Tux Paint - Done >> "%LOGFILE%"
    ) else (
        echo Tux Paint - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing Arduino IDE...
    if exist "arduino_ide_2.3.8_Windows_64bit.exe" (
        start /wait "" "arduino_ide_2.3.8_Windows_64bit.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo Arduino IDE - Done >> "%LOGFILE%"
    ) else (
        echo Arduino IDE - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing BlueJ...
    if exist "BlueJ-windows-5.5.0.msi" (
        msiexec /i "BlueJ-windows-5.5.0.msi" /quiet /norestart
        echo BlueJ - Done >> "%LOGFILE%"
    ) else (
        echo BlueJ - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing GDevelop...
    if exist "GDevelop-5-Setup-5.6.265 (1).exe" (
        start /wait "" "GDevelop-5-Setup-5.6.265 (1).exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo GDevelop - Done >> "%LOGFILE%"
    ) else (
        echo GDevelop - FILE NOT FOUND >> "%LOGFILE%"
    )

    echo Installing MindPlus...
    if exist "MindPlus_Win_V1.8.1_RC3.0.exe" (
        start /wait "" "MindPlus_Win_V1.8.1_RC3.0.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART
        echo MindPlus - Done >> "%LOGFILE%"
    ) else (
        echo MindPlus - FILE NOT FOUND >> "%LOGFILE%"
    )

)

echo. >> "%LOGFILE%"
echo ====================================== >> "%LOGFILE%"
echo   All Software Installed Automatically >> "%LOGFILE%"
echo   Finished on %DATE% %TIME%            >> "%LOGFILE%"
echo ====================================== >> "%LOGFILE%"

echo.
echo ======================================
echo   All Software Installed Automatically
echo   Log saved to: %LOGFILE%
echo ======================================
pause
exit