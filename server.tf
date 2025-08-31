resource "aws_instance" "paolo_server" {
  ami           = "ami-042b4708b1d05f512"
  instance_type = "t3.micro"

  primary_network_interface {
    network_interface_id = aws_network_interface.paolo.id
  }

  tags = {
    Name = "paolot"
  }
}


resource "aws_network_interface" "paolo" {
    subnet_id   = aws_subnet.paolo1_subnet.id
    private_ips = ["10.0.1.20"]                     #the interface is used to create "Private IPv4 addresses

    tags = {
        Name = "paolo_interface"
    }
}