locals {
    source_base_url       = "tfr:///Azure/vnet/azurerm//"
}

inputs = {
  address_space       = ["10.0.0.0/16"]
  # subnet_prefixes     = ["10.0.1.0/26", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  # subnet_names        = ["AzureBastionSubnet", "Management", "Tools", "Workloads"]
}