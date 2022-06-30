locals {
  source_base_url             = "github.com/cloudposse/terraform-aws-ecr-public.git"
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

dependency "label" {
    config_path = find_in_parent_folders("label")
}

inputs = {
  context                     = dependency.label.outputs.context
}