terraform {
    required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.64.0"
    }
    azuread = {
        source = "hashicorp/azuread"
        version = "2.39.0"
    }
    }
}

provider "azurerm" {
    skip_provider_registration = "true"
    features {
    resource_group {
        prevent_deletion_if_contains_resources = true
    }
    }
}

provider "azuread" {
}