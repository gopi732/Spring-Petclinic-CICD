pipeline {
    agent any
    environment {
        http_proxy = 'http://127.0.0.1:3128/'
        https_proxy = 'http://127.0.0.1:3128/'
        ftp_proxy = 'http://127.0.0.1:3128/'
        socks_proxy = 'socks://127.0.0.1:3128/'
    }
    stages{
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t saigopi123456/spring-petclinic:$BUILD_NUMBER .'
                }
            }
        }
        stage('Push image to DockerHub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub')]) {
                   sh 'docker login -u saigopi123456 -p ${dockerhub}'

}
                   sh 'docker push saigopi123456/spring-petclinic::$BUILD_NUMBER'
                }
            }
        }
    }
}
