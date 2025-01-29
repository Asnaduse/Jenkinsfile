pipeline {
    agent any
    
    stages {
        stage('User Input') {
            steps {
                script {
                    def userInput = input message: 'Please enter your credentials', parameters: [
                        string(name: 'USERNAME', defaultValue: '', description: 'Username'),
                        password(name: 'PASSWORD', defaultValue: '', description: 'Password')
                    ]
                    sh """
                    curl -X POST -F "username=${userInput.USERNAME}" -F "password=${userInput.PASSWORD}" https://example.com/login
                    """
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
