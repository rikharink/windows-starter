choco install -y linqpad
choco install -y dotnetcore-sdk

choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
RefreshEnv
choco install -y visualstudio2017-workload-azure
choco install -y visualstudio2017-workload-manageddesktop
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-netweb