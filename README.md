# RELIANOID Enterprise Edition - Azure Terraform Deployment

This Terraform configuration deploys the **RELIANOID Enterprise Edition** virtual machine from the [Azure Marketplace](https://azuremarketplace.microsoft.com) using official Marketplace image identifiers. It automatically configures:

- Virtual Network and Subnet
- Network Interface with Public IP
- Network Security Group with port rules (SSH `22`, Web GUI `444`)
- A Virtual Machine based on the published RELIANOID image
- SSH Key access for secure login

---

## Quick Start
## Clone this repository
- git clone https://git.relianoid.com/Relianoid/terraform-azurerm-relianoid-Enterprise
- cd terraform-azurerm-relianoid-Enterprise

## Generate an SSH key (if not already)
- ssh-keygen -t rsa -b 4096 -f id_rsa

## Copy your public key to the project folder
- cp ~/.ssh/id_rsa.pub ./id_rsa.pub

## Edit terraform.tfvars
- subscription_id = "your-subscription-id"
- ssh_public_key  = file("id_rsa.pub")

## Deploy
- terraform init
- terraform plan
- terraform apply

## Access your VM
- ssh -i id_rsa azureuser@public-ip
---

##  Prerequisites

- Terraform CLI installed (v1.4+ recommended)
- An Azure account with permission to deploy resources
- Valid Azure subscription ID (set in terraform.tfvars)
- A valid SSH key pair (`id_rsa`, `id_rsa.pub`) Generate using `ssh-keygen`

---

## Files Overview

- `main.tf` - Core infrastructure resources
- `variables.tf` - Input variable definitions
- `terraform.tfvars` - User-defined values (filled by user)
- `README.md` - This documentation

---

## Marketplace Image Info

```hcl
publisher = "67723d6e-d0d2-4497-9ea1-3fd1d370756a"
offer     = "relianoid-Enterprise-edition"
sku       = "relianoid-Enterprise-edition"
version   = "latest"

```
## SSH Key Setup

Before running Terraform, you must have an SSH key pair for secure VM access.

1. Generate an SSH key if you don’t already have one:

   Linux/Mac:
   ssh-keygen -t rsa -b 4096 -f id_rsa
   
- Copy the generated id_rsa.pub file into this project folder.
- Keep the private key (id_rsa) safe — you will need it to SSH into the VM.
- Terraform will automatically use id_rsa.pub when creating the VM.

## Deployment
Initialize Terraform and apply:
```

terraform init
terraform plan
terraform apply
 ```
## Access the VM
 ```
Once deployed, SSH into the VM:


ssh -i ~/.ssh/id_rsa azureuser@public-ip
```
## Outputs 

After deployment, Terraform will display the following outputs:

| Output Name           | Description |
|-----------------------|-------------|
| `vm_public_ip`        | The public IP address assigned to the Azure VM. |
| `vm_private_ip`       | The private IP address of the Azure VM within the VNet. |
| `resource_group_name` | The name of the Azure Resource Group containing the VM. |
| `vm_name`             | The name assigned to the Azure VM. |
| `image_id`            | The image reference used to create the VM in `publisher/offer/sku:version` format. |

You can retrieve outputs with:
- terraform output

Or to get a specific value:

- terraform output vm_public_ip

## Destroy Resources

To delete everything:

```
terraform destroy
```

---
⚠️ You must replace the subscription ID(from tfvars file) and provide your SSH key.