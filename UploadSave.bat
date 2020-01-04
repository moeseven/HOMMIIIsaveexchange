:: this script uploads the latest autosave (turn end)
:: run this after you ended your turn
:: alt + f4 HOMMIII and run this script

:: upload latest autosave to github
copy "..\games\AUTOSAVE.GM2" "save.GM2"
pause
set /p turn=< turncount.txt
pause
set /a next_turn=((%turn% + 1))
echo %next_turn%
pause
echo %next_turn% > turncount.txt
git add .   
git commit -m "%next_turn%"
git push origin tm
 