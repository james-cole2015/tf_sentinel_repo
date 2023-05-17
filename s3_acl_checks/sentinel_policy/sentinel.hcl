policy "s3_acl_checks" {
  source = "./s3_acl_checks/sentinel_policy/s3_acl_check.sentinel"
  enforcement_level = "hard_mandatory"
}
