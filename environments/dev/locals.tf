locals {

  common_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "AzureLandingZone"
  }

  vms = {
    vm01 = {
      vm_size        = "Standard_B2s"
      subnet_name    = "app-subnet"
      data_disk_size = 128
      lun            = 0
    }

    vm02 = {
      vm_size        = "Standard_B2s"
      subnet_name    = "db-subnet"
      data_disk_size = 64
      lun            = 0
    }

    vm03 = {
      vm_size        = "Standard_B2s"
      subnet_name    = "web-subnet"
      data_disk_size = 64
      lun            = 0
    }
  }
}

