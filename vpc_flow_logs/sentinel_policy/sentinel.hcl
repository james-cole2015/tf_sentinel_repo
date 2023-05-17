policy "vpc_flow_log_check" {
  source = "./vpc_flow_check.sentinel"
  enforcement_level = "hard-mandatory"
}
