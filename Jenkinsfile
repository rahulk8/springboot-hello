pipeline {
    agent any 
   
    stages {
        stage('Compile and Clean') { 
            steps {
                // Run Maven on a Unix agent.
              
                sh "mvn clean compile"
            }
        }
       
        stage('Packaging App') { 
            
            steps {
                sh "mvn package"
            }
        }
        stage('Build Docker image'){
          
            steps {
                echo "Hello Building docker image of the app"
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

        stage('Delete all previous containers'){
            steps {
                   sh 'docker rm -fv $(docker ps -aq)'
               // sh 'docker run -itd -p  8084:8080 rahul9711/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        
        stage('Docker deploy'){
            steps {
               
                sh 'docker run -itd -p  8084:8080 rahul9711/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Archving..') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}



