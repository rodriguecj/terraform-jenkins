terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region_aws
}


# Instancia Ec2
resource "aws_instance" "jenkins_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.small"

 subnet_id = "subnet-091e69d21f1e16768"
 associate_public_ip_address  = true

  tags = {
    Name = "jenkins_server"
    Tool = "Terraform"
  }

  key_name = "first-microservice"
  user_data = "${file("./bash/configuration.sh")}"
}


output "public_ip_b_nest_app_server" {
  value = aws_instance.jenkins_server.*.public_ip
}

output "private_ip_jenkins_server" {
  value = aws_instance.jenkins_server.*.private_ip
}