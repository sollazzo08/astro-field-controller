PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell C:\Astro\Hotspot\hotspot.ps1 >> "%TEMP%\StartupLog.txt" 2>&1
