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
                sh 'pip install -r imagen/django_tutorial/requirements.txt'
            }
        }
        stage('Test')
        {
            steps {
                sh 'python3 imagen/django_tutorial/manage.py imagen/django_tutorial/polls/test.py'
            }
        }
    }
}
