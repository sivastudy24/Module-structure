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

  for_each = local.vms

  vm_name   = each.key
  vm_size   = each.value.vm_size
  subnet_id = module.network.subnet_ids[each.value.subnet]

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  admin_username = var.admin_username
  admin_password = var.admin_password

  data_disks = try(each.value.data_disks, {})

  tags = local.common_tags
}
###