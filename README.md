# HOMMIIIsaveexchange

This program handles HotSeat over the internet using your git account to save the gamestate.
Currently only supports two player games.
If you play with a friend for a longer period of time you can each play your turn and the program handles upload and download of the saves. 

How to:
0. you need this program https://gitforwindows.org/ and ofcourse HOMMIII installed
1. your git folder (local repository) for the data exchange has to be located at the directory of your heroesIII installation
2. clone this to your folder
3. then create your own remote git repository (with write access for you and your friend) and push this folders content to it
4. now start a hotseat 2 player campaign and play your first turn after you hit end turn you run the UploadSave.bat (this step is only followed for the first turn of the map or when you and your friend started a Hotseat game and now want to continue playing your map over the internet)
5. your friend will then just have to run the LaunchMultiplayer.bat (it will start the game for him if there is a new save available e.g. you played your turn allready)
6. your friend plays his turn, hits end turn then alt+F4 and hit enter in the console (the new save will be uploaded)
7. jump to 5 and now its your turn ...

issues and hints:

1. you most likely will have to modify the startHeroes.bat skript by writing the correct name for your game.exe
2. you will have to play the player vs player combat together on one pc.
3. since this skript uses the autosave which occurs at the end of the turn, you will allways be able to see your friends position when you resume the save (i would love to be able to save the game state during the black screen between hotseat swaps)
4. I am using the HOMMIII HD mod which can be downloaded here:  (https://sites.google.com/site/heroes3hd/)

If you have any suggestions i will be happy to improve this skript if time and intellect allow it.
