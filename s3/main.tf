resource "aws_s3_bucket" "home_assignment" {
  bucket = "${var.bucket_name}-${var.env}"

  tags = {
    Project     = "Quali"
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}