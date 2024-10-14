variable "aws_region" {
  type    = string
  default = "eu-west-3"
}
variable "availability_zone" {
  type    = list(string)
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3b"]
}

variable "pem_file" {
  type = string
}

variable "pem_key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_image" {
  type = string
}