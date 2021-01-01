#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
	}

	stages {

        stage('Unit Tests') {
            steps {
                echo 'Running Unit Tests...'
                runUnittests()
             }
        }

		stage('Build') {
			steps {
				echo 'Building...'
				buildApp()
			}
		}

        stage('Deploy') {
			steps {
				echo 'Deploying...'
				//deployApp()
			}
		}

		stage('UAT Test') {
			steps {
				echo 'Running UAT Tests...'
			}
		}

	}
}


def runUnitTests() {
    sh "pip3 install --user --no-cache-dir -r requirements.txt"
    sh "python3 ./v1/tests/unit_test.py"
}

def buildApp() {
	sh "docker-compose build --no-cache --force-rm"
}

def deployApp() {
	sh "docker-compose up -d"
}

def runUATTests() {
	sh "./v1/tests/uat_test.sh 8081"
}
