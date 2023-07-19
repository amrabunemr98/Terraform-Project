region = "us-east-1"

cidr-block = "10.0.0.0/16"

vpc-tag = "sprints"

sub1= {
    "public-subnet1" = {
        cidr_block = "10.0.0.0/24"
        availability_zone = "us-east-1a"
        name = "public-Sub 1"
    },
    "public-subnet2" = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        name = "public-Sub 2"
    }
}

sub2= {
    "private-subnet1" = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        name = "private-Sub 1"
    },
    "private-subnet2" = {
        cidr_block = "10.0.3.0/24"
        availability_zone = "us-east-1b"
        name = "private-Sub 2"
    }
}

internet-gateway = "sprints-igw"

nat-gw = "sprints-NAT"

cidr-rt = "0.0.0.0/0"


tag_public = "public RT"

tag_private = "private RT"




cidr-SG = ["0.0.0.0/0"]





