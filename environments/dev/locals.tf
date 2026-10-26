locals {

  common_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "AzureLandingZone"
  }

  vms = {

    app01 = {
      vm_size = "Standard_B2s"
      subnet  = "app-subnet"

      data_disks = {
        disk1 = {
          size_gb = 64
          lun     = 0
        }

        disk2 = {
          size_gb = 128
          lun     = 1
        }
      }
    }

    web01 = {
      vm_size = "Standard_B2s"
      subnet  = "web-subnet"

      data_disks = {}
    }

    db01 = {
      vm_size = "Standard_B2s"
      subnet  = "db-subnet"

      data_disks = {}
    }
  }
}