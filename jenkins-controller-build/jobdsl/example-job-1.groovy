pipelineJob("example-job-1") {
    definition {
        cps {
            script('''
            pipeline {
                agent {
                    docker { image 'node:16.13.1-alpine' }
                }
                stages {
                    stage('Test') {
                        steps {
                        sh 'node --version'
                        }
                    }
                }
            }
            '''.stripIndent())
            sandbox()
        }
    }
}