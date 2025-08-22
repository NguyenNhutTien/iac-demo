resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-first-iac-bucket-12345-${var.env}"  # tên bucket unique toàn cầu
  acl    = "private"

  tags = {
    Name        = "MyFirstBucket"
    Environment = "dev"
  }
}

resource "aws_iam_user" "app_user" {
  name = "app-user"
}

resource "aws_iam_user_policy" "s3_access" {
  name = "app-user-s3-policy"
  user = aws_iam_user.app_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = [
          aws_s3_bucket.my_bucket.arn,
          "${aws_s3_bucket.my_bucket.arn}/*"
        ]
      }
    ]
  })
}
