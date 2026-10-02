terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-DO-NOT-DELETE"
    storage_account_name = "fleetstorage1"
    container_name       = "container1"
    key                  = "aks-cluster.tfstate"
  }
}

provider "azurerm" {
  features {}
}