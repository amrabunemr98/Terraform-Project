data "aws_ami" "amazon_ec2" {
      most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical 
}

resource "aws_instance" "ec2-pub" {
  count = length(var.sub_pub)
  ami           = data.aws_ami.amazon_ec2.image_id
  instance_type = "t2.micro"
  subnet_id = var.sub_pub[count.index]
  vpc_security_group_ids = [var.sg-pub]
  associate_public_ip_address = true
  key_name = "nginx"
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo bash -c 'echo \"server {",
      "    listen 80;",
      "    location / {",
      "        proxy_pass http://${var.pri-lb-dns};",
      "    }",
      "}\" > /etc/nginx/sites-available/default'",
      "sudo systemctl restart nginx",
    ]
  }

  provisioner "local-exec" {
    command = "echo Public-${count.index} = ${self.public_ip} >> EC2-IPs.txt"
  }
  tags = {
    Name = "Public-Instance-${count.index}"
  }
}


resource "aws_instance" "ec2-pri" {
  count = length(var.sub_pri)
  ami           = data.aws_ami.amazon_ec2.image_id
  instance_type = "t2.micro"
  subnet_id = var.sub_pri[count.index]
  vpc_security_group_ids = [var.sg-pri]
  associate_public_ip_address = true
  key_name = "nginx"
       user_data     = <<-EOF
  #!/bin/bash
  apt-get update
  apt-get -y install apache2
  systemctl status apache2
  systemctl start apache2
  echo "<html><body><h1> Hello from Apache2 with IP : $LOCAL_IP </h1></body></html>" > /var/www/html/index.html
EOF
  
  provisioner "local-exec" {
    command = "echo Private-${count.index} = ${self.private_ip} >> EC2-IPs.txt"
  }

  tags = {
    Name = "Private-Instance-${count.index}"
  }
}

resource "aws_lb_target_group_attachment" "attach-tg-pub" {
  count = length(aws_instance.ec2-pub)
  target_group_arn = var.pub-tg
  target_id        = aws_instance.ec2-pub[count.index].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-tg-pri" {
  count = length(aws_instance.ec2-pub)
  target_group_arn = var.pri-tg
  target_id        = aws_instance.ec2-pri[count.index].id
  port             = 80
}