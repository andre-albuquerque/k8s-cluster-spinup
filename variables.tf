variable "public_key" {
  type        = string
  default     = ""
  description = "ssh public key to access vms"
}

variable "ami" {
  type        = string
  default     = ""
  description = "ec2 ami image"
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "ec2 instance type"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "public keys'name"
}

variable "region" {
  type        = string
  default     = ""
  description = "aws region"
}