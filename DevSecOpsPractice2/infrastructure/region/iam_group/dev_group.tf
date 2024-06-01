module "dev_group" {
  source = "../../..//modules/group" #path to the terraform module
  
  group_name = "dev_hr"
  region = "us-east-1"
  policy_name = "dev-new_managed_policies"
  policy_description = "dev-group_policies"
  inline_policy_to_attach = data.aws_iam_policy_document.dev_inline_policy.json
  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    
    ]
}

data "aws_iam_policy_document" "dev_inline_policy"{
    statement {
      sid = ""
      actions = [
        "cloudtrail:*",
        "cloudwatch:*"
      ]
      resources = ["*"]
    }

    statement {
      sid = ""
      actions = ["*"]
      resources = ["*"]
    }
}