@echo off

:: format current time into filename-friendly string
set hh=%time:~0,2%
if "%hh:~0,1%" == " " set hh=0%hh:~1,1%
set nn=%time:~3,2%
if "%nn:~0,1%" == " " set nn=0%nn:~1,1%
set ss=%time:~6,2%
if "%ss:~0,1%" == " " set ss=0%ss:~1,1%
set tt=%time:~9,2%
if "%tt:~0,1%" == " " set tt=0%tt:~1,1%
set timeStamp=%yyyy%%mm%%dd%%hh%%nn%%ss%%tt%

:: prompt for CDN and file name
set hostCDN=https://cdn.legion22.world/
set /p hostCDN=Host CDN url: 
set /p cmmnName=Common file name: 

:: create cmmnName folder to store .ts files, adds timestamp to create unique names
set foldName=%cmmnName%%timeStamp%
mkdir %foldName%

cd %foldName%

:: while loop pulls all .ts files under that name, pads up to 100s with zeros as necessary because the CDN doesn't
set i=0
:while
:: get HTTP status code for URL and save to tempCode var
for /f "tokens=*" %%g in ('curl -s -o NUL -w "%%{http_code}" %hostCDN%%cmmnName%%i%.ts') do (set tempCode=%%g)
if %tempCode% NEQ 404 (
	if %i% LSS 10 (
		curl %hostCDN%%cmmnName%%i%.ts -o %cmmnName%00%i%.ts
	) else if %i% LSS 100 (
		curl %hostCDN%%cmmnName%%i%.ts -o %cmmnName%0%i%.ts
	) else (
		curl %hostCDN%%cmmnName%%i%.ts -o %cmmnName%%i%.ts
	)
	set /a i=i+1
	goto :while
)

:: gets all the file names and puts into a list that ffmpeg will refrence
(for %%k in (*.ts) do @echo file '%%k') > files.txt

cd ..

:: runs command to stitch files together
set ffmpegLoc=%~dp0%ffmpeg.exe
%ffmpegLoc% -f concat -safe 0 -i %foldName%\files.txt -c copy %foldName%\%cmmnName%.mp4

:: cleanup
cd %foldName%
mkdir ts
for %%l in (*.ts) do move %%l ts\%%l

pause
