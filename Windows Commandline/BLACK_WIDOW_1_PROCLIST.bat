@echo off
Color 0A
Title Processlist: BLACK WIDOW 1
echo ----------- SERVER:BLACK WIDOW 1 ---------------------------------
set ipcim=192.16...
SETLOCAL ENABLEDELAYEDEXPANSION
set "URL=http://192.168....1/mysqlsize1.txt"
for %%a in (%URL%) do Set "File=%%~nxa"
Set "DownloadFolder=%Temp%"
SET current=''
Call :Download "%URL%" "%DownloadFolder%\%File%"
Rem To read the contents of the text file downloaded in temp folder
for /f "tokens=*" %%A in ('Type "%DownloadFolder%\%File%"') do (
SET current=%%A
SET _result=!current:~0,4!
SET _name=!current:~5!
IF /I !_result! GEQ 0 (IF /I !_result! LEQ 9999 (echo --------------------------------- !_name! ---------------------------------
set portcim=!_result!
"C:\Program Files\MySQL\MySQL Workbench 6.3 CE\mysql" -u service -px55GeCcd5bPgtTzW -h %ipcim% -P !portcim! -D information_schema -e "SELECT * FROM information_schema.PROCESSLIST a WHERE a.COMMAND NOT LIKE 'Sleep' and not (TIME IN(0,1) AND USER='service')" 3>&1 1>&2 2>&3 | Findstr -v "mysql: [Warning] Using a password on the command line interface can be insecure.") 3>&1 1>&2 2>&3
)) 
)
pause>nul & Exit
:Download <Url> <File>
certutil.exe -urlcache -split -f %1 %2 >nul
exit /b