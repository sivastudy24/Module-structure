module "resource_group" {

  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

module "network" {

  source = "../../modules/network"

  vnet_name = var.vnet_name

  rg_name = module.resource_group.name

  location = module.resource_group.location

  address_space = var.address_space

  subnets = var.subnets

  tags = local.common_tags
}

module "windows_vm" {

  source = "../../modules/windows-vm"

  vm_name = var.vm_name

  vm_size = var.vm_size

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  subnet_id = module.network.subnet_ids["app-subnet"]

  admin_username = var.admin_username
  admin_password = var.admin_password

  tags = local.common_tags
}
##