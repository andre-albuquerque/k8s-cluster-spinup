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

output "ansible_inventory" {
  value = {
    all = {
      hosts = [
        aws_instance.kubernetes-master[0].public_ip,
        for worker in aws_instance.kubernetes-worker : worker.public_ip
      ]
    }
    master = {
      hosts = [
        aws_instance.kubernetes-master[0].public_ip
      ]
    }
    workers = {
      hosts = [
        for worker in aws_instance.kubernetes-worker : worker.public_ip
      ]
    }
  }
  description = "Dynamic inventory for ansible"
  sensitive   = false
}

resource "null_resource" "ansible_playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.json -u ubuntu --private-key ~/.ssh/id_rsa --ssh-common-args='-o StrictHostKeyChecking=no' ./ansible/site.yml"
  }
  depends_on = [
    aws_instance.kubernetes-master,
    aws_instance.kubernetes-worker
  ]
}