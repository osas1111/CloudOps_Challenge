resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "us-west-2-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }
}

# Should be enabled after bucket has been created
terraform {
  backend "s3" {
    bucket = "us-west-2-tfstate"
    key    = "cloud_ops/terraform.tfstate"
    region = "us-west-2"
  }
}
