terraform {
  backend "remote" {
    organization = "tamanishi"
    workspaces {
      name = "Example-Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "administrator"
  region  = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e42827f7b2eaa246"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

