mock "tfconfig/v2" {
  module {
    source = "../../testdata/mock-tfconfig-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
