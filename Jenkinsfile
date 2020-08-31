pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: packer
    image: bryandollery/terraform-packer-aws-alpine
    command: 
    - bash
    tty: true
"""
    }
  }
  environment {
   CREDS = credentials('fatima_aws_creds')
	    	AWS_ACCESS_KEY_ID = "$CREDS_USR"
        AWS_SECRET_ACCESS_KEY = "$CREDS_PSW"
	    	OWNER='omega'
	   	 PROJECT_NAME='omega-agent'
  }
  stages {
      stage("build") {
          steps {
              container('packer') {
		  sh '''
		    chmod +x provision.sh
                    packer build packer.json
			'''
              }
          }
      }
  }
  post {
    success {
	    echo 'AMI'  
    }
  }
}
