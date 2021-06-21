
variable "sg_desc" {
    default = "allow_traffic"
}

variable "sg_tag" {
    default = "sg_for_hadoop"
}

variable "proto" {
    default = "tcp"
}

variable "all_cidr" {
    default = "0.0.0.0/0"
}

variable "service_ports" {
    default = ["80","22","50070"]
}

variable "custom_tcp" {
    default = ["0","65535"]
}

variable "vpc_id" {}

variable "sg_depends" {}

variable "sg_name" {
    default = "security_group_for_hadoop"
}