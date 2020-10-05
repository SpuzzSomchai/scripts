@echo off

CD "C:\Program Files (x86)\WinSCP" 
Winscp.com /script=C:\BACKUPS\scripts\uploadscript.txt

CD "C:\BACKUPS\upload"

