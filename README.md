# terraform-azure-remote-state
TODO

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