policy "s3_acl_checks" {
  source = "./s3_acl_check.sentinel"
  enforcement_level = "hard-mandatory"
}
