# Production-Grade Azure Infrastructure & Application Automation

This project demonstrates a production-style DevOps workflow for provisioning and automating a 3-tier application infrastructure on Microsoft Azure using Infrastructure as Code and configuration management.

## Technology Stack

* Microsoft Azure
* Terraform
* Spacelift
* Ansible
* GitHub
* Nginx
* Node.js / Express
* PostgreSQL
* Azure Key Vault

## Architecture

```text
                         GitHub
                            │
                            ▼
                        Spacelift
                            │
                            ▼
                         Terraform
                            │
                            ▼
                          Azure
                            │
                 ┌──────────┴──────────┐
                 │                     │
          Resource Group              Key Vault
                 │
                 ▼
          Virtual Network
          10.0.0.0/16
                 │
        ┌────────┴─────────┐
        │                  │
        ▼                  ▼
   Web Subnet         Private Subnet
   10.0.1.0/24        10.0.2.0/24
        │                  │
        ▼            ┌─────┴─────┐
     Web VM          ▼           ▼
     Nginx         App VM      DB VM
                   Node.js    PostgreSQL
```

## Network Architecture

The Azure Virtual Network uses the address space:

```text
10.0.0.0/16
```

### Web Subnet

```text
10.0.1.0/24
```

The Web subnet contains the public-facing Web VM running Nginx.

The Web VM has a static public IP address and accepts:

* HTTP — Port 80
* HTTPS — Port 443
* SSH — Port 22

### Private Subnet

```text
10.0.2.0/24
```

The Private subnet contains:

* Application VM
* Database VM

These servers do not have public IP addresses.

## 3-Tier Application Architecture

### Web Tier

```text
Web VM
Nginx
```

Responsibilities:

* Receive incoming HTTP/HTTPS requests
* Act as the reverse proxy
* Forward application requests to the Node.js application server

### Application Tier

```text
App VM
Node.js / Express
Port: 5000
```

Responsibilities:

* Run the backend application
* Process application requests
* Communicate with the PostgreSQL database

### Database Tier

```text
DB VM
PostgreSQL
Port: 5432
```

Responsibilities:

* Store application data
* Accept database connections only from the application tier

## Traffic Flow

The application follows a controlled network flow:

```text
Internet
   │
   │ HTTP :80
   │ HTTPS :443
   ▼
Web VM
Nginx
   │
   │ TCP :5000
   ▼
App VM
Node.js / Express
   │
   │ TCP :5432
   ▼
DB VM
PostgreSQL
```

## Network Security Groups

Three separate Network Security Groups are used to control traffic between the tiers.

### Web NSG

Allows:

```text
Internet → Web VM
TCP 80
TCP 443
TCP 22
```

### App NSG

Allows traffic from the Web subnet:

```text
Web Subnet → App VM
TCP 5000
```

SSH access is restricted to the Web subnet in the current demo configuration.

### Database NSG

Allows database traffic from the private application network:

```text
Private Subnet → DB VM
TCP 5432
```

SSH access is also restricted to the private subnet in the current configuration.

## Azure Key Vault

Azure Key Vault is included for secure management of sensitive configuration and application secrets.

The Key Vault is configured with:

* Standard SKU
* Azure RBAC authorization
* Soft delete
* 7-day soft-delete retention
* Purge protection
* Network access control
* Default network action: Deny

The planned purpose of Key Vault is to securely manage items such as:

```text
Database credentials
Application secrets
API keys
Certificates
Encryption keys
```

## Infrastructure as Code

Terraform is used to provision the Azure infrastructure.

The Terraform configuration is organized into reusable modules:

```text
terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars
│
└── modules/
    ├── resource-group/
    ├── network/
    ├── security/
    ├── compute/
    └── keyvault/
```

### Terraform Modules

| Module         | Responsibility                      |
| -------------- | ----------------------------------- |
| Resource Group | Creates the Azure Resource Group    |
| Network        | Creates VNet and subnets            |
| Security       | Creates Network Security Groups     |
| Compute        | Creates Web, App and DB VMs         |
| Key Vault      | Creates and secures Azure Key Vault |

## Infrastructure Deployment Workflow

Terraform is developed and maintained in GitHub.

The intended deployment workflow is:

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
Spacelift
    │
    ▼
Terraform Plan
    │
    ▼
Terraform Apply
    │
    ▼
Azure Infrastructure
```

Terraform state and execution will be managed through Spacelift rather than performing production infrastructure deployment directly from the local machine.

## Configuration Management

After the infrastructure is provisioned, Ansible will be used to configure the Azure virtual machines.

The planned configuration flow is:

```text
Azure VMs
   │
   ▼
Ansible
   │
   ├── Configure Nginx
   ├── Configure Node.js
   ├── Configure PostgreSQL
   ├── Apply security configuration
   └── Deploy application
```

## Security

The project follows several security practices:

* SSH key-based authentication
* Password authentication disabled on VMs
* Network segmentation using subnets
* Network Security Groups
* Private application and database servers
* Azure Key Vault
* RBAC-based Key Vault authorization
* Key Vault purge protection
* Key Vault soft delete
* Secrets excluded from Git
* Terraform variable files excluded from Git

## Project Goals

The main goals of this project are to:

* Provision Azure infrastructure using Terraform
* Build reusable Terraform modules
* Manage Terraform workflows using Spacelift
* Configure Azure servers using Ansible
* Deploy a 3-tier web application
* Implement network segmentation
* Implement infrastructure security
* Manage secrets securely
* Demonstrate Infrastructure as Code
* Demonstrate Configuration Management
* Build a production-style DevOps workflow

## Project Status

### Completed

* Azure provider configuration
* Terraform project structure
* Resource Group module
* Network module
* Security / NSG module
* Compute module
* Azure Key Vault module
* Terraform outputs
* Terraform validation
* Terraform plan

Current Terraform plan:

```text
18 resources to add
0 resources to change
0 resources to destroy
```

### Next Steps

* Prepare Terraform configuration for GitHub
* Configure secure Terraform variables
* Connect GitHub repository to Spacelift
* Configure Spacelift Terraform Stack
* Deploy infrastructure through Spacelift
* Configure Azure VMs using Ansible
* Install and configure Nginx
* Install and configure Node.js
* Install and configure PostgreSQL
* Deploy the application
* Add health checks and monitoring
* Implement CI/CD automation

## Project Structure

```text
azure-ansible-spacelift/
│
├── .github/
│   └── workflows/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── terraform.tfvars
│   │
│   └── modules/
│       ├── resource-group/
│       ├── network/
│       ├── security/
│       ├── compute/
│       └── keyvault/
│
├── ansible/
│
├── app/
│
├── policies/
│
├── docs/
│
├── .gitignore
└── README.md
```

## Environments

The project is designed to support multiple environments:

```text
Development
Staging
Production
```

Environment-specific configuration can be introduced as the project evolves.
