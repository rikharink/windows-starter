choco install -y nvm
choco install -y yarn
choco install -y hugo-extended
RefreshEnv
nvm install latest
RefreshEnv
yarn global add @vue/cli
yarn global add typescript
yarn global add webpack