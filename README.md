# CI/CD Pipeline with AWS CodePipeline and Docker
This project demonstrates a complete CI/CD pipeline for deploying a containerized Node.js application from GitHub to AWS EC2 using Docker.

## Monitoring Deployment

1. Monitor the pipeline progress in the AWS CodePipeline console
2. Check deployment status in the AWS CodeDeploy console
3. Verify application is running by visiting http://<ec2-instance-public-ip>:3000

## Rollback Process
The pipeline is configured to automatically roll back to the previous successful deployment if a deployment fails. You can also manually roll back in the AWS CodeDeploy console.

### Project Structure

app.js: Main application code
package.json: Node.js dependencies
Dockerfile: Instructions for building the Docker image
buildspec.yml: Instructions for AWS CodeBuild
appspec.yml: Instructions for AWS CodeDeploy
scripts/: Deployment scripts for different lifecycle events
infrastructure/: CloudFormation templates

## Security Considerations

IAM roles follow principle of least privilege
ECR repository scans images for vulnerabilities
Private repository for sensitive code
HTTPS for all communications

## Troubleshooting
If you encounter issues:

a. Check CodeBuild and CodeDeploy logs in CloudWatch
b. Check the EC2 instance logs: /var/log/aws/codedeploy-agent/codedeploy-agent.log
c. Check Docker logs: docker logs docker-cicd-demo

## Future Improvements

Add automated testing in the pipeline
Implement blue/green deployments
Set up monitoring and alerts
Implement infrastructure as code for the EC2 instances Architecture

**The pipeline uses the following AWS services:

CodePipeline: Orchestrates the CI/CD workflow
CodeBuild: Builds Docker images from source code
CodeDeploy: Deploys applications to EC2 instances
ECR: Stores Docker images
EC2: Hosts the containerized application
IAM: Manages permissions between services
S3: Stores pipeline artifacts
CloudFormation: Provisions the infrastructure


# Setup Instructions

Prerequisites

AWS Account
GitHub Account
AWS CLI installed and configured
GitHub personal access token with repo scope

1. Fork or Clone this Repository
    git clone `https://github.com/your-username/docker-cicd.git`
    cd docker-cicd

2. Deploy the Infrastructure
    <!--Navigate to infrastructure directory-->
`    cd infrastructure
`
    <!--Deploy the CloudFormation stack-->
        `aws cloudformation create-stack \
        --stack-name docker-cicd-demo \
        --template-body `file://pipeline-template.yml` \
        --parameters \
            `ParameterKey=`GitHubOwner,ParameterValue`=`your-github-username \
            `ParameterKey=`GitHubRepo,ParameterValue`=`docker-cicd-demo \
            `ParameterKey=`GitHubBranch,ParameterValue`=`main \
            `ParameterKey=`GitHubToken,ParameterValue`=`your-github-token \
        --capabilities CAPABILITY_IAM`

3. Launch EC2 Instance
Launch an EC2 instance with:

- Amazon Linux 2 AMI
- t2.micro (or your preferred instance type)
- Security group allowing inbound traffic on port 3000
- Tag with Key=Name, Value=docker-cicd-demo-instance
- Use the user data script provided in this repository

4. Make Changes and Trigger the Pipeline
The pipeline will automatically trigger when you push changes to your GitHub repository.
<!-- Make Changes to the code -->
    git add .
    git commit -m "Update application"
    git push origin main


    
=======
# D-C-S
This repo contains Devops,Cloud and SRE Projects
