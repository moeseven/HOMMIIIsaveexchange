#!/bin/bash 

#this script 
#should download the newest savefile from git if there is one available
#then start HOMMIII
#after the turn it should upload the last savefile to github

#fetch newest save from github
turn=$(head -n 1 "turncount.txt")
echo $turn
git pull origin tm
turn_remote=$(head -n 1 "turncount.txt")
echo $turn_remote

if (($turn_remote > $turn)); then #only do all if there is a new save available
read -p "Press [Enter] key to continue...inside if condition"
cp save.GM2 ../games/yourturn.GM2
echo "you have a new save, start HOMM and play your turn"
#launch HOMMIII

else
echo "there is no new save"
fi
read -p "Press [Enter] key to after you finished your turn in order to upload"
sh ./UploadSave.sh
read -p "Press [Enter] key to end"