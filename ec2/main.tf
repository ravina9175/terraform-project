variable "ami-vpc_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "tag_name" {
  type = string
}
variable "public_key" {
  type = string
}
variable "subnet_id" {
  
}
variable "sg_for_jenkins" {
  
}
variable "enable_public_ip_address" {
  type = bool
}
variable "user_data_install_jenkins" {
  default = ""
}
variable "key_name" {
  type = string
}
variable "ec2_ami_id" {
  type = string
}

output "ssh_connection_string_for_ec2" {
  value = format("%s%s","ssh -i /user/")
}
output "jenkins_ec2_instance_ip" {
  value = aws_instance.jenkins_ec2_instance_ip.id
}
output "dev_proj_1_instance_public_ip" {
  value = aws_instance.jenkins_ec2_instance_ip.dev_proj_1_instance_public_ip
}

resource "aws_instance" "jenkins_ec2_instance_ip" {
  ami = var.ec2_ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.tag_name
  }
  key_name = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.sg_for_jenkins
  associate_public_ip_address = var.enable_public_ip_address
  user_data = var.user_data_install_jenkins
  metadata_options {
    http_endpoint = "enable"
    http_tokens = "required"
  }
}
