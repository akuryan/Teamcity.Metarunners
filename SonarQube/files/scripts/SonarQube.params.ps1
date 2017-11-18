param(
    [string] $params
)

#This script is designed to replace replace '-D' with '/d:' to maintain compatibility with official Teamcity SonarQube runner

if (![string]::IsNullOrEmpty($params))
{
  $changedParams = $params.Replace("-D","/d:").replace("`n"," ").replace("`r"," ")
  "##teamcity[setParameter name='sonar.parameters' value='$changedParams']"
}


