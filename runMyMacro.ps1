[System.Windows.Forms.SendKeys]::SendWait("{TAB}"*10)
[System.Windows.Forms.SendKeys]::SendWait("l")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("m")
Start-Sleep -Milliseconds 500
write-host "Press any key to continue..."
[void][System.Console]::ReadKey($true)