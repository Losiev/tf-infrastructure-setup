# Terraform Infrustructure Setup
Creating a simple AWS infrastructure using IaC Terraform to deploy a basic web application. Utilizing Amazon EFS to store the HTML page content and Amazon ECS for containerized deployment.

## Prerequisites
Before starting the deployment, ensure you have the following:
- AWS CLI installed and configured (aws configure)
- Terraform installed (terraform -v)
- Docker installed for local testing (docker -v)

## Step-by-Step Deployment

### 1️⃣ Clone the Repository
```
 git clone https://github.com/Losiev/tf-infrastructure-setup.git
```
### 2️⃣ Try deploying locally
```
docker compose up -d
```
Connect via:
```
http:/localhost:80/
```
You can stop container using:
```
docker compose down
```
### 3️⃣ Deploy Infrastructure using Terraform
```
cd terraform
terraform init
terraform plan
terraform apply
```
### 4️⃣ Check out the page in browser
```
http://<alb_dns_name>:80
```
### Desired result
![image](https://github.com/user-attachments/assets/c58a6df1-8fbb-4ffd-ae09-ef7f3e98f061)

### 5️⃣ Cleanup (Optional)
To remove all deployed resources:
```
terraform destroy -auto-approve
```
---
✅ Deployment complete! 🚀
