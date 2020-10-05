@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%YYYY%_%MM%_%DD%_%HH%_%Min%_%Sec%"
set "datestamp=%YYYY%%MM%%DD%"

MD "C:\BACKUPS\files\"%datestamp%

set filename="C:\BACKUPS\files\%datestamp%\filename-%fullstamp%.sql"
set filename2="C:\BACKUPS\files\%datestamp%\filename-%fullstamp%.zip"
echo %filename%
cd "C:\BACKUPS\scripts"
C:\xampp\mysql\bin\mysqldump.exe BD_name--user=Usename --password=Mypassword --host="127.0.0.1" --port=MyPort --result-file=%filename% --default-character-set=utf8 --single-transaction=TRUE
echo backup-finished

if exist %filename% (
    "C:\Program Files\7-Zip\7z.exe" a %filename2% %filename%
    echo zip-finished
    del %filename%
)
if exist %filename2% (
    MD "C:\BACKUPS\upload\"%datestamp%\
    Xcopy /E /I %filename2% "C:\BACKUPS\upload\"%datestamp%\
    echo copy-finished

    CALL "C:\BACKUPS\scripts\deploy.bat"
    RD /s /q C:\BACKUPS\upload\%datestamp%
)

exit