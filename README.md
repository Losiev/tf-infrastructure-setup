# tf-infrastructure-setup
Creating a simple AWS infrastructure using IaC Terraform to deploy a basic web application. Utilizing Amazon EFS to store the HTML page content and Amazon ECS for containerized deployment.

## Prerequisites
Before starting the deployment, ensure you have the following:
- AWS CLI installed and configured (`aws configure`)
- Terraform installed (`terraform -v`)
- Docker installed for local testing (`docker -v`)

## Step-by-Step Deployment

### 1️⃣ Clone the Repository
```sh
 git clone https://github.com/Losiev/tf-infrastructure-setup.git
```

### 2️⃣ Try deploying locally
```sh
docker compose up -d
```

Connect via:
```sh
http:/localhost:80/
```

You can stop container using:
```sh
docker compose down
```

### 3️⃣ Deploy Infrastructure using Terraform
```sh
cd terraform
terraform init
terraform plan
terraform apply
```

### 4️⃣ Check out the page in browser
```sh
http://<alb_dns_name>:80
```

### 5️⃣ Cleanup (Optional)
To remove all deployed resources:
```sh
terraform destroy -auto-approve
```

---
✅ **Deployment complete!** 🚀
