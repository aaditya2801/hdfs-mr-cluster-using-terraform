// EC2 Instance and configuring namenode :

resource "aws_instance" "hadoop_os" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key
  associate_public_ip_address = true
  vpc_security_group_ids = [ var.sg_id ]
  subnet_id = var.subnet_id
  availability_zone = var.az
  connection {
    type     = var.connection_type
    user     = var.login_user
    private_key = var.p_key
    host     = aws_instance.hadoop_os.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo wget https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.i386.rpm",
      "sudo rpm -ivh hadoop-1.2.1-1.i386.rpm --force",
      "sudo wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm",
      "sudo yum install -y jdk-8u141-linux-x64.rpm git",
      "sudo git clone https://github.com/aaditya2801/hadoop.git",
      "sudo cp hadoop/* /etc/hadoop/",
      "sudo mkdir /nn",
      "sudo hadoop namenode -format -force", 
      "sudo hadoop-daemon.sh start namenode",
      "sudo hadoop dfsadmin -report"
    ]
  }
  tags = {
    Name = var.name
  }
}

  resource "null_resource" "deploy_webapps"  {
	provisioner "local-exec" {
	    command = "start chrome  ${aws_instance.hadoop_os.public_ip}:50070"
  	}
}