$mavenDir = "apache-maven-3.9.6"
if (-not (Test-Path "$mavenDir\bin\mvn.cmd")) {
    Write-Host "Downloading Maven..."
    Invoke-WebRequest -Uri "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip" -OutFile "maven.zip"
    Write-Host "Extracting Maven..."
    Expand-Archive -Path "maven.zip" -DestinationPath "." -Force
    Remove-Item "maven.zip"
}
Write-Host "Building and Running project with Maven..."
& ".\$mavenDir\bin\mvn.cmd" compile exec:java
