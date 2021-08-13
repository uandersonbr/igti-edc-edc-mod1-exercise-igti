provider "aws" {
  region = var.aws_region
}


# Centralizar o arquivo de controle de estado do terraforme
terraform {
  backend "s3"{
    bucket = "terraform-state-igti-uanderson"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}