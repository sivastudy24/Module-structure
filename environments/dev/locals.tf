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

    app02 = {
      vm_size = "Standard_B2s"
      subnet  = "app-subnet"
    }

    app03 = {
      vm_size = "Standard_B2s"
      subnet  = "web-subnet"
    }

    sql01 = {
      vm_size = "Standard_B2s"
      subnet  = "db-subnet"
    }
  }
}
