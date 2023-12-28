provider "aws" {
    region = "eu-west-2"
}

variable "environment" {
    type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    count = var.environment == "prod" ? 1 : 0 #if environment = prod then set the value to 1
}

#what if we want a new resource in dev, and not prod?
#turnery operator 
# In this example line 12, for count, create one EC2 instance, if it's equal to prod, but if it's not equal to prod, then don't create anything.

# run this command ###-- terraform plan -var-file="test.tfvars"
    #nothing happens
# run this command ###-- terraform plan -var-file="prod.tfvars"
    #it creates one instance 
