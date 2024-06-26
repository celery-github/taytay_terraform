provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7ed91c7a"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]           #added in
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTP"

    ingress{
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    } 
    }

#how to create a security group

#terraform init
#terraform apply
#terraform destroy
# option + command + S
