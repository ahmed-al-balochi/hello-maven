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
            }
        }
    }
}
