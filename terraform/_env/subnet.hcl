locals {
  env_vars          = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  aws_region        = local.env_vars.locals.region
  source_base_url   = "github.com/cloudposse/terraform-aws-dynamic-subnets.git"
}

dependency "vpc" {
  config_path = find_in_parent_folders("vpc")
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

inputs = {
    vpc_id                = "${dependency.vpc.outputs.vpc_id}"
    vpc_cidr_block        = "${dependency.vpc.outputs.vpc_cidr_block}"
    igw_id                = ["${dependency.vpc.outputs.igw_id}"]
    nat_gateway_enabled   = true
    nat_instance_enabled  = false
    tags                  = { "kubernetes.io/cluster/${dependency.label.outputs.id}" = "shared" }
    context               = dependency.label.outputs.context
}