#Global Vars
aws_cluster_name = "devtest"

#VPC Vars
aws_vpc_cidr_block = "10.250.192.0/18"

aws_cidr_subnets_private = ["10.250.192.0/20", "10.250.208.0/20"]

aws_cidr_subnets_public = ["10.250.224.0/20", "10.250.240.0/20"]

#Bastion Host
aws_bastion_num = 1

aws_bastion_size = "t2.medium"

#Kubernetes Cluster

aws_kube_master_num = 3

aws_kube_master_size = "t2.medium"

aws_kube_master_disk_size = 50

aws_etcd_num = 3

aws_etcd_size = "t2.medium"

aws_etcd_disk_size = 50

aws_kube_worker_num = 4

aws_kube_worker_size = "t2.medium"

aws_kube_worker_disk_size = 50

#Settings AWS NLB

aws_nlb_api_port = 6443

k8s_secure_api_port = 6443

default_tags = {
  #  Env = "devtest"  #  Product = "kubernetes"
}

inventory_file = "../../inventory/hosts"

## Credentials
#AWS Access Key
AWS_ACCESS_KEY_ID = ""

#AWS Secret Key
AWS_SECRET_ACCESS_KEY = ""

#EC2 SSH Key Name
AWS_SSH_KEY_NAME = ""

#AWS Region
AWS_DEFAULT_REGION = "eu-central-1"
