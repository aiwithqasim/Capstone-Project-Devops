pipeline {
    agent any
    stages {
        stage('Install requirements') {
            steps {
                sh 'make install'
            }
        }
        stage('Lint files') {
            steps {
                sh 'make lint'
            }
        }
        stage('Build and upload to ECR') {
            steps {
                sh 'rm -f ~/.dockercfg'
                sh 'rm -f ~/.docker/config.json'
                script {
                    docker.withRegistry('https://119841056280.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:AwsCreds') {
                        def customImage = docker.build("nano-devops-05:latest")
                        customImage.push()
                    }
                }
            }
        }
        stage('Deploy to EKS') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AwsCreds',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} AWS_DEFAULT_REGION=us-east-1 aws ecs update-service --cluster NanoDevops05 --service helloWorld --force-new-deployment'
                }
            }
        }
    }
}
