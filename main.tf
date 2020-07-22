

provider "aws" {
  
    
    region     = "us-east-2"
 

  shared_credentials_file = "/Users/ubuntu/.aws/credentials"
 profile                 = "default"
  }

resource "aws_instance" "Jenkins" {
  ami           = "ami-0a63f96e85105c6d3" # us-east-2
  instance_type = "t2.micro"
  key_name ="chejurokeypair"

tags = {
    Name = "jenkins-master"
  }
   }
