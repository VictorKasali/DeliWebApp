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
                    withCredentials([usernamePassword(credentialsId: '38291d95-cbe0-4b98-ab8a-4b1c63d36ec7', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        docker.withRegistry('https://registry.hub.docker.com', 'your-credentials-id') {
                            def app = docker.build("victork01/deliwebapp")
                            app.push("latest")
                        }
                    }
                }
            }
        }
    }
}
