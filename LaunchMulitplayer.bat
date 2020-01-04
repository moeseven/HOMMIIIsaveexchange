:: this script 
:: should download the newest savefile from git if there is one available
:: then start HOMMIII
:: after the turn it should upload the last savefile to github

:: fetch newest save from github
set /p turn=< turncount.txt
echo %turn%
git pull origin tm
set /p turn_remote=< turncount.txt
echo %turn_remote%
pause
::if %turn_remote% gtr %turn% (
copy save.GM2 ..\games\yourturn.GM2
echo you have a new save, start HOMM and play your turn
::launch HOMMIII
..\HEROES3HD.exe
::) else(
echo there is no new save
::)
pause
echo next stage will upload save
pause
call UploadSave.bat
pause