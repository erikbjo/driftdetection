terraform {
  required_version = "~>1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "erbj-dd-backend"
    storage_account_name = "sadriftdetectionerbj"
    container_name       = "terraformstate"
    key                  = "driftdetection.tfstate"
  }
}