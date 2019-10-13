provider "aws" {
  region     = "us-east-1"  
  access_key = "AKIAUY7ODRBKY5IBJHDF"
  secret_key = "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"
}

resource "aws_instance" "devopsaws" {
  ami = "ami-07d0cf3af28718ef8"
  instance_type = "t2.micro"
  subnet_id = "subnet-59f1d777"
  key_name = "devopsawsclayton"
  tenancy = "default"
  associate_public_ip_address = true
  tags = { 
  Name = "devopsaws"
  }
 }
