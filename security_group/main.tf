variable "ec2_sg_name" {
  
}
variable "vpc_id" {
  
}
variable "ec2_jenkins_sg_name" {
  
}
output "sg_ec2_ssh_http_id" {
  value = aws_security_group.ec2_sg_ssh_http.id
}
output "sg_ec2_jenkins_port_8080" {
  value = aws_security_group.ec2_jenkins_port_8080.id

}

resource "aws_security_group" "ec2_sg_ssh_http" {
  name = var.ec2_sg_name
  description = "enable the port 22(ssh) and 80(http)"
  vpc_id = var.vpc_id

  ingress {
    description = "allow remote ssh from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  #enable http
  ingress {
    description = "allow remote http from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  #outgoint request
  egress {
    description = "allow outgoing request"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "security group to allow ssh and http"
  }
}

resource "aws_security_group" "ec2_jenkins_port_8080" {
  name = var.ec2_sg_name
  description = "enable the port 8080 for jenkins"
  vpc_id = var.vpc_id

  ingress {
    description = "allow port 8080 to access jenkins "
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
  }
  tags = {
    Name = "security group to allow 8080"
  }
}

resource "aws_ec2" "name" {
  
}
