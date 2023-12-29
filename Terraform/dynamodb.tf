##create dynamodb table for each event
resource "aws_dynamodb_table" "delivery" {
  name           = "Delivery"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "delivery_id"

  attribute {
    name = "delivery_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "adjustment" {
  name           = "Adjustment"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "adjustment_id"

  attribute {
    name = "adjustment_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "bonus" {
  name           = "Bonus"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "bonus_id"

  attribute {
    name = "bonus_id"
    type = "S"
  }
}