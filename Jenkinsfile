pipeline{
    agent any
    
    tools{
      maven 'Maven'
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
		sh "mvn compile"
            }
        }
       stage('deploy'){
            steps{
		sh "mvn package"
		sh "java -jar target/hello-maven-1.0.jar"
            }
        }
    }
}
