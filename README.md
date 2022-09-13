# What is Terraform?
Terrraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. 
It is used to define and provision a complete infrastructure using a declarative language.
IaC helps businesses automate their infrastructures by programmatically managing an entire technology stack through code.

# Terraform core concepts:
Variables: Also used as input-variables, it is key-value pair used by Terraform modules to allow customization.

Provider: It is a plugin to interact with APIs of service and access its related resources. (We will be using AWS for this project)

Module: It is a folder with Terraform templates where all the configurations are defined.

Resources: refers to a block of one or more infrastructure objects (compute instances, virtual networks, etc.), which are used in configuring and managing the infrastructure.

Output Values: These are return values of a terraform module that can be used by other configurations.

Plan: It is one stage where it determines what needs to be created, updated, or destroyed.

Apply: It is the last stage where it applies the changes of the infrastructure in order to move to the desired state.

# Build terraform module for a Three-Tier application on GCP:

Step1

Global VPC

Configure subnets automatically
This module should be able to create project. Once the VPC module is ready, please release. Release the module on terraform registry.

Step2

On top of VPC from previous step, please create Auto Scaling Group. Auto Scaling Group should use minimum 1 instance and should create it's Load Balancer.

Step3

Create CloudSQL to use with wordpress autoscaling group

Enable services to start provisioning environment

```
!/bin/bash
gcloud services enable compute.googleapis.com
gcloud services enable dns.googleapis.com
gcloud services enable storage-api.googleapis.com
gcloud services enable container.googleapis.com
```

Project was created with a random id.


