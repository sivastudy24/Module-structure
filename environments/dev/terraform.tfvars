resource_group_name = "rg-dev-eastus"

location = "East US"

vnet_name = "vnet-dev-eastus"

address_space = [
  "10.10.0.0/16"
]

subnets = {
  app-subnet = "10.10.1.0/24"
  web-subnet = "10.10.2.0/24"
  db-subnet  = "10.10.3.0/24"
}

vm_name = "app01"

vm_size = "Standard_B2s"
