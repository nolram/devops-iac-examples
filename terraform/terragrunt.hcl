locals {
  account_vars   = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars    = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment    = local.account_vars.locals.environment
  account_id     = local.region_vars.locals.region
  aws_region     = get_env("AWS_REGION", "us-east-1")
  bucket         = get_env("BUCKET_STATES")
}

remote_state {
    backend = "s3"
    config = {
        bucket         = "terraform-tfstates-examples"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
    }
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
        provider "aws" {
            allowed_account_ids = ["${local.account_id}"]
            region              = "${local.aws_region}"
        }
    EOF
}
