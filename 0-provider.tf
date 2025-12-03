# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DevSecOps-state-file-mgmt" # Can also be set via `ARM_ACCESS_KEY` environment variable.
    storage_account_name = "devsecopsstatefilemgmt"    # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "devsecopsstatefilemgmt"    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "development.tfstate"       # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}