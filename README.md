#  ECS Fargate CI/CD Project with Docker and GitHub Actions

This project demonstrates how to containerize a Node.js application, push it to Amazon ECR, and deploy it to AWS ECS Fargate using CI/CD automation via GitHub Actions. It includes infrastructure setup (VPC, security groups, IAM roles), and advanced features like load balancing and auto-scaling.

---

## Architecture Overview

```
[Local Code] → [GitHub Actions] → [Build & Push to ECR] → [Deploy to ECS Fargate]
                                            │
                              [IAM + VPC + ALB + Auto-Scaling]
```

---

## Features

- Containerized Node.js app with multi-stage Docker build
- Docker image push to Amazon ECR
- ECS Fargate deployment via GitHub Actions
- Load balancer (ALB) for traffic routing
- Auto-scaling ECS tasks
- Health checks and failover handling
- End-to-end CI/CD pipeline

---

##  Technologies Used

- **Node.js + TypeScript**
- **Docker**
- **Amazon ECR / ECS Fargate**
- **GitHub Actions**
- **AWS VPC, IAM, ALB, Auto Scaling**

---

##  Prerequisites

Before running this project, ensure you have:

- An AWS account
- An ECR repository created
- ECS Cluster & Fargate service set up
- Task definition JSON file (`your-task-def.json`)
- VPC, Security Groups, and IAM roles configured
- GitHub repository secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

---

##  Local Development

```bash
# Install dependencies
npm install

# Build the project
npm run build

# Run locally
npm start
```

---

## Docker Build & Push

```bash
# Build the Docker image
docker build -t your-repo-name .

# Tag the image
docker tag your-repo-name:latest <aws-account-id>.dkr.ecr.<region>.amazonaws.com/your-repo-name:latest

# Authenticate with ECR and push
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
docker push <aws-account-id>.dkr.ecr.<region>.amazonaws.com/your-repo-name:latest
```

---

## CI/CD with GitHub Actions

This repository uses a GitHub Actions workflow to:

1. Build the Docker image for `linux/amd64`
2. Push to Amazon ECR
3. Update ECS service with new task definition

> See `.github/workflows/deploy.yml` for full configuration.

---

##  Directory Structure

```
.
├── src/                      # App source code
├── dist/                     # Compiled output (after build)
├── Dockerfile                # Multi-stage Docker build
├── package.json              # NPM dependencies
├── tsconfig.json             # TypeScript config
├── your-task-def.json        # ECS Task Definition
├── .github/
│   └── workflows/
│       └── deploy.yml        # GitHub Actions workflow
└── README.md                 # You're here!
|__ .gitignore


```

---

## Acknowledgements

- [AWS ECS Documentation](https://docs.aws.amazon.com/ecs/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Docker Docs](https://docs.docker.com/)
