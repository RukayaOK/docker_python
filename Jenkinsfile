#!/usr/bin/groovy
pipeline {
	agent any

	environment {
		PYTHONPATH = "${WORKSPACE}"
	}

	stages {

        	stage('build') {
        		steps {
            			withEnv(["HOME=${env.WORKSPACE}"]) {
            								sh script:'''
									    #/bin/bash
									    echo "PATH is: $PATH"
									      python3 --version
									      ls
									      export PATH="$WORKSPACE/.local/bin:$PATH"
                               						 '''
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
