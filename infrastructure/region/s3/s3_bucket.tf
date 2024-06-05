module "s3_bucket" {
  source = "../../..//modules/s3"
  region = "us-east-1"
  bucket_name = "newbatch-testing-for-dev26"

}