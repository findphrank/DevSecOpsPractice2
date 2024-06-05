remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "730335476873-terraform-state-file256" #"${get_aws_account_id()}-terraform-state-file256" this grabs account dynamically
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "frequolcloud-my-lock-table-config"
  }
}