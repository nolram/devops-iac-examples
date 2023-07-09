locals {
    source_base_url       = "tfr:///Azure/vnet/azurerm//"
}

dependency "label" {
  config_path = find_in_parent_folders("label")
}

inputs = {
    tags     = dependency.label.tags
}