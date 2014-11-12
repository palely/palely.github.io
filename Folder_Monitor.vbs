Option Explicit

Dim objFso, objFolder, oSize, count, limit, delay
Set objFso = WScript.CreateObject("Scripting.FileSystemObject")
Set objFolder = objFso.GetFolder(".")
oSize = objFolder.Size
count = 1
delay = 100
limit = 100 '文件夹大小持续 limit*delay ms 未变化循环终止

Do
	If objFolder.Size <> oSize Then
		oSize = objFolder.Size
		MsgBox oSize
		count = 1
	End If
	If count > limit Then
		Exit Do
	End If
	count = count + 1
	WScript.Sleep delay
Loop

Set objFolder = Nothing

Dim objShell, iReturnCode
Set objShell = WScript.CreateObject("WScript.Shell")
iReturnCode = objShell.Run("cmd.exe /c dir", 0, True)
Set objShell = Nothing

Dim objFile
Set objFile = objFso.OpenTextFile("exit.txt", 2, True)

objFile.WriteLine "Error Number:" & iReturnCode
objFile.WriteLine "        Time:" & Now()
objFile.WriteLine "        Size:" & oSize
objFile.WriteLine "----------------------------"
objFile.WriteLine "Exit"

objFile.Close

Set objFile = Nothing

Set objFso = Nothing


Dim i, ii
i = 0
ii = 0

Do
	If Trigger() = True Then
		If CallBack() = True Then
			Exit Do
		End If
	End If
	WScript.Sleep 100
Loop

Function Trigger()
	i = i + 1
	' MsgBox "Trigger:" & i
	If i < 2 Then
		Exit Function
	End If
	Trigger = True
End Function

Function CallBack()
	ii = ii + 1
	' MsgBox "CallBack:" & ii
	If ii < 2 Then
		i = 0
		Exit Function
	End If
	CallBack = True
End Function
