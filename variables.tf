variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "relianoid-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "relianoid-vnet"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "relianoid-subnet"
}

variable "public_ip_name" {
  description = "Name of the Public IP"
  type        = string
  default     = "relianoid-public-ip"
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
  default     = "relianoid-nic"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "relianoid-vm"
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "public_ssh_key_path" {
  description = "Path to SSH public key file"
  type        = string
}
