policy "s3_acl_check" {
  #source = "./s3_acl_check.sentinel"
  source = "git::https://github.com/james-cole2015/tf_sentinel_repo/s3_acl_checks/sentinel_policy/sentinel.hcl"
  #source = "git::https://github.com/hashicorp/sentinel-example.git//main.sentinel"
  enforcement_level = "hard_mandatory"
}
