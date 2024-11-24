terraform {
  backend "s3" {
    bucket = "secure-k8s-terraform-state-s3"
    key    = "kubespray/terraform.tfstate"
    region = "eu-north-1"
  }
}
