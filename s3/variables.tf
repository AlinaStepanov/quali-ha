variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "env" {
  type        = string
  description = "Deployment environment (e.g., dev, prod)"
}