
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../_env/subnet.hcl"
  expose = true
}


terraform {
  source = "${include.env.locals.source_base_url}?ref=v2.0.2"
}


inputs = {
  availability_zones   =  ["${include.env.locals.aws_region}a", "${include.env.locals.aws_region}b"]
}