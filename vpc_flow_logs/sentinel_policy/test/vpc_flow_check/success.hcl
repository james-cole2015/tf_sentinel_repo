mock "tfconfig/v2" {
  module {
    source = "../../testdata/mock-tfconfig-success.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
