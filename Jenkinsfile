pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // This assumes that you have a Maven project and the Jenkins Maven Plugin installed
                sh 'mvn clean install'
            }
        }
        stage('Docker Build and Push') {
            steps {
                script {
                    docker.build("your-app").push("latest")
                }
            }
        }
    }
}
