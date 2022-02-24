pipeline {
    agent none
    stages {
        stage("build and test the project") {
            agent { docker { image 'python:3' args '-u root:root' }
            stages {
                stage('Clone') {
                    steps {
                            git branch: "main", url: 'https://github.com/jesusrubio3/docker_django.git'
                          }
                    }
                stage('Install') {
                    steps {
                        sh 'pip install -r imagen/django_tutorial/requirements.txt'
                           }
                    }
                stage('Test') {
                    steps {
                        sh 'cd imagen/django_tutorial/ && python3 manage.py test'
                          }
                    }    
                }
            }
        }
    }
}
