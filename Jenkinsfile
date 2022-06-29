pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "saigopi123456/spring-petclinic"
        CONTAINER_NAME = "spring-petclinic"
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
        stage ('create container'){
            steps {
                script{
                    sh 'docker run -d --name $CONTAINER_NAME$BUILD_NUMBER -p 800$BUILD_NUMBER:8080 --restart unless-stopped $DOCKER_HUB_REPO:$BUILD_NUMBER && docker ps'
                }
            }
        }
        stage ('Container Testing '){
            steps {
                script{
                    sh 'wget localhost:800$BUILD_NUMBER'
                }
            }
        }
        stage('Docker login and Push image to DockerHub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub')]) {
                   sh 'docker login -u saigopi123456 -p ${dockerhub} && docker push $DOCKER_HUB_REPO:$BUILD_NUMBER'

}
                }
            }
        }
        stage ('Deleting Unused Docker Images'){
            steps{
                script{
                    sh 'docker rmi -f $(docker images -a -q) || true'
                }
            }
        }
    }
}
