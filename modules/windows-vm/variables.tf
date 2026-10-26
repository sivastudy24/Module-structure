variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}

variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "data_disks" {
  type = map(object({
    size_gb = number
    lun     = number
  }))
  default = {}
}