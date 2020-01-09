set x=createobject("wscript.shell")

x.run "notepad.exe"
wscript.sleep 1000
x.sendkeys "Hello there"