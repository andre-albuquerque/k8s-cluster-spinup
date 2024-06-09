resource "aws_key_pair" "k8s-key" {
    key_name = "k8s-key"
    public_key = var.public_key
}