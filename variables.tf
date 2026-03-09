variable "bucket_name" {
  type = string
  description = "Remote state bucket"
}

variable "vpc_cidr" {
  type = string
  description = "publuc subnet CIDR values"
}
variable "vpc_name" {
  type = string
  description = "vpc"
}

variable "eu_availability_zone" {
  type = list(string)
  description = "availablity zone"
}

variable "cidr_public_subnet" {
  type = list(string)
  description = "public subnet CIDR Values"
}
variable "cidr_private_subnet" {
  type = list(string)
  description = "private subnet CIDR values"
}
variable "ec2_ami_id" {
  type = string
  description = "ami of ec2"
}
variable "public_key" {
  type = string
  description = "public key of ec2"
}
variable "instance_type" {
  type = string
}
variable "tag_name" {
  type = string
}
variable "key_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "sg_for_jenkins" {
  type = list(string)
}
variable "enable_public_ip_address" {
  type = bool
}
variable "user_data_install_jenkins" {
  type = string
}
