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
