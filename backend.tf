terraform {
  backend "s3" {
    bucket         = "tien-terraform-backend-bucket"       # Tên bucket S3 (global unique)
    key            = "terraform.tfstate"     # "đường dẫn" trong bucket
    region         = "ap-southeast-1"            # Region của bucket
    dynamodb_table = "terraform-locks"           # DynamoDB table để lock
    encrypt        = true                        # Bật SSE cho file state
  }
}
