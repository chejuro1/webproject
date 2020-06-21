node {
    checkout scm

    def customImage = docker.build("chejuro:${env.BUILD_ID}")
    customImage.push()

    customImage.push('latest')
     testImage.inside {
        sh 'make test'
    }
    
}
