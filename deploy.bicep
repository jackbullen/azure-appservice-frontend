resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp'
  location: location
  sku: {
    name: 'P0v3'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: 'client'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'NODE|20-lts'
      appCommandLine: 'pm2 serve /home/site/wwwroot/dist --no-daemon --spa'
      alwaysOn: true
    }
  }
}

resource appServiceWebSettings 'Microsoft.Web/sites/config@2022-03-01' = {
  parent: appService
  name: 'appsettings'
  kind: 'string'
  properties: {
    RANDOM_ENV_VAR: 'this is an env variables'
  }
}
