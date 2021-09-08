# Definition

The goal of a minimum viable product (MVP) is to learn about the business viability of the product.

For **MVP 0.0.1** we target Architects and PS Project Delivery Team as our potential Customer.

The feedback received from this first iteration may dramatically change a product we will deliver to our customers.

## IaC MVP, Iteration 0.0.1

### Goal

Deliver a set of ARM templates and supporting processes (Source Control through Azure Repos, CI/CD Pipelines for deployment) that will allow us to demonstrate our capabilities of quickly deploying resources to Azure thorough DevOps practices.

Demonstrate how we can implement change to existing artifacts through code.

#### In this first iteration we will showcase

- Deployment of Azure Keyvault and automated process to store Secrets
- Deployment of Virtual Networks, LAN with VLANs
- Deployment of NSG as a prerequisite to securely deploy workloads into azure platform
- Deployment of Azure Bastion, to securely manage virtual machines
- Deployment of Storage Account 
- Deployment of Virtual Machines (multiple SKUs) and capability of consuming Secrets from Keyvault at runtime
- Deployment of public and private DNS Zones
- Deployment of BackupVault
- Deployment of PaaS services
  - App Service Plan
  - App Service
  - Asp .Net Core App "Hello World"
- Focus on quality: self documenting code through Code Comments and README files on each item in the Template library.
 
**NOTE:** We should draft a "playbook" for showtime and practice before the day of our presentation.

## IaC MVP, Iteration 0.0.2

### Goal 

- In this iteration we will incorporate any feedback from target audience.
- Focus on Architecture and DR.
  - Assemble items from IaC library into a minimum set of environments, creation of diagrams.
  - Standup a Minimum environment "Landing Zone" that will allow us to prepare a new tenant to receive workloads from an on-premises datacentre.
  - Define DevOps patterns and practices for DR, administration of Azure Backup, recovery process.

## IaC MVP, Iteration 0.0.3

### Goal

- Develop and test ARM templates to establish a site to site VPN.
- Standup a landing Zone and Site to Site VPN.
- Lift and Shift workloads from an on-premises test environment into the landing zone.

## IaC MVP, Iteration 0.0.4

### Goal

- Configuration as code DSC, define a strategy to configure server roles, etc.
- Define deliverables for following iterations.
- Establish a commercial vision for our product, define target market.
