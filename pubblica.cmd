@echo off
cd /d "%~dp0"
echo Invio su GitHub...
git add -A
git commit -m "Aggiorna contenuto"
rem Il repository e' di dilfalmd: si pubblica con il suo token, senza cambiare l'account attivo di gh.
for /f "delims=" %%t in ('gh auth token -u dilfalmd') do set "T=%%t"
git -c credential.helper= -c "credential.helper=!f() { echo username=x-access-token; echo password=%T%; }; f" push origin main
set "T="
echo.
echo Pubblicato!
pause
