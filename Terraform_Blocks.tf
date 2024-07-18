##############################################################################################
# Block-1 Terraform Setting Block

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }
}

###################################
# Block-2 Provider Block -Authentication Purpose

provider "azurerm" {
  features {
    
  }
  # client_id = "b8ec3f9c-9a83-43bc-8eab-766d79fbde38"
  #client_secret = "7de5cb85-bc4a-486c-abaa-5f5f504f55c0"
  # subscription_id = "640a92af-0f46-4833-8247-eb4866a45593"
  #tenant_id = "0f335e23-e814-46ca-b4e0-57a4f4fd2e00"
}

########################################################
# Block- 3 Resource Block

# create a Resource group

resource "azurerm_resource_group" "sk-rg-01" {
  name     = "sk-rg-01"
  location = "West Europe"

}


# Create a virtual network

resource "azurerm_virtual_network" "vnet01" {
  name = "vnet01"
  resource_group_name = azurerm_resource_group.sk-rg-01.name #implicit dependency
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.sk-rg-01.location #implicit Dependency
  #depends_on = [ azurerm_resource_group.sk-rg-01 ] # Explicit Dependency
  
}

