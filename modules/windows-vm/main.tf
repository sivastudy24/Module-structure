resource "azurerm_network_interface" "this" {

  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "this" {

  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "data_disk" {

  for_each = var.data_disks

  name                 = "${var.vm_name}-${each.key}"
  location             = var.location
  resource_group_name  = var.resource_group_name

  storage_account_type = "Standard_LRS"
  create_option        = "Empty"

  disk_size_gb = each.value.size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk" {

  for_each = var.data_disks

  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.this.id

  lun     = each.value.lun
  caching = "ReadWrite"
}
