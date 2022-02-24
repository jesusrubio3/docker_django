pipeline {
    agent none
    stages {
        stage("build and test the project") {
            agent {
                docker { image 'python:3'
                args '-u root:root'
            }
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
        stage("deploy in prodcution") {
            environment {
        IMAGEN = "jesusrubiomartin/jenkins"
        USUARIO = 'USER_DOCKERHUB'
    }
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: "main", url: 'https://github.com/jesusrubio3/docker_django.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    newApp = docker.build "$IMAGEN:$BUILD_NUMBER"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image("$IMAGEN:$BUILD_NUMBER").inside('-u root') {
                           sh 'apache2ctl -v'
                        }
                    }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry( '', USUARIO ) {
                        newApp.push()
                    }
                }
            }
        }
        stage('Clean Up') {
            steps {
                sh "docker rmi $IMAGEN:$BUILD_NUMBER"
                }
        }
    }
}
