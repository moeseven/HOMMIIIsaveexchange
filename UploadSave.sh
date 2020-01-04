#!/bin/bash 

# this script uploads the latest autosave (turn end)
# run this after you ended your turn
# alt + f4 HOMMIII and run this script


#upload latest autosave to github
cp ../games/AUTOSAVE.GM2 save.GM2
turn=$(head -n 1 "turncount.txt")
next_turn=$((turn + 1))
echo $next_turn > turncount.txt
git add .  
read -p "Commit description: " desc  
git commit -m "$desc"
git push origin tm