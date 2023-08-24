pipeline{
    agent any
    
    tools{
      maven 'Maven'
    }
    environment{
	dockerhubToken = credentials('dockerhub_pass')
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
		sh 'docker tag hello-maven-1.0.jar:v1 albalochi/hello-maven-1.0.jar:v1'
            }
        }
       stage('deploy'){
            steps{
        	sh "docker login -u albalochi -p ${dockerhubToken}"
        	sh 'docker push albalochi/hello-maven-1.0.jar:v1'
		sh 'docker logout'
		sh "docker run hello-maven-1.0.jar"
            }
        }
    }
}
