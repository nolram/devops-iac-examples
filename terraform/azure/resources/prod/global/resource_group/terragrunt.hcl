locals {
  resource_group_name = "vnet-example"
  env_vars            = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location            = local.env_vars.locals.location
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vnet_resource_group_name = local.resource_group_name
  location = local.location
}