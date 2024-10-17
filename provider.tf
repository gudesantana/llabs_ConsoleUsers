provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.aws_region
  profile    = var.aws_profile
  # # shared_credentials_files = ["/.aws/credentials"]
  # shared_config_files      = ["C:\".aws"\config"]
  # shared_credentials_files = ["C:\".aws"\credentials"]
}