#this script is executed as inline script in metarunner

#authorize at Azure
$creds = New-Object System.Management.Automation.PSCredential (%azure.ApplicationId%, %azure.ApplicationSecret%);
Login-AzureRmAccount -Credential $creds -ServicePrincipal -TenantId %azure.TenantId%;
Select-AzureRmSubscription -SubscriptionId %azure.SubscriptionId%

Write-Verbose "In input costsSaver.Downscale we have %costsSaver.Downscale%";
if ("%costsSaver.Downscale%".ToLower() -eq "true") {
    $Downscale = $true;
} else {
    $Downscale = $false;
}

Write-Host "We are going to downscale? $Downscale";
Write-Host "Resources will be selected from %costsSaver.ResourceGroupName% resource group";

Import-Module %system.teamcity.build.tempDir%\azure-costs-saver.psm1;

Set-ResourceSizesForCostsSaving -ResourceGroupName "%costsSaver.ResourceGroupName%" -Downscale $Downscale -executionEnv "teamcity";