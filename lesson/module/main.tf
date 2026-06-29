module "dev-infra" {
    source = "./infra"
    env = "dev"
    bucket_name = "my-infra-bucket"
    instance-type = "t2.micro"
    instance-count = 2
    hash_key = "my-id"
}

module "prod-infra" {
    source = "./infra"
    env = "prod"
    bucket_name = "my-infra-bucket"
    instance-type = "t3.micro"
    instance-count = 1
    hash_key = "my-id"
}

