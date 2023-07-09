
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../_env/label.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_base_url}?ref=0.25.0"
}