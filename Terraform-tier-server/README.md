# Terraform to Deploy Web Server with Load Balancer and Reverse Proxy on AWS
## Overview:
### This Terraform configuration creates web application with a load balancer and a proxy server. Nginx application is hosted on two EC2 instances in a public subnet. The load balancer distributes traffic to EC2 instances. Appache application is hosted on a single EC2 instance in a private subnet. I configure the public load balancer to forward traffic to the IP address of the reverse proxy.Once i have configured public the load balancer, i can test it by visiting the public load balancer DNS in my browser.
![Screenshot from 2023-07-17 19-33-38](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/8ccea6cb-35b0-45df-8f74-44534c48273a)
------------------------------------------------------
## Requirements:
### To use this Terraform configuration, you will need the following:
- A Terraform installation
- An AWS account
- An SSH key pair

## Setup
### To set up this Terraform configuration, you will need to do the following:
1. Create a new Terraform workspace.
1. Initialize the Terraform configuration.
1. Create a remote state file in an S3 bucket.
1. Apply the Terraform configuration.

## Usage
## To use this Terraform configuration, you will need to do the following:
1. Run the following command to create the state file in an S3 bucket:
```
terraform init
```
2. Run the following command to apply the Terraform configuration:
```
terraform apply
```
## Screenshots

### Creating and Working on workspace dev :
![Screenshot from 2023-07-17 18-22-47](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/6ff602a9-8db4-4241-81e3-16e855c3681a)
---------------------------------------------
### configuration of the proxy in Public Instance:
![Screenshot from 2023-07-17 19-03-23](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/c5d3e7ab-4545-47c0-b102-6e51b45d2afa)
-------------------------------------------------------------
### Load Balancer DNS Traffic :
![Screenshot from 2023-07-17 19-07-20](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/b7d99c4d-a78b-4418-afbd-ff93dd44ddfb)
--------------------------------------------------
- public dns of the load balancer when i send a traffic to it from a browser and it returns the content of the private ec2s :
![Screenshot from 2023-07-17 19-00-53](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/7e0e9233-3150-4fdb-a0fe-5d162ce6d5bf)
![Screenshot from 2023-07-17 19-01-45](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/978a619f-b9b4-49cd-a675-adca6e8ab50a)
------------------------------------------
## S3 Bucket:
- Configure The Backend S3:
![Screenshot from 2023-07-17 19-04-55](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/152d0bc7-3270-4bba-a185-b7f8f94bd5bb)
--------------------------------------------------
- The s3 that contain the state file:
![Screenshot from 2023-07-17 19-06-21](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/01b8f82a-8148-4c6f-ab36-ce154f16aece)
![Screenshot from 2023-07-17 19-06-34](https://github.com/amrabunemr98/Sprints-tasks/assets/128842547/723dc764-47e7-443e-b652-09f75cfb6882)
--------------------------
## Conclusion
### This Terraform configuration can be used to create a simple web application with a load balancer and a proxy server. The configuration is documented using comments and can be easily understood by anyone who is familiar with Terraform.
