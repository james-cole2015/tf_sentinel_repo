mock "tfconfig/v2" {
    module {
        source = "../../testdata/mock-tf-config-failure.sentinel"
    }
}

test {
    rules = {
        main = false
    }
}
