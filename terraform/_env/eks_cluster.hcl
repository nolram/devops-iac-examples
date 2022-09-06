locals {
  env_vars              = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  aws_region            = local.env_vars.locals.region
  source_base_url       = "github.com/cloudposse/terraform-aws-eks-cluster.git"
  kubernetes_version    = "1.21"
}

dependency "vpc" {
  config_path = find_in_parent_folders("vpc")
}

dependency "subnet" {
  config_path = find_in_parent_folders("subnet")
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

inputs = {
  vpc_id                = dependency.vpc.outputs.vpc_id
  subnet_ids            = dependency.subnet.outputs.public_subnet_ids

  region                = local.aws_region

  kubernetes_version    = local.kubernetes_version
  oidc_provider_enabled = true

  context               = dependency.label.outputs.context
}