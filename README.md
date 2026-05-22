## Project Setup and Workflow

### 1. I created AWS access

First, I created an IAM user (or an IAM role) in AWS with the permissions needed for this project.

This access was required so Terraform and Quali could create and manage AWS resources.

### 2. I created a project folder

I created a working folder for the project and kept all project files there, including Terraform files and tfvars files.

### 3. I created/prepared the Kubernetes cluster

Next, I created and prepared a Kubernetes cluster.

In my case, I used an docker desktop kubernetes cluster because the Quali Quali agent runs inside Kubernetes.

### 4. I checked AWS and Kubernetes configuration

Before installing the agent, I verified that AWS and Kubernetes were configured correctly.

I checked AWS access with:

aws sts get-caller-identity

I also checked the Kubernetes context and cluster status with:

kubectl config current-context
kubectl get nodes
kubectl get pods -A

### 5. I logged in to Quali

After that, I logged in to the Quali platform and selected the correct space for my work.
This is where I connected GitHub, installed the agent, and created the blueprint.

### 6. I installed the agent in the cluster

Then I installed the agent into my cluster.

After installation, I verified that the agent was running and connected in the Quali UI.

### 7. I created the Terraform code

Next, I created Terraform code for the AWS resource I needed to deploy.
For Terraform, I used a simple root and child module structure.

The root module was the main entry point for Terraform. This is the folder that Quali used when it launched the environment. The root module was responsible for calling the child module and passing the required variables.

The child module contained the actual Terraform logic for creating the AWS resource. In this task, the child module was responsible for creating the S3 bucket.

I used this structure because it is cleaner and easier to maintain. The root module keeps the environment-specific configuration, while the child module keeps the reusable infrastructure code.

### 8. I added Terraform outputs

I also added Terraform outputs for the values I wanted to expose in Quali.

I added outputs such as:

- bucket_name
- bucket_arn

### 9. I pushed the project to GitHub

After the Terraform code was ready, I pushed the project to GitHub.

### 10. I connected GitHub to Quali 

Then I connected my GitHub repository to Quali ( personal access tokens was required)

### 11. I created the Blueprint

Next, I created the blueprint. This part was more challenging for me than I expected.

The blueprint defined the Terraform grain, the source repository, the agent, AWS credentials, and the tfvars file.

> [ISSUES]

>The first issue I had was with the Terraform grain and the connection to the agent. I needed to make sure the grain was using the correct agent name and that the agent was connected properly in Quali. I tried to configure everything through the UI, but it did not work. After I understood that I could work with the blueprint YAML directly, it resolve the issue and became easier to control the configuration.

>The second issue was that I don't have permittion to access the credentials throught the i/o. Fixed by adding `authentication` in YAML code.

Using the blueprint file, I was able to connect additional inputs, such as the AWS credentials and the agent. I also configured the Terraform grain to use dev.tfvars instead of the default terraform.tfvars file.

This helped me make the blueprint more predictable and easier to troubleshoot.

### 12. I verified the result

After the environment was launched, I verified the result in AWS and in the Quali environment details.

I checked that the AWS resource was created successfully.

I also checked the outputs section in Quali to confirm that Terraform outputs were visible.

### 13. I cleaned up the environment

After testing, I destroyed the environment from Quali.

This removed the AWS resources created by Terraform and helped avoid unnecessary AWS costs.