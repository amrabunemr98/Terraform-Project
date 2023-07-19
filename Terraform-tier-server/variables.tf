variable "cidr-block" {
    description = "cidr of vpc"
    type = string
}

variable "vpc-tag" {
    description = "name of vpc"
}

variable "sub1" {
    description = "public subnets"
    type = map(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
}

variable "sub2" {
    description = "private subnets"
    type = map(object({
    cidr_block        = string
    availability_zone = string
    name              = string
  }))
}

variable "cidr-SG" {
    description = "cidar of sg"
    type = list(string)
}

variable "cidr-rt" {
    description = "cidr-block of route table"
    type = string
}
variable "tag_public" {
    description = "name of tag"
    type = string
}

variable "tag_private" {
    description = "name of tag"
    type = string
}

variable "region" {
    description = "region of aws"
    type = string
}

variable "nat-gw" {
    description = "name of nat"
    type = string
}


variable "internet-gateway" {
    description = "name of igw"
    type = string
}
