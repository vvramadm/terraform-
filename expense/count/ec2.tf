resource "aws_instance" "server" {
 # count = 3 # create four similar EC2 instances

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = {
    #Name = "Server ${count.index}"
    Name = "testserver"
  }
  key_name = var.key_name  
}

resource "aws_security_group" "allow_ssh_terraform" {

  name        = var.sg_name #allow_ssh is already there in my account
  description = var.sg_description

  # usally allows everthing in egress
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr #allow from anyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags

}
