variable "ec2-instance_type" {
  type        = string
  description = "The type of instance to launch"
  default     = "t2.micro"
}

variable "ec2-root-storage-size" {
  type = number
  description = "The size of the root storage"  
  default = 8
}

variable "env" {
  type = string
  description = "The environment name"
  default = "prd"
}