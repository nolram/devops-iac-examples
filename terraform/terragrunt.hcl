locals {
    env_vars       = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    environment    = local.env_vars.locals.environment
    aws_region     = local.env_vars.locals.region
    account_id     = get_env("ACCOUNT_ID")
    bucket         = get_env("BUCKET_STATES")
    access_key     = get_env("ACCESS_KEY")
    secret_key     = get_env("SECRET_KEY")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    terraform {
    backend "s3" {
            bucket         = "${local.bucket}"
            key            = "${path_relative_to_include()}/terraform.tfstate"
            region         = "${local.aws_region}"
            encrypt        = true
        }
    }
    EOF
}

generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
        provider "aws" {
            allowed_account_ids = ["${local.account_id}"]
            region              = "${local.aws_region}"
            access_key          = "${local.access_key}"
            secret_key          = "${local.secret_key}"
        }
    EOF
}
