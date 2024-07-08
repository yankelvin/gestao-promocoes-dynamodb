provider "aws" {
  region = "us-east-2"
}

module "dynamodb" {
  source = "./dynamodb"
}

