variable "ami" {
    default = "ami-045e6fa7127ab1ac4"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key" {}

variable "subnet_id" {}

variable "sg_id" {}

variable "p_key" {}

variable "az" {
    default = "ap-south-1a"
}

variable "connection_type" {
    default = "ssh"
}

variable "login_user" {
    default = "ec2-user"
}

variable "nn_ip" {}

variable "jt_ip" {}

variable "client_depends" {}
  