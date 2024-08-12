REM Copy build files

npm install && npm run build && xcopy C:\ProgramData\Jenkins\.jenkins\workspace\poc\build C:\React-Build\poc\deploy /E /I /Y
