# RELIANOID Enterprise Edition - Azure Terraform Module

This guide explains how to deploy the RELIANOID Enterprise Edition virtual machine on **Microsoft Azure** using the official Terraform module from the Terraform Registry.

---

## What this module provisions automatically
- Resource Group  
- Virtual Network + Subnet  
- Network Security Group (allowing SSH 22, Web GUI 444)  
- Public IP + NIC  
- Virtual Machine using the RELIANOID Enterprise Edition image from Azure Marketplace  

---

## Prerequisites

### 1. Install Terraform
Download and install Terraform for your OS.  
```bash
terraform -version
```

### 2. Install Azure CLI
Download and install the Azure CLI.  
Login to your Azure account:
```bash
az login
```

### 3. SSH Key Pair
You’ll need an SSH key to access the VM. If you don’t already have one:  
```bash
ssh-keygen -t rsa -b 4096 -f id_rsa
```
This creates **id_rsa** (private key) and **id_rsa.pub** (public key). Keep the keys in the same directory where Terraform files are stored.

---

## Step 1: Find the Terraform Module
1. Go to [Terraform Registry](https://registry.terraform.io/).  
2. Search for `relianoid-enterprise`.  
3. Select **see all** or the official module `relianoid/relianoid-enterprise/azurerm`.  

---

## Step 2: Create a Project Folder
```bash
mkdir relianoid-azure
cd relianoid-azure
```

---

## Step 3: Create Configuration Files

Create three files: `main.tf`, `variables.tf`, and `terraform.tfvars` with the following content:

**main.tf**
```hcl
module "relianoid-enterprise" {
  source              = "relianoid/relianoid-enterprise/azurerm"
  version             = "1.0.1"
  subscription_id     = var.subscription_id
  public_ssh_key_path = "${path.module}/id_rsa.pub"
}
```

**terraform.tfvars**
```hcl
subscription_id = "Your Subscription_ID"
```

**variables.tf**
```hcl
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
```

📌 **Notes:**  
- The module provisions all required Azure resources internally: Resource Group, VNet, Subnet, NSG, VM, NIC, Public IP.  
- By default, it uses the RELIANOID Enterprise Edition image from **Azure Marketplace**.  

---

## Step 4: Initialize & Deploy

Run the following commands:
```bash
terraform init
terraform plan
terraform apply
```
Confirm with `yes` when prompted.

---

## Step 5: Access the RELIANOID VM

After deployment, Terraform outputs the public IP address.  

Connect using SSH:
```bash
ssh -i id_rsa azureuser@<instance_public_ip>
```

Open the Web GUI in your browser:
```
https://<public-ip>:444
```

---

## Outputs

Terraform provides:  

| Output Name         | Description            |
|---------------------|------------------------|
| `instance_id`       | The ID of the Azure VM |
| `instance_public_ip`| The public IP of the VM |
| `instance_private_ip`| The private IP in the VNet |

---

## Destroy Resources

To delete everything created:
```bash
terraform destroy
```

---

⚠️ **Important Notes:**  
- Make sure you’ve accepted the Azure Marketplace terms for the RELIANOID image before deployment.  
- Always secure your private key (`id_rsa`).  
