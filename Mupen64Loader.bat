@echo off
echo This Wizard is intended to make it easier for people
echo to use mupen64 without a graphical front end
echo This Sctipt has been written by Supernatendo and tested in Windows XP.
echo Feel free to modify, copy, and distribute freely so long as
echo you credit the original author (Supernatendo) for the original script.
echo feel free to email me to give suggestions or criticism at supernatendo@aol.com
echo.
echo This Script is better viewed in a full screen CMD prompt window
echo.
pause

cls
if exist mupen64plus-ui-console.exe goto start
echo ERROR: "mupen64plus-ui-console.exe" Not Found!!
echo please put this batch fle in the same directory as "mupen64plus-ui-console.exe"
echo.
echo Press any key to exit...
pause > nul
END

:start
cls
mupen64plus-ui-console.exe --help
if not exist "lastparam.txt" goto chooseparam
REM # Last parameter
set /p paramopt= < lastparam.txt
echo.
echo
================================================================================================================================================================
echo Use the following Parameters?
echo.
echo %paramopt%
echo.
echo.
echo YES [1]
echo NO  [2]
echo.
set /p uselastparam=
if %uselastparam% == 1 goto choice2
if %uselastparam% == 2 goto chooseparam
echo invalid entry, press any key to try again...
pause > nul
cls
goto start

:chooseparam

echo.
echo.
echo Please insert the desired parameters and options
set /p paramopt=
echo.>>lastparam.txt
del lastparam.txt
echo %paramopt%>> lastparam.txt

:choice2
cls
if not exist "lastromdir.txt" goto chooseromdir
set /p romdir= < lastromdir.txt
echo Last Rom Directory used:
echo.
echo %romdir%\
echo.
echo Use this directory?
echo YES [1]
echo NO  [2]
echo.
set /p usethisdir=
if %usethisdir% == 1 goto choice3
if %usethisdir% == 2 goto chooseromdir
echo invalid entry, press any key to try again...
pause > nul
cls
goto choice2

:chooseromdir
echo Please insert the rom directory:
set /p romdir=
echo.>>lastromdir.txt
del lastromdir.txt
echo %romdir%>> lastromdir.txt
goto chooserom

:choice3
cls
if not exist "lastrom.txt" goto chooserom
set /p rom= < lastrom.txt
echo Last Game Loaded:
echo.
echo %rom%
echo.
echo Launch this game?
echo YES [1]
echo NO  [2]
echo.
set /p usethisrom=
if %usethisrom% == 1 goto loadrom
if %usethisrom% == 2 goto chooserom
echo invalid entry, press any key to try again...
pause > nul
cls
goto choice3

:chooserom
pushd "%romdir%"
dir /b
echo.
echo Type the rom exactly as it appears in the list
popd
set /p rom=
echo.>>lastrom.txt
del lastrom.txt
echo %rom%>> lastrom.txt

:Loadrom
cls
if exist log.txt del log.txt
mupen64plus-ui-console.exe %paramopt% "%romdir%\%rom%" >> log.txt
type log.txt
echo.
echo
================================================================================================================================================================
echo Press any key to return to the beginning
pause > nul
goto start

