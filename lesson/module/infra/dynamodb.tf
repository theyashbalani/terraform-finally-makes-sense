resource "aws_dynamodb_table" "remote-backend-dynamodb" {
  name         = "${var.env}-fking-dynamodb"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = var.hash_key
    type = "S"
  }
  hash_key = var.hash_key

  tags = {
    Name        = "${var.env} Terraform DynamoDB"
    Environment = var.env
  }
}
