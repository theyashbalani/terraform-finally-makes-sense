variable "env" {
  type = string
  description = "The environment for infra"
}

variable "bucket_name" {
  type = string
  description = "The name of the bucket for infra"
}

variable "ec2-root-storage-size" {
  type = number
  description = "The size of the root storage"  
  default = 8
}

variable "instance-count" {
  type = number
  description = "The number of ec2 instances to create for infra"  
}

variable "instance-type" {
  type = string
  description = "The type of instances to create for infra"  
} 

variable "hash_key" {
  type = string
  description = "The hash key for the dynamodb table"  
}