output "name_node_ip" {
    value = aws_instance.hadoop_os.public_ip
}

output "nn_depends" {
    value = aws_instance.hadoop_os
}