:: this script 
:: should download the newest savefile from git if there is one available
:: then start HOMMIII
:: after the turn it should upload the last savefile to github

:: fetch newest save from github
@echo off
set /p turn=< turncount.txt
echo %turn%
git pull origin tm
set /p turn_remote=< turncount.txt
echo %turn_remote%
IF %turn_remote% GTR %turn% (
    copy save.GM2 ..\games\yourturn.GM2
	echo you have a new save, start HOMM and play your turn
	pause
	::launch HOMMIII
	call startHeroes.bat
	echo next stage will upload save
	pause
	SET var=%cd%
	ECHO %var%
	call UploadSave.bat
) ELSE (
	echo there is no new save
)
pause