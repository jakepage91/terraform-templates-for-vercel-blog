terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "komiser"
    region = "REGION"
  }
}

provider "aws" {
  region = var.region
}