provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    tags = {
        Name = "Web Server"
    }
    depends_on = [ aws_instance.myec2db ]
}

resource "aws_instance" "myec2db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

data "aws_instance" "dbsearch" {
    filter {
      name = "tag:Name"
      values = ["DB Server"]
    }
}

output "dbservers" {
    value = data.aws_instance.dbsearch.availability_zone

}

#MORE INFO https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance.html
