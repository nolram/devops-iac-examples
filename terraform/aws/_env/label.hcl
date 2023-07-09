locals {
  # Load the relevant env.hcl file based on where terragrunt was invoked. This works because find_in_parent_folders
  # always works at the context of the child configuration.
  env_vars          = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment       = local.env_vars.locals.environment
  product_name      = local.env_vars.locals.product_name
  namespace         = local.env_vars.locals.namespace
  source_base_url   = "github.com/cloudposse/terraform-null-label.git"
}

inputs = {
    namespace  = local.namespace
    name       = local.product_name
    stage      = local.environment
    delimiter  = "-"
}