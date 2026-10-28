locals {

  common_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "AzureLandingZone"
  }
  vms = {
    /*vm01 = {
      vm_size = "Standard_B2s"
      subnet  = "web-subnet"
    }*/
  }
}


