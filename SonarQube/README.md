# SonarQube C# Analysis

Copy `metarunner\SonarQubeCsAnalysis.xml` to `<TeamCityDataDir>\config\projects\_Root\pluginData\metaRunners` (if this metarunner shall be accessible to all projects)

`files\scripts` contents must be placed at `%system.TeamCityCiToolsPath%\CI.Builds\Scripts\SonarQube.params.ps1` (so, you are in control where to place the script)

`files\msbuild-sq-scanner` content must be placed at `%system.TeamCityCiToolsPath%\CI.Builds\Programs\msbuild-sq-scanner`

This meta-runner is designed to solve https://github.com/JetBrains/TeamCity.SonarQubePlugin/issues/40 (current TeamCity meta-runner does not support SonarC# v.6+ analyzer).

Since I already use https://github.com/JetBrains/TeamCity.SonarQubePlugin at my servers - there is one step in meta-runner to ease conversion of previuos parameters (replace '-D' with '/d:')

Metarunner consists of following steps:

1. Start Nuget installer

1. Parse %additional_sonar_parameters%

1. Update PATH variable to hold information about where scanner is located

1. Start sonarrunner as in [MSDN blog example|https://blogs.msdn.microsoft.com/devops/2015/09/28/quickstart-analyzing-net-projects-with-sonarqube-msbuild-or-visual-studio-online-and-third-party-analyzers-stylecop-resharper/]

1. Start Msbuild for solution

1. Stop sonarrunner as in [MSDN blog example|https://blogs.msdn.microsoft.com/devops/2015/09/28/quickstart-analyzing-net-projects-with-sonarqube-msbuild-or-visual-studio-online-and-third-party-analyzers-stylecop-resharper/]