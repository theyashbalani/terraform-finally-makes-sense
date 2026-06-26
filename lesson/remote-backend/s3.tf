resource "aws_s3_bucket" "remote-backend-s3" {
  bucket = "fking-state-lock"

  tags = {
    Name = "Terraform State Lock"
    Environment = "dev"
  }
}
