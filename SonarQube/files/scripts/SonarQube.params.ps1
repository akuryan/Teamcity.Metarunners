param(
    [string] $sqScannerRoot
)

#This script is designed to replace replace '-D' with '/d:' to maintain compatibility with official Teamcity SonarQube runner

#Update path to hold path to scanner
$path = (Get-Item Env:\PATH).Value;
#just in case our PATH already ends with semicolon
$path = $path.Trimend(';')
$path = $path + ";$sqScannerRoot;"
Write-Host "PATH: $path"
Write-Host "##teamcity[setParameter name='env.PATH' value='$path']"
$params = (Get-Item Env:\sonarParameters).Value;
if (![string]::IsNullOrEmpty($params)) {
  if ($params.Contains("-D")) {
    $paramsCollection = $params -split "-D"
    $changedParams = ""
    foreach ($p in $paramsCollection) {
      if ([string]::IsNullOrEmpty($p)) { continue }
      $p = "/d:" + $p.replace("=", "=`"") + "`""
      $changedParams += $p
    }
  }
  else {
    $changedParams = $params
  }
  Write-Host "changedParams: $changedParams"
  Write-Host "##teamcity[setParameter name='env.sonar.parameters' value='$changedParams']"
}
