# eks-terraform-private-cluster

## 🛡 Provisioning a Private EKS Cluster using Terraform

This project sets up a secure Amazon EKS cluster using Terraform. The entire cluster, including worker nodes and the EKS API endpoint, is deployed within private subnets — meaning no public internet exposure. A simple shell script is also included to fetch node details using kubectl.

---

## 📁 Project Structure

. ├── main.tf ├── get-nodes.sh └── README.md

---

## 🎯 Assignment Objectives

- ✅ Provision a private EKS cluster using Terraform  
- ✅ Ensure both the control plane and worker nodes are in private subnets  
- ✅ EKS API endpoint must be private-only (no public access)  
- ✅ Use at least 2 private subnets across different Availability Zones  
- ✅ Include a bash script (get-nodes.sh) that shows:
  - Node name  
  - Internal IP address  
- ✅ Document the entire setup in a README.md, covering:
  - Provisioning steps  
  - Authentication setup  
  - Tools and configurations used  

---

## 🌐 AWS Region

You can change the AWS Region in the provider block inside main.tf.

---

## 🧰 Tools & Versions Used

| Tool                | Version (Minimum)   |
|---------------------|----------------------|
| Terraform           | 1.6.x                |
| AWS CLI             | 2.x                  |
| kubectl             | 1.28+                |
| GitHub Codespaces   | Used for development |

---

## 🔐 AWS Authentication

> ⚠️ Terraform needs access to your AWS account to create resources.  
> ✅ AWS credentials are not stored in this repo for security reasons.

### 👤 Required IAM Permissions

The IAM user or role must have permissions like:

- eks:*  
- ec2:*  
- vpc:*  
- iam:*  
- autoscaling:*  

For testing, you can use AdministratorAccess.

---

### 🔑 Authentication – Option 1 (Recommended)

Use environment variables for temporary credentials:

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

⏳ Full provisioning may take 15–20 minutes.


---

🧭 Configure kubectl Access

Once the cluster is up, configure your kubectl:

aws eks update-kubeconfig --region us-east-1 --name erp-private-eks
kubectl get nodes


---

📜 get-nodes.sh – Node Listing Script

This shell script lists all EKS worker nodes with their internal IPs.

chmod +x get-nodes.sh
./get-nodes.sh

Sample Output:

Fetching list of EKS nodes...

Node Name               Internal IP
ip-10-0-1-123           10.0.1.123
ip-10-0-2-231           10.0.2.231


---

✅ Final Notes

Everything is deployed in private subnets only

No public endpoint is exposed

All Terraform code is written from scratch

No pre-built modules or templates were used

AWS credentials must be exported manually

Developed and tested in GitHub Codespaces



---

📬 Submission

The following files are included and ready for review:

main.tf

get-nodes.sh

README.md


This repository is public.
