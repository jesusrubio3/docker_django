pipeline {
    agent none
    stages {
        stage("build and test the project") {
            agent {
                docker "python:3"
            }
            stages {
                stage('En el contenedor') {
            
                steps {
                            git branch: "main", url: 'https://github.com/jesusrubio3/docker_django.git'
                      }
                }
                stage('En el contenedorr') {
                steps {
                        sh 'pip install -r imagen/django_tutorial/requirements.txt'
                      }
                }
                stage('En el contenedorrr') {
                steps {
                        sh 'cd imagen/django_tutorial/ && python3 manage.py test'
                      }
                }
                
            }
        }
        stage("deploy in prodcution") {
            agent any
            stages {
                stage('En la máquina') {
                
                steps {
                    sh 'python3 --version'
                    }
                }
            }
        }
    }
}
