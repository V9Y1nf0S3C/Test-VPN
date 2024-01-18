@echo off
set IP_ADDRESS=127.0.0.1
set PORT=9000

:LOOP1
powershell -command "$tcp = New-Object System.Net.Sockets.TcpClient; $result = $tcp.BeginConnect('%IP_ADDRESS%', %PORT%, $null, $null); $result.AsyncWaitHandle.WaitOne(1000, $false); if ($tcp.Connected) { $tcp.EndConnect($result); $tcp.Close(); exit 0; } else { exit 1; }" > nul

if %errorlevel% neq 0 (
    echo %date% %time%: ALERT - Port %PORT% on %IP_ADDRESS% is not available
    cscript //nologo "playSound.vbs" "VPN Disconnected"
    cscript //nologo "playSound.vbs" "VPN Disconnected"
    cscript //nologo "playSound.vbs" "VPN Disconnected"
) else (
    echo %date% %time%: Port %PORT% on %IP_ADDRESS% is available
)
timeout /t 60 >nul
goto LOOP1

