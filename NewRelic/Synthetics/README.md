# Synthetics API

Metarunners to operate with New Relic Synthetics API

## Usage

Copy contents of `metarunner` folder (it could contain more than one metarunner in future) to target teamcity projects metarunner folder (I am copying it to `<TeamCityDataDir>\config\projects\_Root\pluginData\metaRunners` to make metarunners accessible to all projects).

### New Relic:: Start/stop Synthetics monitors metarunner

This metarunner performs following steps:

1. Creates packages config to install https://www.nuget.org/packages/NewRelic.Synthetics.Api/

1. Executes Nuget to restore package

1. Executes start/stop monitor(s) operation against Synthetics API
