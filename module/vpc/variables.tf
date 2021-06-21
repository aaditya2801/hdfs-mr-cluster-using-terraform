variable "cidr" {
    default = "192.168.0.0/16"
}

variable "az" {
    default = "ap-south-1a"  
}

variable "sub_cidr" {
    default = "192.168.0.0/24"
}

variable "vpc_name" {
    default = "vpc_for_hadoop"
}

variable "sub_name" {
    default = "subnet_for_hadoop"
}

variable "gw_name" {
    default = "gw_for_hadoop"
}

variable "rt_name" {
    default = "rt_for_hadoop"
}