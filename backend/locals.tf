locals {
  backend_config = {
    resource_group_name  = "erbj-dd-backend"
    storage_account_name = "sadriftdetectionerbj"
    container_name       = "terraformstate"
    key                  = "driftdetection.tfstate"
  }

  tags = {
    owner = "erbj"
  }
}