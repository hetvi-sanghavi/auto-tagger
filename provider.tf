provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {
    bucket = "terraformstatestoreauto"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}