param(
    [string] $sqScannerRoot
)

#This script is designed to replace replace '-D' with '/d:' to maintain compatibility with official Teamcity SonarQube runner

if (![string]::IsNullOrEmpty($sqScannerRoot)) {
  #Update path to hold path to scanner
  $path = (Get-Item Env:\PATH).Value;
  #just in case our PATH already ends with semicolon
  $path = $path.Trimend(';')
  $path = $path + ";$sqScannerRoot;"
  Write-Host "PATH: $path"
  Write-Host "##teamcity[setParameter name='env.PATH' value='$path']"
}

$params = (Get-Item Env:\sonarParameters).Value;
if (![string]::IsNullOrEmpty($params)) {
  Write-Host "Params in settings: $params"
  if ($params.Contains("-D")) {
    $paramsCollection = $params -split "-D"
    $changedParams = ""
    foreach ($p in $paramsCollection) {
      if ([string]::IsNullOrEmpty($p)) { continue }
      Write-Host "Initial p: $p"
      $p = "/d:" + $p.replace("=", "=`"") + "`"" + " "
      $p = $p.replace("`n","").replace("`r","").Replace("`"`"", "`"")
      Write-Host "Final p: $p"
      $changedParams += $p
    }
  }
  else {
    $changedParams = $params
  }
  $changedParams = $changedParams.replace("`n","").replace("`r","")
  Write-Host "changedParams: $changedParams"
  Write-Host "##teamcity[setParameter name='env.sonar.parameters' value='$changedParams']"
}
