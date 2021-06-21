output "jobtracker_ip" {
    value = aws_instance.hadoop_os_jobtracker.public_ip
}

output "jobt_depends" {
    value = aws_instance.hadoop_os_jobtracker
}