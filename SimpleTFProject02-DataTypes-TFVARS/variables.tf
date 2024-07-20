#terraform plan -out "./main.tfplan" -var="rgname=azlabs-az-dev-rg-simplepro02" -var="rglocation=WestEurope" -var="vnetname=azlabs-az-dev-vnet-simplepro02" -var="number_of_subnets=2"

#Resource Group Variables

########------String------########
variable "rgname" {
  type = string
  default = "azlabs-az-dev-rg-simplepro02"
  description = "resource group name"
}

########------String------########
variable "rglocation" {
  type = string
  default = "westeurope"
  description = "resource group location"
}

#Virtual Network Variables

########------String------########
variable "vnetname" {
  type = string
  default = "azlabs-az-dev-vnet-simplepro02"
}

variable "vnetaddressspace" {
  type = list(string)
  default = ["10.0.0.0/16", "192.168.0.0/16"]
  #"10.0.0.0/16"
}

########------Number------########
variable "number_of_subnets" {
  type = number
  default = 6 #0,1,2
}

variable "publicipaddressname" {
  type = string
  default = "azlabs-az-dev-pip-simplepro02"
}

variable "create_publicipaddress" {
  type = bool
  #default = true
  description = "Controls whether publicipaddress should be created or not"
}

variable "common_tags" {
  type = map

  # default = {
  #   environment = "Production"
  #   Owner = "azurelabs"
  #   contact = "info@azurelabs.in"  
  #   DeploymentType = "Terraform"
  # }

}