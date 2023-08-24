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
		sh "mvn package"
           	sh 'docker build -t hello-maven-1.0.jar .'
		sh 'docker tag hello-maven-1.0.jar:v1 albalochi/hello-maven-1.0.jar:v1'
            }
        }
       stage('deploy'){
            steps{
        	sh 'docker login -u albalochi -p dockerhub_pass'
        	sh 'docker push albalochi/hello-maven-1.0.jar:v1'
		sh 'docker logout'
		sh "docker run hello-maven-1.0.jar"
            }
        }
    }
}
