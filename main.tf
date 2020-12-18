data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "remote_state_storage_account" {
  source = "git::https://github.com/nextmetaphor/terraform-azure-storage-account.git"
  location = var.location
  resource_group_name = var.resource_group_name
  storage_account_name_prefix = "tfstate"
}

resource "azurerm_storage_container" "sc" {
  name = var.storage_container_name
  storage_account_name = module.remote_state_storage_account.storage_account.name
  container_access_type = "private"
}