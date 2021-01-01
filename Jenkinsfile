#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
	}

	stages {

        	stage('Unit Tests') {
        		steps {
            			echo 'Running Unit Tests'
            			runUnittests()
			     }
		    }

		stage('Build') {
			steps {
				echo 'Building..'
				buildApp()
			}
		}

		stage('Test') {
			steps {
				echo 'Testing..'
			}
		}

		stage('Deploy') {
			steps {
				echo 'Deploying....'
			}
		}

	}
}


def runUnittests() {
    sh "pip3 install --user --no-cache-dir -r requirements.txt"
    sh "python3 ./v1/tests/unit_test.py"
}

def buildApp() {
	sh "docker-compose build --no-cache --force-rm"
}