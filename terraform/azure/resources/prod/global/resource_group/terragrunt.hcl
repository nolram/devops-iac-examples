locals {
  resource_group_name = "vnet-example"
  env_vars            = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  location            = local.env_vars.locals.location

}


include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../../../_env/resource_group.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_base_url}"
}

inputs = {
  vnet_resource_group_name = local.resource_group_name
  location = local.location
}