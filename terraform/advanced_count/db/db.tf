variable "server_names" {
    types = list(string)
  
}

resource "aws_instance" "db" {
    ami = "ami-032598fcc7e9d1c7a"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
      Name = var.server_names[count.index]
    } 
}

output "PrivateIP" {
    value = aws_instance.db.*.private_ip   #because 3 instances are created, it pulls all 3 different options 
}
