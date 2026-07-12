terraform {
  backend "s3" {
    bucket = "ofuru-terraform-state-072026"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}