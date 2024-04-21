provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "aws_instance" "master" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name = "master"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Project_Mario_game.pem")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./install_docker_machine_compose.sh"
    destination = "/home/install_docker_machine_compose.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x  /home/install_docker_machine_compose.sh",
      "sudo sh /home/install_docker_machine_compose.sh",

    ]
  }
}
resource "aws_instance" "worker1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name = "worker_1"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Project_Mario_game.pem")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./install_docker_machine_compose.sh"
    destination = "/home/install_docker_machine_compose.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x  /home/install_docker_machine_compose.sh",
      "sudo sh /home/install_docker_machine_compose.sh",

    ]
  }
}
resource "aws_instance" "worker2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name = "worker_2"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Project_Mario_game.pem")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "./install_docker_machine_compose.sh"
    destination = "/home/ubuntu/install_docker_machine_compose.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo su - ",
      "sudo chmod +x  /home/ubuntu/install_docker_machine_compose.sh",
      "sudo sh /home/ubuntu/install_docker_machine_compose.sh",

    ]
  }
}



