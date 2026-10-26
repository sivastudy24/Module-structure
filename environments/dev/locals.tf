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
    }

    web01 = {
      vm_size = "Standard_B2s"
      subnet  = "web-subnet"
    }

    db01 = {
      vm_size = "Standard_B2s"
      subnet  = "db-subnet"
    }
  }
}