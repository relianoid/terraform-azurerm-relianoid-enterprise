# RELIANOID Enterprise Edition - Azure Terraform Deployment

This Terraform configuration deploys the **RELIANOID Enterprise Edition** virtual machine from the [Azure Marketplace](https://azuremarketplace.microsoft.com) using official Marketplace image identifiers. It automatically configures:

- Virtual Network and Subnet
- Network Interface with Public IP
- Network Security Group with port rules (SSH `22`, Web GUI `444`)
- A Virtual Machine based on the published RELIANOID image
- SSH Key access for secure login

---

##  Prerequisites

- Terraform CLI installed (v1.4+ recommended)
- An Azure account with permission to deploy resources
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


ssh -i ~/.ssh/id_rsa azureuser@<public-ip>
```

## Destroy Resources

To delete everything:

```
terraform destroy
```

---
⚠️ You must replace the subscription ID(from tfvars file) and provide your SSH key.