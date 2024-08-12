    
REM Redirect to source 
cd C:\ProgramData\Jenkins\.jenkins\workspace\poc

REM Npm install and Build
start /wait npm install && npm run build

REM Copy build 
xcopy C:\ProgramData\Jenkins\.jenkins\workspace\poc\build C:\React-Build\poc\deploy /E /I /Y

REM Delete build
rmdir /s /q C:\ProgramData\Jenkins\.jenkins\workspace\poc\build 
