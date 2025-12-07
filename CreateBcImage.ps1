New-BcImage -artifactUrl (Get-BCArtifactUrl -type sandbox -country w1 -accept_insiderEula -select NextMajor) -imageName mybc -baseImage "mcr.microsoft.com/businesscentral:ltsc2025"
