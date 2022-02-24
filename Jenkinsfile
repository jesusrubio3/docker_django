pipeline {
    agent {
        docker { image 'python:3'
        args '-u root:root'
        }
    }
    stages {
        stage('Clone') {
            steps {
                 git branch: "main", url: 'https://github.com/jesusrubio3/docker_django.git'
            }
        }
        stage('Venv') {
            steps {
                 sh 'export NAME_USER_PYTHON="admin" PASSWD_USER_PYTHON="admin" HOST_BM_DATABASE="servidor_mariadb" NAME_DB_PYTHON="django"' 
            }
        }
        stage('pr') {
            steps {
                sh 'echo $NAME_DB_PYTHON'
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
                sh 'cd imagen/django_tutorial/ && python3 manage.py test'
            }
        }
    }
}
