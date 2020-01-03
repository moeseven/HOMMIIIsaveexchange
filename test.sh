#!/bin/bash  
cp ../games/AUTOSAVE.GM1 save.GM1
git add .  
read -p "Commit description: " desc  
git commit -m "$desc"
git push origin tm