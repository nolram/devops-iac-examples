locals {
  env_vars = read_terragrunt_config("../../env.hcl")
  environment = local.env_vars.locals.environment

  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location = local.region_vars.locals.location
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../../../_env/vnet.hcl"
  expose = true
}


dependency "label" {
  config_path = "../../global/label"
}

dependency "resource_group" {
  config_path = "../../global/resource_group"
}

terraform {
  source = "${include.env.locals.source_base_url}?version=4.1.0"
}

inputs = {
  vnet_name           = "vnet-${local.environment}-${local.location}"
  resource_group_name = dependency.resource_group.outputs.vnet_resource_group_name
  address_space       = ["10.0.0.0/16"]
  vnet_location       = local.location
  use_for_each        = false

  tags                = dependency.label.outputs.tags
}