locals {
  new_staff = {
    "Emy_admin"      = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "Patty_eng"      = "arn:aws:iam::aws:policy/AdministratorAccess",
    "Frank_operator" = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }
}

locals {
  managed_policies = {
    security   = "arn:aws:iam::aws:policy/AdministratorAccess"
    devops     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
    compliance = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  }

  inline_policies = {
    security = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "ec2:*"
          Resource = "*"
        }
      ]
    })

    devops = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "s3:*"
          Resource = "*"
        }
      ]
    })

    compliance = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect   = "Allow"
          Action   = "cloudtrail:*"
          Resource = "*"
        }
      ]
    })
  }
}
