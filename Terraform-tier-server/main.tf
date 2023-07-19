# Installing proiveder plugin
provider "aws" {
    profile = "Terraform"  
    region = var.region
}

#***********************Inserting VPC****************************************
module "tf-vpc" {
    source = "./vpc"
    cidr-block = var.cidr-block
    vpc-tag = var.vpc-tag
}


#***********************Inserting Subnets****************************************
module "tf-subnet" {
  source = "./subnet"
  vpc            = module.tf-vpc.vpc
  sub1 = var.sub1
  sub2 = var.sub2
}


#***********************Inserting SG****************************************
module "tf-security-group" {
    source = "./SG"
    vpc = module.tf-vpc.vpc
    cidr-SG = var.cidr-SG
}


#***********************Inserting RT****************************************
module "tf-route-table" {
    source = "./RT"
    vpc = module.tf-vpc.vpc
    sub_pub = [module.tf-subnet.sub-pub1, module.tf-subnet.sub-pub2]
    sub_pri = [module.tf-subnet.sub-pri1, module.tf-subnet.sub-pri2] 
    cidr-rt = var.cidr-rt
    nat = module.tf-nat.nat
    tag_private = var.tag_private
    igw = module.tf-igw.igw
    tag_public = var.tag_public
}

#***********************Inserting NAT****************************************
module "tf-nat" {
    source = "./nat"
    sub-pub1 = module.tf-subnet.sub-pub1
    nat-gw = var.nat-gw

}


#***********************Inserting LB****************************************
module "tf-load-balancer" {
    source = "./load-balancer"
    vpc = module.tf-vpc.vpc
    sg-pub-lb = module.tf-security-group.sg-pub-lb
    sg-pri-lb = module.tf-security-group.sg-pri-lb
    sub-pub1 = module.tf-subnet.sub-pub1
    sub-pub2 = module.tf-subnet.sub-pub2
    sub-pri1 = module.tf-subnet.sub-pri1
    sub-pri2 = module.tf-subnet.sub-pri2

}

#***********************Inserting IGW****************************************
module "tf-igw" {
    source = "./igw"
    vpc = module.tf-vpc.vpc
    internet-gateway = var.internet-gateway

}


#***********************Inserting Instance****************************************
module "tf-instance" {
  source = "./EC2"
  pri-lb-dns =module.tf-load-balancer.pri-lb-dns
  pub-tg = module.tf-load-balancer.pub-tg
  pri-tg = module.tf-load-balancer.pri-tg
  sub_pub = [module.tf-subnet.sub-pub1, module.tf-subnet.sub-pub2]
  sub_pri = [module.tf-subnet.sub-pri1, module.tf-subnet.sub-pri2] 
  sg-pub = module.tf-security-group.sg-pub
  sg-pri = module.tf-security-group.sg-pri
}