# terraform-azure-remote-state
[Terraform](https://www.terraform.io) module to create a storage account and container for [Terraform remote state in Azure](https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage).

Note that the `terraform-azure-remote-state` module will use local and not remote state; the resources created here are to be used by subsequent modules. For more information about using the created resources, refer to the [`azurerm` backend documentation](https://www.terraform.io/docs/backends/types/azurerm.html). 

## Install
This module requires that the following are installed locally:
* [Docker](https://www.docker.com/get-started)
* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

It also requires that there is an existing [Azure Resource Group](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal) into which to place the VNet components.

## Usage

### Log Into Azure
```bash
docker run -it -v $HOME/.azure:/root/.azure mcr.microsoft.com/azure-cli az login
```

### Create the Remote State Storage
```bash
# initialise 
terraform init

# create a terraform plan file from the provided variables
# NOTE: the existing Azure resource group will need to be provided at the command-line, or manually added to the tfvars file 
terraform plan -var-file="variables.tfvars" -out tfplan

# apply the plan, creating the Azure VNet resources
terraform apply "tfplan"
```

### Destroy the Remote State Storage
```bash
terraform destroy -var-file="variables.tfvars"
```

## Licence
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This project is licenced under the terms of the [Apache 2.0 License](LICENCE.md) licence.