pipelineJob("example-job-2") {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url("https://github.com/thabok/embeddedplatform-ccode-test")
                    }
                    branch("*/main")
                    extensions {
                        cleanBeforeCheckout()
                    }
                }
            }
            lightweight(true)
        }
    }
}