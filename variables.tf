variable "resource_group_name" {
  description = "the existing azure resource group name"
  type        = string
}

variable "location" {
  description = "location in which the remote state storage will be created"
  type        = string
}

variable "storage_account_name_prefix" {
  description = "prefix for the storage account name"
  type = string
  default = "tfstate"
}

variable "storage_container_name" {
  description = "storage container name"
  type = string
  default = "tfstate"
}