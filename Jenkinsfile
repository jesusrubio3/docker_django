pipeline {
    agent none
    stages {
        stage("build and test the project") {
            agent {
                docker { image 'python:3'
                args '-u root:root'
                       }
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
            environment {
                IMAGEN = "jesusrubiomartin/jenkins"
                USUARIO = 'USER_DOCKERHUB'
            }
            stages {
                stage('En la máquina') {
                
                steps {
                            git branch: "main", url: 'https://github.com/jesusrubio3/docker_django.git'
                      }
                }
                stage('En la máquinaa') {
                
                steps {
                script {
                    newApp = docker.build "$IMAGEN:$BUILD_NUMBER"
                }
            }

                }
                stage('En la máquinaaaa') {
                
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
    }
    post { 
        failure { 
            mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "jesusrubiomartin3@gmail.com";  
        }
    }
}
