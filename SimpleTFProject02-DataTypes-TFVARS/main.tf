resource "azurerm_resource_group" "az_resource_group" {
  name     = var.rgname
  location = var.rglocation
  tags = var.common_tags    
}


resource "azurerm_virtual_network" "az_virtual_network" {
  name                = var.vnetname
  location            = var.rglocation
  resource_group_name = var.rgname
  address_space       = var.vnetaddressspace
  depends_on = [ azurerm_resource_group.az_resource_group ] #Explicit Dependency
  tags = var.common_tags
}


resource "azurerm_subnet" "az_subnet" {
  
  count = var.number_of_subnets

  name                 = "subnet-${count.index}"
  resource_group_name  = var.rgname
  virtual_network_name = var.vnetname
  address_prefixes     = ["192.168.${count.index}.0/24"]
  depends_on = [ 
    azurerm_resource_group.az_resource_group,
    azurerm_virtual_network.az_virtual_network
   ] #Explicit Dependency
}

resource "azurerm_public_ip" "az_public_ip" {
 
  count = var.create_publicipaddress ? 1:0 
  name                = var.publicipaddressname
  resource_group_name = azurerm_resource_group.az_resource_group.name
  location            = azurerm_resource_group.az_resource_group.location
  allocation_method   = "Static"
  tags = var.common_tags
}

# resource "azurerm_subnet" "az_subnet_0" {
#   name                 = "subnet-0"
#   resource_group_name  = var.rgname
#   virtual_network_name = var.vnetname
#   address_prefixes     = ["192.168.0.0/24"]
#   depends_on = [ 
#     azurerm_resource_group.az_resource_group,
#     azazurerm_virtual_network.az_virtual_network
#    ] #Explicit Dependency
# }

# resource "azurerm_subnet" "az_subnet_1" {
#   name                 = "subnet-1"
#   resource_group_name  = var.rgname
#   virtual_network_name = var.vnetname
#   address_prefixes     = ["192.168.1.0/24"]
#   depends_on = [ 
#     azurerm_resource_group.az_resource_group,
#     azazurerm_virtual_network.az_virtual_network
#    ] #Explicit Dependency
# }