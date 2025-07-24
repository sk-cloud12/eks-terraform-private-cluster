# eks-terraform-private-cluster
# 🛡️ Provisioning a Private EKS Cluster using Terraform

This project provisions a secure Amazon EKS cluster using Terraform. The cluster is deployed entirely within private subnets, and the EKS API endpoint is also private-only. A helper shell script is included to display node details via kubectl.

---

## 📁 Project Structure
---

## 🎯 Assignment Objectives

- ✅ Provision a private EKS cluster using Terraform
- ✅ EKS cluster and worker nodes reside in private subnets only
- ✅ EKS API endpoint is private-only (no public access)
- ✅ Use at least 2 private subnets in different AZs
- ✅ Create a bash script (get-nodes.sh) using kubectl to:
  - Show Node Name
  - Show Internal IP address
- ✅ Write full documentation (README.md) with:
  - Provisioning steps
  - Authentication instructions
  - Tools and configurations used

---

## 🌐 AWS Region
You may change the region in main.tf under the provider block.

---

## 🧰 Tools & Versions Used

| Tool         | Version (Minimum) |
|--------------|-------------------|
| Terraform    | 1.6.x             |
| AWS CLI      | 2.x               |
| kubectl      | 1.28+             |
| GitHub Codespaces | Used for development |

---

## 🔐 AWS Authentication (Required for Deployment)

> ⚠️ Terraform must authenticate with AWS to create resources.
> ✅ AWS credentials are NOT included in this repo for security reasons.

### 👤 Required IAM Permissions

To deploy this infrastructure, your IAM user needs:

- eks:*
- ec2:*
- vpc:*
- iam:*
- autoscaling:*

For simplicity during testing, you may use AdministratorAccess.

### 🔑 How to Authenticate

#### Option 1: Use Environment Variables (Recommended)

`bash
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
export AWS_REGION=us-east-1
aws configure
aws sts get-caller-identity
terraform init
terraform validate
terraform plan
terraform apply
This creates the VPC, subnets, EKS cluster, and managed node group.
⏳ Expect 15–20 minutes for full provisioning. 


🧭 Configure kubectl to Access the Cluster
Once the cluster is created:
aws eks update-kubeconfig --region us-east-1 --name erp-private-eks
kubectl get nodes


📜 Node Listing Script – get-nodes.sh
This script lists all EKS worker nodes along with their internal IP addresses.

chmod +x get-nodes.sh
./get-nodes.sh
Fetching list of EKS nodes...
Node Name              Internal IP
ip-10-0-1-123          10.0.1.123
ip-10-0-2-231          10.0.2.231

✅ Final Notes
No public subnet or endpoint is used — the entire setup is private

All Terraform configurations are written from scratch as per assignment

No pre-built Terraform modules or starter templates were used

AWS credentials must be set manually by the user

This project is developed and tested in GitHub Codespaces

📬 Submission
All relevant files have been added:

main.tf

get-nodes.sh

README.md

This repository is public as required.
Feel free to clone or test with your own AWS credentials.
