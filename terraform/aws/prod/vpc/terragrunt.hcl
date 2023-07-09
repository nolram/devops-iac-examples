
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../_env/vpc.hcl"
  expose = true
}


terraform {
  source = "${include.env.locals.source_base_url}?ref=1.1.0"
}


inputs = {
  ipv4_primary_cidr_block = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = false
}