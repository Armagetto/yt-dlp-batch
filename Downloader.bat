@ECHO OFF

ECHO __  __           ______      __                __                    __                __
ECHO \ \/ /___  __  _/_  __/_  __/ /_  ___     ____/ /___ _      ______  / /___  ____ _____/ /__  _____
ECHO  \  / __ \/ / / // / / / / / __ \/ _ \   / __  / __ \ ^| /^| / / __ \/ / __ \/ __  / __  / _ \/ ___/
ECHO  / / /_/ / /_/ // / / /_/ / /_/ /  __/  / /_/ / /_/ / ^|/ ^|/ / / / / / /_/ / /_/ / /_/ /  __/ /
ECHO /_/\____/\____//_/  \____/_____/\___/   \____/\____/^|__/^|__/_/ /_/_/\____/\____/\____/\___/_/
ECHO:

set location=-o "D:\downloads\youtube\%%(title)s-%%(id)s.%%(ext)s"
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
