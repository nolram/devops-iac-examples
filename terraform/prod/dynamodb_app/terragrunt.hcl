
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../_env/dynamodb.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_base_url}?ref=0.29.5"
}

inputs = {
  hash_key                     = "pk"
  range_key                    = "sk"
  autoscale_write_target       = 50
  autoscale_read_target        = 50
  autoscale_min_read_capacity  = 5
  autoscale_max_read_capacity  = 20
  autoscale_min_write_capacity = 5
  autoscale_max_write_capacity = 20
  enable_autoscaler            = false
}