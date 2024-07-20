rgname = "azlabs-az-dev-rg-simplepro02"
rglocation = "westeurope"
vnetname = "azlabs-az-dev-vnet-simplepro02"
vnetaddressspace = ["10.0.0.0/16", "192.168.0.0/16"]
#number_of_subnets = 5
publicipaddressname = "azlabs-az-dev-pip-simplepro02"
create_publicipaddress = true
common_tags = {
    environment = "Production"
    Owner = "azurelabs"
    contact = "info@azurelabs.in"  
    DeploymentType = "Terraform"
    CostCenterCode = "007"
  }

