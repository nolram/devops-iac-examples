
include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path   = "${get_terragrunt_dir()}/../../../../_env/ecr_public.hcl"
  expose = true
}

terraform {
  source = "${include.env.locals.source_base_url}?ref=0.1.0"
}

inputs = {
  name                   = "project_draw"
  repository_configs     = [
    {
      name              = "project_draw"
      description       = "The repository for the project_draw image"
      about_text        = file("about.md")
      usage_text        = file("usage.md")
      logo_image_blob   = null
      architectures     = ["AMD64"]
      operating_systems = ["Linux"]
    },
  ]
}