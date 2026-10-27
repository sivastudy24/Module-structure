locals {

  common_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "AzureLandingZone"
  }

  vms = {
    vm01 = {
      vm_size = "Standard_B2s"
      subnet  = "app-subnet"
    }

    vm02 = {
      vm_size = "Standard_B2s"
      subnet  = "web-subnet"
    }

    vm03 = {
      vm_size = "Standard_B2s"
      subnet  = "db-subnet"
    }
  }
}



