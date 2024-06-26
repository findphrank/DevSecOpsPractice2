resource "aws_iam_openid_connect_provider" "github_oidc_provider" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"]
}

# this will dynamically retrieve github thumbrpint

/*
data "tls_certificate" "github_thumbprint_latest" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

resource "aws_iam_openid_connect_provider" "github_oidc_fetch_cert" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github_thumbprint_latest.certificates[0].sha1_fingerprint]
  url             = "https://token.actions.githubusercontent.com"
}
*/