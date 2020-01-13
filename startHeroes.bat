cd ..
start "2" "HEROES3HD.exe"
cd gitSaveFileExchange
start "1" "turnoffmonitor.bat"
start "3" PowerShell.exe -ExecutionPolicy Bypass -Command "& './mouseclick.ps1'"