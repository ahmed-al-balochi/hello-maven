pipeline{
    agent any
    
    tools{
      maven 'Maven'
    }
    environment {
        registry = "albalochi/hello-maven"
        dockerImage = ''
    }
    stages{
       stage('test'){
            steps{
		sh "mvn clean"
		sh "mvn test"
            }
        }
       stage('build'){
            steps{
		sh "mvn package"
		script{
           	dockerImage = docker.build registry
		}
            }
        }
       stage('deploy'){
            steps{
		echo 'test'
		//sh "docker run hello-maven-1.0.jar"
            }
        }
    }
}
