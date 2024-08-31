resource "aws_s3_bucket" "terraform" {
  bucket        = "prav-terraform-tfstate"

  tags = {
    Name        = "terraform-bucket"
    Environment = var.env
  }
}


resource "aws_s3_bucket_acl" "terraform" {
#   depends_on = [aws_s3_bucket_ownership_controls.terraform]
  bucket = aws_s3_bucket.terraform.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "terraform" {
  bucket = aws_s3_bucket.terraform.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_ownership_controls" "terraform" {
#   bucket = aws_s3_bucket.terraform.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }
