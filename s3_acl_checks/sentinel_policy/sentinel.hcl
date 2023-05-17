policy "s3_acl_checks" {
  source = "git::https://github.com/james-cole2015/tf_sentinel_repo/s3_acl_checks/sentinel_policy/sentinel.hcl"
  enforcement_level = "hard_mandatory"
}
