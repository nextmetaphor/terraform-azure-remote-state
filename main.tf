data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "random_id" "randomID" {
  keepers = {
    resource_group = data.azurerm_resource_group.rg.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "sa" {
  name                     = "diag${random_id.randomID.hex}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
  name = "tfstate"
  storage_account_name = azurerm_storage_account.sa.name
  container_access_type = "private"
}