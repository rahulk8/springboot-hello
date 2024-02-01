pipeline {
   agent any 
    /* tools {
        //maven "3.9.6"
        mavenHome = tool name: 'myMaven' , type: 'maven'
    
    } */
    
    stages {
       stage('Prepare environment') { 
            steps {
                echo 'Initialize the variables'
                def mavenHome = tool name: 'myMaven' , type: 'maven'
            }
        }
        stage('Compile and Clean') { 
            steps {
                // Run Maven on a Unix agent.
              
                sh "mvn clean compile"
            }
        }
        stage('deploy') { 
            
            steps {
                sh "mvn package"
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Hello Java Express"
                sh 'ls'
                sh 'docker build -t  rahul9711/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u rahul9711 -p ${Dockerpwd}"
                }
            }                
        }
        stage('Docker Push'){
            steps {
                sh 'docker push rahul9711/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Docker deploy'){
            steps {
               
                sh 'docker run -itd -p  8081:8080 rahul9711/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Archving..') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}



