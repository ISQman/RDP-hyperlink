@echo off
setlocal enableextensions enabledelayedexpansion
reg add "HKCR\rdp" /f /v "" /t REG_SZ /d "URL:Remote Desktop Connection"
reg add "HKCR\rdp" /f /v "URL Protocol" /t REG_SZ /d ""
reg add "HKCR\rdp\DefaultIcon" /f /v "" /t REG_SZ /d "C:\WINDOWS\System32\mstsc.exe"
reg add "HKCR\rdp\shell\open\command" /f /v "" /t REG_SZ /d "wscript.exe C:\WINDOWS\hyperlink-rdp.js %%1"
set sFile=C:\WINDOWS\hyperlink-rdp.js
more +10 "%~0">"%sFile%"
endlocal
exit /b 0
//powered by Herman Khukhaliev 2021
var server=(WScript.Arguments(0))
var prefix='rdp://'
var app='C:\\WINDOWS\\system32\\mstsc.exe'
server=server.replace(prefix, '')
server=server.replace(/\+/g, ' /')
server=server.replace(/\/$/, '')
var shell = new ActiveXObject("WScript.Shell")
shell.Exec(app + " /v:" + server)
