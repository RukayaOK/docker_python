#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
		PATH = "$PATH:/usr/local/bin"
	}

	stages {

        stage('Unit Tests') {
            steps {
                echo 'Running Unit Tests...'
                runUnitTests()
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
				deployApp()
			}
		}

		stage('UAT Test') {
			steps {
				echo 'Running UAT Tests...'
				runUATTests()
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
    sh "chmod u+x uat_test.sh"
	sh "./v1/tests/uat_test.sh 8081"
}