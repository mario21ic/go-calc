pipeline {

  agent any
  //agent {
  //  docker { image 'golang:1.17-alpine' }
  //}

  options {
  //  ansiColor('xterm')
  //  timestamps()
    timeout(time: 1, unit: 'HOURS')
  }

  parameters {
    string(name: 'ENV', defaultValue: 'prod', description: 'Example dev, qa, etc')
    string(name: 'aws_credentials', defaultValue: 'aws-access', description: 'AWS credentials')
    booleanParam(name: 'DEPLOY', defaultValue: false, description: 'Upload the Docker image')
  }

  environment {
    SLACK_MESSAGE = "Job '${env.JOB_NAME}' Build ${env.BUILD_NUMBER} URL ${env.BUILD_URL}"
  }

  stages {
    stage ('Repository') {
      steps {
        checkout scm
      }
    }

    stage("Docker") {
      //when {
      //  branch 'main'
      //}
      steps {
        echo "Building for Env ${params.ENV}"
        //sh "make docker ${env.BUILD_NUMBER}"
        sh "./docker-build.sh ${env.BUILD_NUMBER}"
      }
    }

    stage("Upload") {
      when {
        expression {
          params.DEPLOY ==~ /(?i)(Y|YES|T|TRUE|ON|RUN)/
        }
      }
      steps {
          echo "TODO: add docker credentials"
          echo "docker login"
          sh "docker push mario21ic/go-calc:${env.BUILD_NUMBER}"
          echo "docker logout"
      }
    }

  }

  post {
    always {
      echo "Job has finished"
    }
  }
}
