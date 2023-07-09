locals {
  resource_group_name = "vnet-example"
  env_vars            = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location            = local.env_vars.locals.location
  source_base_url     = "../../../../modules/resource_group"
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

inputs = {
  vnet_resource_group_name = local.resource_group_name
  location = local.location
  tags = dependency.label.outputs.tags
}