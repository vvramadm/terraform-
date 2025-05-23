resource "aws_instance" "web-server" {
 # count = 3 # create four similar EC2 instances

  ami                    = var.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraforms.id]
 ##### Provisionr local
  provisioner "local-exec" {
    command = "echo the server ip addresses ${self.private_ip} > privat.txt "
  }

####### remote provisioner ######
 connection {
    type = "ssh"
    user = "ec2-user"
    password = "ram123"
    host = self.public_ip
 }

 ### provisioner will execute at the time of creation
 provisioner "remote-exec" {
  inline = [ 
    "sudo dnf install ansible -y",
    "sudo dnf install nginx -y",
    "sudo systemctl start nginx"

   ]

 }  

  tags = {
    #Name = "Server ${count.index}"
    Name = "test-server"
  }
  key_name = var.key_name  
}

resource "aws_security_group" "allow_ssh_terraforms" {

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
ingress {
    from_port        = var.from_port_80
    to_port          = var.to_port_80
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr #allow from anyone
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = var.tags

}
