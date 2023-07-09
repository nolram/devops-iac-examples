locals {
    source_base_url       = "tfr:///Azure/vnet/azurerm//"
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

dependency "resource_group" {
  config_path = find_in_parent_folders("resource_group")

  mock_outputs = {
    vnet_resource_group_name = "rg-terragrunt-mock-001" # This is the name of the resource group that the vnet will be created in
  }
  mock_outputs_merge_with_state = true
}

inputs = {
    tags     = dependency.label.tags
    resource_group_name = dependency.resource_group.outputs.vnet_resource_group_name
}