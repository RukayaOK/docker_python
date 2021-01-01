#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
	}

	stages {

        	stage('Unit Tests') {
        		steps {
            			runUnittests()
			     }
		    }

		stage('Build') {
			steps {
			    

				echo 'Building..'
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
    sh "python3 ./v1/unit_test.py"
}
