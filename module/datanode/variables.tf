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

variable "dn_depends" {}

variable "nn_ip" {}

variable "user_names" {
    default = ["DataNode1", "DataNode2", "DataNode3"]
}
