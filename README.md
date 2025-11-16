# 🌩️ AWS VPC Setup using Terraform

This repository contains Terraform code (`myfile.tf`) to provision a basic AWS VPC environment and supporting resources on AWS.  
The `IMAGES/` folder has AWS Console screenshots for each major step so you can visually verify the infrastructure.

---

## 🧱 What this configuration creates

Using Terraform, this setup provisions:

- **VPC** with a custom CIDR block
- **Subnets** inside the VPC (for application tiers / isolation)
- **Internet Gateway** attached to the VPC for outbound internet access
- **Route Table** with a default route (`0.0.0.0/0`) pointing to the Internet Gateway
- **Security Group** with inbound/outbound rules for EC2 access (e.g. SSH/HTTP)
- **EC2 Instances** launched inside the created subnets
- Tags on resources so they are easy to identify in the AWS console

This repo is a simple but complete example of **Infrastructure as Code (IaC)** for a small VPC-based environment.

---

## 🧰 Prerequisites

- AWS account with permissions to create:
  - VPC, Subnets, Internet Gateway, Route Tables, Security Groups, EC2
- **Terraform** installed (v1.x recommended)
- AWS credentials configured:
  - `aws configure`, or  
  - environment variables, or  
  - named AWS profile

---

## 🚀 How to use

### 1) Clone the repository

```bash
git clone https://github.com/sanket3122/cloud-task3.git
cd cloud-task3
```

2) Configure AWS credentials
```bash
aws configure
```
Or set the environment variables:
```bash
export AWS_ACCESS_KEY_ID=YOUR_KEY
export AWS_SECRET_ACCESS_KEY=YOUR_SECRET
export AWS_DEFAULT_REGION=YOUR_REGION
```

3) Initialize Terraform

```bash
terraform init
```

4) Preview the plan
```bash
terraform plan
```

5) Apply and create resources
```bash
terraform apply
```

6) Type yes to confirm.

Destroy resources when finished
```bash
terraform destroy
```

6) Files

myfile.tf – Terraform configuration for VPC, networking, and EC2 instances

IMAGES/ – All AWS Console screenshots referenced below

Screenshots (AWS Console Output)

All screenshots are stored in the IMAGES folder.

High-level views (VPC, subnets, routes, security group, instances):

## Screenshots

![1](IMAGES/1.PNG)
![2](IMAGES/2.PNG)
![3](IMAGES/3.PNG)
![5](IMAGES/5.PNG)

![52](IMAGES/52.PNG)
![53](IMAGES/53.PNG)
![54](IMAGES/54.PNG)
![55](IMAGES/55.PNG)

![56](IMAGES/56.PNG)
![57](IMAGES/57.PNG)
![58](IMAGES/58.PNG)
![6](IMAGES/6.PNG)

![Gateway](IMAGES/gateway.PNG)
![Instances](IMAGES/instances.PNG)
![Route Table](IMAGES/route-table.PNG)
![Security Group](IMAGES/security-grp.PNG)
![Subnets](IMAGES/subnets.PNG)
![VPC](IMAGES/vpc.PNG)


## Thank you!!!

