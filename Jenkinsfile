pipeline{
    agent any
    
    tools{
      maven 'Maven'
    }
	
    stages{
       stage('prep'){
            steps{
		echo "prep"
		sh "mvn validate"
            }
        }
       stage('build'){
            steps{
		echo "build"
            }
        }
       stage('deploy'){
            steps{
		echo "deploy"
            }
        }
    }
}
