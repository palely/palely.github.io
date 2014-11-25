Option Explicit

Dim objShell, host
Set objShell = WScript.CreateObject("WScript.Shell")
host = WScript.FullName

If LCase(Mid(host, InStrRev(host, "\") + 1)) = "wscript.exe" Then
    objShell.Run "CScript """ & WScript.ScriptFullName & """", 0
	Set objShell = Nothing
    WScript.Quit
End If

Dim objExec' , stdText

' Set objExec = objShell.Exec("arp -a")
' Do Until objExec.StdOut.AtEndOfStream
' 	stdText = objExec.StdOut.ReadAll()
' 	MsgBox stdText
' Loop

Set objExec = objShell.Exec("arp -a")
Do
	MsgBox objExec.StdOut.ReadLine
Loop Until objExec.StdOut.AtEndOfLine

Set objExec = Nothing
Set objShell = Nothing