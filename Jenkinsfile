#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = ${WORKSPACE}
		PATH = ${WORKSPACE}/venv/bin:${HOME}/.local/bin:${PATH}
	}

	stages {

        	stage('build') {
        		steps {
            			withEnv(["HOME=${env.WORKSPACE}"]) {
            								sh script:'''
									    #/bin/bash
									    echo "PATH is: $PATH"
									      python3 --version
									      python3 -m pip3 install --upgrade pip --user
									      ls
									      pip3 install --user -r requirements.txt
									      export PATH="$WORKSPACE/.local/bin:$PATH"
                               						 '''
			    }
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
    sh "python3 -m venv venv"
    sh "source ./venv/bin/activate"
	sh "pip3 install --no-cache-dir -r ./requirements.txt"
	sh "python3 ./v1/tests/unit_test.py"
	sh "deactivate"
    sh "rm -r venv/""
}
