param(
    [string] $params,
    [string] $sqScannerRoot
)

#This script is designed to replace replace '-D' with '/d:' to maintain compatibility with official Teamcity SonarQube runner

if (![string]::IsNullOrEmpty($params))
{
  $changedParams = $params.Replace("-D","/d:").replace("`n"," ").replace("`r"," ")
  Write-Host "changedParams: $changedParams"
  Write-Host "##teamcity[setParameter name='env.sonar.parameters' value='$changedParams']"
}

#Update path to hold path to scanner
$path = (Get-Item Env:\PATH).Value;
$path = $path + ";$sqScannerRoot"
Write-Host "PATH: $path"
Write-Host "##teamcity[setParameter name='env.PATH' value='$path']"