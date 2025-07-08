pipeline {
  agent any

  environment {
    ARTIFACTORY_URL = 'http://47.129.253.45:8082/artifactory'
    ARTIFACTORY_CRED = 'jfrog-u.name-u.passwd'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build & Test') {
      when {
//to run mvn command to create package
        branch 'master'
      }
      steps {
        dir('javaapp-tomcat') {
          sh 'mvn clean package'
        }
      }
    }

    stage('Test only for dev') {
//to only run mvn till test 
      when {
        branch 'dev'
      }
      steps {
        dir('javaapp-tomcat') {
          sh 'mvn clean test'
        }
      }
    }

    stage('Publish Artifact') {
      when {
        branch 'master'
      }
      steps {
        dir('javaapp-tomcat/target') {
          rtUpload(
            serverId: 'jfrog',
            spec: '''{
              "files": [
                {
                  "pattern": "*.war",
                  "target": "maven/com/artisantek/java-tomcat-21/1.0.0/"
                }
              ]
            }'''
          )
        }
      }
    }

    stage('Deploy to Tomcat') {
      when {
        branch 'master'
      }
      agent { label 'agent' } // your Tomcat server
      steps {
        dir('javaapp-tomcat/target') {
          withCredentials([usernamePassword(credentialsId: "${env.ARTIFACTORY_CRED}",
                                            usernameVariable: 'ART_USER',
                                            passwordVariable: 'ART_PASS')]) {
            sh '''
              echo "Downloading WAR from Artifactory..."
              curl -u $ART_USER:$ART_PASS -O "$ARTIFACTORY_URL/maven/com/artisantek/java-tomcat-21/1.0.0/java-tomcat-21-1.0.0.war"

              echo "Stopping Tomcat..."
              sudo systemctl stop tomcat

              echo "Deploying WAR..."
              sudo cp java-tomcat-21-1.0.0.war /home/ubuntu/tomcat9/webapps/ROOT.war

              echo "Starting Tomcat..."
              sudo systemctl start tomcat

              echo "Checking if Tomcat is running on port 9050..."
              sleep 5
              if ss -tulnp | grep -q ':9050'; then
                echo "Tomcat is listening on port 9050"
              else
                echo "Tomcat is NOT listening on port 9050"
                exit 1
              fi
            '''
          }
        }
      }
    }
    stage('Discord notification'){
     post {
    success {
      withCredentials([string(credentialsId: 'DISCORD_WEBHOOK', variable: 'DISCORD_URL')]) {
        sh '''
          curl -H "Content-Type: application/json" \
          -X POST \
          -d '{"content": " *Build Success!* Job: '${JOB_NAME}' #${BUILD_NUMBER}"}' \
          $DISCORD_URL
        '''
      }
    }
    failure {
      withCredentials([string(credentialsId: 'DISCORD_WEBHOOK', variable: 'DISCORD_URL')]) {
        sh '''
          curl -H "Content-Type: application/json" \
          -X POST \
          -d '{"content": "*Build Failed!* Job: '${JOB_NAME}' #${BUILD_NUMBER}"}' \
          $DISCORD_URL
        '''
      } 
    }
 }
    }
  }
}
