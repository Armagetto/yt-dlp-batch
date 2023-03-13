@ECHO OFF

ECHO __  __           ______      __                __                    __                __
ECHO \ \/ /___  __  _/_  __/_  __/ /_  ___     ____/ /___ _      ______  / /___  ____ _____/ /__  _____
ECHO  \  / __ \/ / / // / / / / / __ \/ _ \   / __  / __ \ ^| /^| / / __ \/ / __ \/ __  / __  / _ \/ ___/
ECHO  / / /_/ / /_/ // / / /_/ / /_/ /  __/  / /_/ / /_/ / ^|/ ^|/ / / / / / /_/ / /_/ / /_/ /  __/ /
ECHO /_/\____/\____//_/  \____/_____/\___/   \____/\____/^|__/^|__/_/ /_/_/\____/\____/\____/\___/_/
ECHO:

For /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-3 delims=/:/ " %%a in ('time /t') do (set min=%%b)
For /f "tokens=1-2 delims=/:/ " %%a in ('time /t') do (set hour=%%a)
For /f "tokens=1-3 delims=/:/ " %%a in ('time /t') do (set AMPM=%%c)

for /f "tokens=* delims=0" %%a in ("%min%") do set min=%%a
for /f "tokens=* delims=0" %%a in ("%hour%") do set hour=%%a
set /a fort=%hour%+12

if %AMPM%==PM (
set ampm_folder_name=%mydate%_%fort%-%min%
)else (
set ampm_folder_name=%mydate%_%hour%-%min%
)


set location=-o "D:\downloads\youtube\%%ampm_folder_name%%\%%(title)s-%%(id)s.%%(ext)s"

set /p url=Url: 
cmd /c yt-dlp.exe --list-formats %url%

set /p format=Type a format(n for defult video): 

set /p sponsorblock=Use sponsorblock(y/n): 

if %format%==n (
if %sponsorblock%==y (
start yt-dlp.exe %location% %url% --sponsorblock-remove all
)
if %sponsorblock%==n (
start yt-dlp.exe %location% %url%
)
)

if NOT %format%==n (
if %sponsorblock%==y (
start yt-dlp.exe -f %format% %location% %location% %url% --sponsorblock-remove all
)
if %sponsorblock%==n (
start yt-dlp.exe -f %format% %location% %location% %url%
)
)
%SystemRoot%\explorer.exe "D:\downloads\youtube\"
