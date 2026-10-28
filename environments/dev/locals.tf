locals {

  common_tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Project     = "AzureLandingZone"
  }
  vms = {
    vm01 = {
      vm_name     = "dev-vm-01"
      size        = "Standard_B2s"
      subnet_name = "web-subnet"
  }
}
}


