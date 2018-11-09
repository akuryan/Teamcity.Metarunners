# Costs saver for Azure

This package is designed to save on costs of resources in Azure. Usually, one is not using Test and Acceptance resources during nights and weekends, but not everybody can afford themselves to destroy those resources and recreate them (complex configurations, too much manual interventions, whateverYouNameIt).
So, I designed this small script for VSTS, which requires your connection to Azure RM and wants your resource group name to proceed.

If you select to downscale your resources (running at evening) - it will find all SQL databases, all web apps and all VMs belonging to given resource group and will downscale web apps and sql databases to lowest possible size, vm's will be deprovisioned. If you select to upscale resources - script will read tags on them and upscale resources (web app and sql databases), vm's will be started.

SQL databases sizes tags are stored on SQL server resource, as they tend to dissappear on SQL database resource.

## Script location

To improve reusability, script itself have been moved to Nuget - [package CostsSaver-Azure.PowerShell](https://www.nuget.org/packages/CostsSaver-Azure.PowerShell/); sources could be reviewed at other [repository](https://github.com/akuryan/Powershell.Modules/blob/master/src/Azure/BudgetSaver/tools/azure-costs-saver.psm1)

## Issues

1. Script will silently fail if you try to run upscaling before downscaling

1. Script will fail if Tags are missing

1. There is no way for web apps to be downscaled to Basic, as at this point of time I could not check, if there is a staging slot on web app present (Basic does not allow slots at all)

1. You shall be executing at VS2017 Hosted pool, if your web apps are running on PremiumV2 tier.

## Use case

Downscale Azure resources for Testing and Acceptance environments during nights and weekends to save on costs.

### Details

Please, read [post](https://colours.nl/azure-costs-saver) detailing usage and possible use cases as well.

# Metarunner description



## Configuration

Create [Azure Service principle](https://docs.microsoft.com/en-us/azure/azure-stack/user/azure-stack-create-service-principals). You will need your service principle application ID, key, your Azure Tenant ID and your Azure Subscription ID.


## Explanation

