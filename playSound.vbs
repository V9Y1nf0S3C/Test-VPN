Dim oVoice
Set oVoice = CreateObject("SAPI.SpVoice")

If WScript.Arguments.Count = 0 Then
    oVoice.Speak "VB Script Invoked"
Else
    oVoice.Speak WScript.Arguments(0)
End If
Set oVoice = Nothing

