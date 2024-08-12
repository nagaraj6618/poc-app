@echo off
REM Npm install command
npm install

REM Build
npm run build

REM Copy build 
xcopy C:\ProgramData\Jenkins\.jenkins\workspace\poc\build C:\React-Build\poc\deploy /E /I /Y

REM Delete build
rmdir /s /q C:\ProgramData\Jenkins\.jenkins\workspace\poc\build 
