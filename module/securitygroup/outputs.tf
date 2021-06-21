output "sg_desc_output" {
    value = var.sg_desc
}

output "sg_tag_output" {
    value = var.sg_tag
}

output "proto_output" {
    value = var.proto
}

output "all_cidr_output" {
    value = var.all_cidr
}

output "service_ports_output" {
    value = var.service_ports
}

output "sg_name_output" {
    value = var.sg_name
}

output "sg_id_output" {
    value = aws_security_group.mysg.id
}