#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
	}

	stages {

        	stage('build') {
        		steps {
            			echo 'build..'
			    }
			}
		    }

		stage('Build') {
			steps {
			    runUnittests()

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
    sh "pip3 install --user -r requirements.txt"
}
