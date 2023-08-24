pipeline{
    agent any
    
    tools{
      maven 'Maven'
    }
    environment {
        registry = "albalochi/hello-maven"
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
           	sh 'docker build -t hello-maven-1.0.jar .'
            }
        }
       stage('deploy'){
            steps{
		sh "docker run hello-maven-1.0.jar"
            }
        }
    }
}
