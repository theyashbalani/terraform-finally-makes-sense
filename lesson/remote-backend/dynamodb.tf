resource "aws_dynamodb_table" "remote-backend-dynamodb" {
  name         = "fking-state-lock"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
  hash_key = "LockID"

  tags = {
    Name        = "Terraform State Lock"
    Environment = "dev"
  }
}
