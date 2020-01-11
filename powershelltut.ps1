$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Heroes of Might and Magic III')
Sleep 1
$wshell.SendKeys('L')
Sleep 1
$wshell.SendKeys('l')