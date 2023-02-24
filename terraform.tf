terraform {
  required_version = ">= 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.44"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.4"
    }
  }

  cloud {
    organization = "giutt-org"

    workspaces {
      name = "peanubudget-workspace"
    }
  }
}

provider "azurerm" {
  features {}
}
