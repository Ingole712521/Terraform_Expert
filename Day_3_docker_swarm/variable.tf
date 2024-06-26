### variable.tf
variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "ap-south-1"
}
variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-007020fd9c84e18c7"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
variable "key_path" {
  description = "SSH Public Key path"
  default     = "/Project_Mario_game.pem"
}
variable "key_name" {
  description = "Desired name of Keypair..."
  default     = "Project_Mario_game"
}
variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default     = "./install_docker_machine_compose.sh"
}
variable "access_key" {
}
variable "secret_key" {
}