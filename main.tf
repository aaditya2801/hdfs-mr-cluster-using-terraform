module "vpc" {
        source = "./module/vpc"
}

module "keypair" {
        source = "./module/keypair"
}

module "sg" {
        source = "./module/securitygroup"
        vpc_id = module.vpc.vpc_id_output
        sg_depends = module.vpc.vpc_depends
}

module "ec2_namenode" {
        source = "./module/namenode"
        key = module.keypair.key_output
        subnet_id = module.vpc.subnet_id_output
        sg_id = module.sg.sg_id_output
        p_key = module.keypair.private_key
}

module "ec2_datanode" {
        source = "./module/datanode"
        key = module.keypair.key_output
        subnet_id = module.vpc.subnet_id_output
        sg_id = module.sg.sg_id_output
        p_key = module.keypair.private_key
        dn_depends = module.ec2_namenode.nn_depends
        nn_ip = module.ec2_namenode.name_node_ip
}

module "ec2_jobtracker" {
        source = "./module/jobtracker"
        key = module.keypair.key_output
        subnet_id = module.vpc.subnet_id_output
        sg_id = module.sg.sg_id_output
        p_key = module.keypair.private_key
        jobtracker_depends = module.ec2_datanode.dn_depends
        nn_ip = module.ec2_namenode.name_node_ip
}

module "ec2_tasktracker" {
        source = "./module/tasktracker"
        key = module.keypair.key_output
        subnet_id = module.vpc.subnet_id_output
        sg_id = module.sg.sg_id_output
        p_key = module.keypair.private_key
        tasktracker_depends = module.ec2_jobtracker.jobt_depends
        jt_ip = module.ec2_jobtracker.jobtracker_ip
}

module "ec2_client" {
        source = "./module/client"
        key = module.keypair.key_output
        subnet_id = module.vpc.subnet_id_output
        sg_id = module.sg.sg_id_output
        p_key = module.keypair.private_key
        client_depends = module.ec2_tasktracker.tasktracker_depends
        jt_ip = module.ec2_jobtracker.jobtracker_ip
        nn_ip = module.ec2_namenode.name_node_ip
}

