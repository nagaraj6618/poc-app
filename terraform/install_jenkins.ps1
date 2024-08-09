# Set-ExecutionPolicy to allow script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

# Download Jenkins WAR file
Invoke-WebRequest -Uri https://get.jenkins.io/war/latest/jenkins.war -OutFile C:\jenkins.war

# Start Jenkins (not as a service in this example)
Start-Process -NoNewWindow -FilePath 'java' -ArgumentList '-jar C:\jenkins.war' -PassThru -Wait

# Output Jenkins URL
Write-Output 'Jenkins installation complete. Access Jenkins at http://localhost:8080'
