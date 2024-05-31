module "it_dev_prod_group" {
  source = "../../..//modules/group" #path to the terraform module
  
  group_name = "it_dev_prod"
  region = "us-east-1"
  policy_name = "it_dev_prod-new_managed_policies"
  policy_description = "it_dev_prod-group_policies"
  inline_policy_to_attach = data.aws_iam_policy_document.it_dev_prod_inline_policy.json
  managed_policies_to_attach = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    
    ]
}

data "aws_iam_policy_document" "it_dev_prod_inline_policy"{
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
      actions = [
        "ec2:*",
        "s3:*"
      ]
      resources = ["*"]
    }
}