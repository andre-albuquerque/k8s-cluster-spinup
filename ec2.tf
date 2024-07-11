resource "aws_instance" "kubernetes-worker" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = 2
  tags = {
    name = "k8s"
    type = "worker"
  }
  security_groups = [aws_security_group.k8s-sg.name]
}

resource "aws_instance" "kubernetes-master" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = 1
  tags = {
    name = "k8s"
    type = "master"
  }
  security_groups = [aws_security_group.k8s-sg.name]
}