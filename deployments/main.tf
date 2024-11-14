module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  suffix = [
    local.tags.owner,
    local.tags.project,
    terraform.workspace,
  ]
}

resource "azurerm_resource_group" "main" {
  name     = module.naming.resource_group.name
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "main" {
  name                = module.naming.virtual_network.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]

  tags = local.tags
}

resource "azurerm_subnet" "main" {
  count                = var.subnet_count
  name                 = format("%s-%d", module.naming.subnet.name, count.index)
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.${count.index}.0/24"]
}
