policy "s3_acl_checks" {
  source = "./s3_acl_checks/sentinel_policy/sentinel.hcl"
  enforcement_level = "hard_mandatory"
}
