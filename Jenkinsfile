pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "saigopi123456/spring-petclinic"
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }
    stages{
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t $DOCKER_HUB_REPO:$BUILD_NUMBER .'
                }
            }
        }
        stage('Push image to DockerHub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub')]) {
                   sh 'docker login -u saigopi123456 -p ${dockerhub} && sh 'docker push $DOCKER_HUB_REPO:$BUILD_NUMBER''

}
                }
            }
        }
    }
}
