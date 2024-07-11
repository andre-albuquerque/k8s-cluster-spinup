terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "k8s-backend-private"
    encrypt = "true"
    key     = "terraform.tfstate"
  }
}