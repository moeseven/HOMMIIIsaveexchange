set x=createobject("wscript.shell")
'dim fso,vbpath,path_hexe'
'set fso = CreateObject("Scripting.FileSystemObject")'
'vbpath = fso.GetParentFolderName(WScript.ScriptFullName'
'path_hexe = fso.BuildPath(vbpath,"HEROES3HD.exe")'
'x.run path_hexe'
'x.run "notepad.exe"'
wscript.sleep 1000
x.sendkeys "l"
wscript.sleep 300
x.sendkeys "l"
wscript.sleep 300
x.sendkeys "m"