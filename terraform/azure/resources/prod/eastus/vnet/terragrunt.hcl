locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment = local.env_vars.locals.environment

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location = local.region_vars.locals.location
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../../_env/vnet.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_base_url}?version=4.1.0"
}

inputs = {
  vnet_name           = "vnet-spoke-${local.environment}-${local.location}-001"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/26", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  subnet_names        = ["AzureBastionSubnet", "Management", "Tools", "Workloads"]
  location            = local.location

  tags = {
    environment = local.environment
  }
}