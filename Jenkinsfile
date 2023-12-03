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
                    withCredentials([usernamePassword(credentialsId: '4df75748-9cc3-4707-ab16-dad1f37dbf0e', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
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
