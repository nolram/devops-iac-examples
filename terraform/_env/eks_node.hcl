locals {
    env_vars                    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    aws_region                  = local.env_vars.locals.region
    source_base_url             = "github.com/cloudposse/terraform-aws-eks-node-group.git"
    instances_types             = ["t3.small", "t3a.small", "t3.micro", "t3a.micro"]
    min_size                    = 1
    max_size                    = 3
    desired_size                = 2
    cluster_autoscaler_enabled  = true

}

dependency "vpc" {
    config_path = find_in_parent_folders("vpc")
}

dependency "subnet" {
    config_path = find_in_parent_folders("subnet")
}

dependency "eks_cluster" {
    config_path = find_in_parent_folders("eks_cluster")
}

dependency "label" {
    config_path = find_in_parent_folders("label")
}

inputs = {

    instance_types              = local.instances_types
    subnet_ids                  = dependency.subnet.outputs.public_subnet_ids
    min_size                    = local.min_size
    desired_size                = local.desired_size
    max_size                    = local.max_size
    cluster_name                = dependency.eks_cluster.outputs.eks_cluster_id
    create_before_destroy       = true
    # kubernetes_version          = dependency.eks_cluster.outputs.eks_cluster_version

    # Enable the Kubernetes cluster auto-scaler to find the auto-scaling group
    cluster_autoscaler_enabled  = local.cluster_autoscaler_enabled

    context                     = dependency.label.outputs.context
}