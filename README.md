# K8S Single Cluster Spinup

Personal project to setup a Kubernetes cluster within 3 instances on AWS

## How does it work?
- Terraform that creates 3 AWS instances, Security Group and a Keypair
- The Tf.state backend file is stored on an AWS S3 bucket
- Ansible installs and configures Kubernetes with all dependencies
- The workflow is automated using Github Actions
- The Github Actions uses a Docker container with Terraform and Ansible

## Workflow Diagram
<img src='./images/diagrama.png' alt="Alt Text" width="500" height="350">