# Description

Metarunner to execute [WhiteSource unified agent](https://github.com/whitesource/unified-agent-distribution/blob/master/standAlone/wss-unified-agent.jar) in TeamCity. For reusability reason, powershell module is published as [NuGet package](https://www.nuget.org/packages/Scanners-WhiteSource.PowerShell/), sources could be reviewed at https://github.com/akuryan/Powershell.Modules/tree/master/src/Scanning/WhiteSource/tools

## Installation

Copy `metarunner\WssAnalysis.xml` to `<TeamCityDataDir>\config\projects\_Root\pluginData\metaRunners` (if this metarunner shall be accessible to all projects)

## Configuration

## Execution plan

Metarunner will install latest [NuGet package](https://www.nuget.org/packages/Scanners-WhiteSource.PowerShell/) and will execute module to scan your sources via unified agent.