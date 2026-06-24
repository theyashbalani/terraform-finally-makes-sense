resource "aws_s3_bucket" "my-bucket" {
  bucket = "fking-terrabucket"

  tags = {
    Name        = "IaC-Bucket"
    Environment = "Dev"
  }
}

