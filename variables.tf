variable "resource_group_name" {
  description = "the existing azure resource group name"
  type        = string
}

variable "location" {
  description = "location in which the remote state storage will be created"
  type        = string
}

