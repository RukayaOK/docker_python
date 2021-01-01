#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
		PATH = ${WORKSPACE}/venv/bin:${HOME}/.local/bin:${PATH}
	}

	stages {

        stage("Test - Unit tests") {
			steps { runUnittests() }
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
    sh "python3 -m venv venv"
    sh "source ./venv/bin/activate"
	sh "pip3 install --no-cache-dir -r ./requirements.txt"
	sh "python3 ./v1/tests/unit_test.py"
	sh "deactivate"
    sh "rm -r venv/""
}
