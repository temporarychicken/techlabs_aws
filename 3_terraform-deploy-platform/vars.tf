variable "region" {
  default = "eu-west-2"
}

provider "aws" {
  profile    = "default"
  region     = var.region
}

