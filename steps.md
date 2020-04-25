# Steps in Completing Your Project

## Step 1: Propose and Scope the Project

- Plan what your pipeline will look like.

  - Checkout
  - Lint
  - Build
  - Push
  - Deploy (rolling)

- Decide which options you will include in your Continuous Integration phase.
- Use Jenkins.
- Pick a deployment type - either rolling deployment or blue/green deployment.
- For the Docker application you can either use an application which you come up with, or use an open-source application pulled from the Internet, or if you have no idea, you can use an Nginx “Hello World, my name is (student name)” application.

## Step 2: Use Jenkins, and implement blue/green or rolling deployment

- Create your Jenkins master box with either Jenkins and install the plugins you will need.
- Set up your environment to which you will deploy code.

## Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster

- Use Ansible or CloudFormation to build your “infrastructure”; i.e., the Kubernetes Cluster.
- It should create the EC2 instances (if you are building your own), set the correct networking settings, and deploy software to these instances.
- As a final step, the Kubernetes cluster will need to be initialized. The Kubernetes cluster initialization can either be done by hand, or with Ansible/Cloudformation at the student’s discretion.

## Step 4: Build your pipeline

- Construct your pipeline in your GitHub repository.
- Set up all the steps that your pipeline will include.
- Configure a deployment pipeline.
- Include your Dockerfile/source code in the Git repository.
- Include with your Linting step both a failed Linting screenshot and a successful Linting screenshot to show the Linter working properly.

## Step 5: Test your pipeline

- Perform builds on your pipeline.
- Verify that your pipeline works as you designed it.
- Take a screenshot of the Jenkins pipeline showing deployment and a screenshot of your AWS EC2 page showing the newly created (for blue/green) or modified (for rolling) instances. Make sure you name your instances differently between blue and green deployments.
