output "storage_account" {
  value = module.remote_state_storage_account.storage_account
}

output "storage_container" {
  value = azurerm_storage_container.sc
}