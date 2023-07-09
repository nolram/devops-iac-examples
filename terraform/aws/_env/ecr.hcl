locals {
  source_base_url             = "github.com/cloudposse/terraform-aws-ecr.git"
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

dependency "label" {
    config_path = find_in_parent_folders("label")
}

inputs = {
  image_tag_mutability        = "MUTABLE"
  scan_images_on_push         = true
  max_image_count             = 20
  context                     = dependency.label.outputs.context
}