output "vm_id" {
  description = "The ID of the Azure VM"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "vm_private_ip" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "location" {
  description = "The Azure region where the VM is deployed"
  value       = azurerm_linux_virtual_machine.vm.location
}

output "image_id" {
  description = "The image reference used to create the VM"
  value       = "${azurerm_linux_virtual_machine.vm.source_image_reference[0].publisher}/${azurerm_linux_virtual_machine.vm.source_image_reference[0].offer}/${azurerm_linux_virtual_machine.vm.source_image_reference[0].sku}:${azurerm_linux_virtual_machine.vm.source_image_reference[0].version}"
}


output "ssh_command" {
  description = "SSH command to connect to the Azure VM"
  value       = "ssh -i id_rsa ${var.admin_username}@${azurerm_public_ip.public_ip.ip_address}"
}
