# Production-Grade Azure Infrastructure & Application Automation

This project demonstrates a production-style DevOps workflow using:

- Azure
- Terraform
- Spacelift
- Ansible
- GitHub
- Node.js
- Nginx
- PostgreSQL
- Azure Key Vault
- Ansible Vault
- Prometheus
- Grafana

## Architecture

GitHub
↓
Spacelift
↓
Terraform
↓
Azure Infrastructure
↓
Ansible
↓
Application Deployment
↓
Monitoring

## Project Goals

- Provision Azure infrastructure using Terraform
- Manage Terraform workflows using Spacelift
- Configure Azure servers using Ansible
- Deploy a 3-tier web application
- Implement security hardening
- Manage secrets securely
- Implement CI/CD
- Add monitoring and health checks
- Demonstrate Infrastructure as Code and Configuration Management

## Application Architecture

Web Tier:
Nginx

Application Tier:
Node.js / Express

Database Tier:
PostgreSQL

## Environments

- Development
- Staging
- Production
