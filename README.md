# Deploy Vite React to Azure App Service

## Steps

`az group create --name rgname --location eastus`

`az deployment group create --name depp --resource-group rgname --template-file ./deploy.bicep --parameters ./deploy.parameters.json`

`pm2 serve /home/site/wwwroot/dist --no-daemon --spa`
