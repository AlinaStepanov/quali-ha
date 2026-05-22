terraform {
  backend "s3" {
    bucket         = "quali-terraform-state-alina"
    key            = "quali/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "quali-terraform-locks"
    encrypt        = true
  }
}