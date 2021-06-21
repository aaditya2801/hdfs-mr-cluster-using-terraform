output "cidr_output" {
    value = var.cidr
}

output "az_output" {
    value = var.az
}

output "sub_cidr_output" {
    value = var.sub_cidr
}

output "vpc_id_output" {
    value = aws_vpc.ownvpc.id
}

output "vpc_depends" {
    value = aws_vpc.ownvpc
}

output "subnet_id_output" {
    value = aws_subnet.public.id
}