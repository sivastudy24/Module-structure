terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-vm"
    storage_account_name = "stbluegene"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
    use_azuread_auth     = true
  }
}
