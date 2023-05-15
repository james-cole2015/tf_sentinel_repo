mock "tfconfig/v2" {
    module {
        source = "../../testdata/mock-tf-config-success.sentinel"
    }
}

test {
    rules = {
        main = true
    }
}
