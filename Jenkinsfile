pipeline {
    agent {
        docker { image 'python:3'
        args '-u root:root'
        }
    }
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/jesusrubio3/docker_django.git'
            }
        }
        stage('Install') {
            steps {
                sh "ls -la && cat requirements.txt"
            }
        }
        stage('Test')
        {
            steps {
                sh 'python3 manage.py test'
            }
        }
    }
}
