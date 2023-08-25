# hello-maven

An mvn-based HelloWorld with JUnit tests, Jenkinsfile, and Docker.

# Prerequsites for usage with Jenkinsfile:
1. Jenkins installed and configured.
2. Install OpenJDK 17.
3. Docker installed and configured.
4. Allow Jenkins user to have permission to execute Docker commands.

# Dockerfile
Let me breakdown my Dockerfile
```
FROM openjdk:17                                      <-- using OpenJDK 17 for our project 
ADD target/hello-maven-1.0.jar hello-maven-1.0.jar   <-- adding the project package to the docker image
ENTRYPOINT ["java", "-jar","hello-maven-1.0.jar"]    <-- specifying the executable for the docker image.
```

# Using Jenkinsfile to automate the build and deployment of the project.
After creating the Jenkins pipeline it should detect the project's Jenkinsfile.
Here is a breakdown of the Jenkinsfile:
```
pipeline{
    agent any // <-- it can run on any agent or node
    
    tools{
      maven 'Maven'  // <-- declaring maven to be used in the pipeline
    }
    environment{
	dockerhubToken = credentials('dockerhub_pass') // <-- environment variable used to upload docker image to dockerhub
    }
	
    stages{
       stage('test'){ // < -- first stage in the pipeline
            steps{
		sh "mvn clean"   // <-- cleaning any previous build of the project
		sh "mvn test"    // <-- testing the project
            }
        }
       stage('build'){
            steps{
		sh "mvn package"                                // <-- building the project as a package
                sh 'docker build -t hello-maven-1.0.jar .'      // <-- Building the Docker image from the Dockerfile
		sh 'docker tag hello-maven-1.0.jar:v1 albalochi/hello-maven-1.0.jar:v1' //<-- tagging the docker image
            }
        }
       stage('deploy'){
            steps{
        	sh "docker login -u albalochi -p ${dockerhubToken}"  // <--using my credentials to login into dockerhub
        	sh 'docker push albalochi/hello-maven-1.0.jar:v1'    // <-- pushing the docker image to docker hub
		sh 'docker logout'                                          // <-- logging out of docker hub
		sh "docker run hello-maven-1.0.jar"                        // <-- deploying the dockerimage on the host
            }
        }
    }
}

```

# Maven usage

| To do this | Do this |
| -----------|-----------|
| check that edits to the pom.xml file are valid | Type `mvn validate` |
| clean up so you can recompile everything  | Type `mvn clean` |
| edit the source code for the app | edit files in `src/main/java`.<br>Under that the directories for the package are `edu/ucsb/cs56/pconrad`  |
| edit the source code for the app | edit files in `src/test/java`.<br>Under that the directories for the package are `edu/ucsb/cs56/pconrad`  |
| compile    | Type `mvn compile` |
| run junit tests | Type `mvn test` |
| build the website, including javadoc | Type `mvn site` then look in either `target/site/apidocs/index.html` or `docs/apidocs/index.html` |
| make a jar file | Type `mvn package` and look in `target/hello-maven-1.0.jar` |
| run the main in the jar file | Type `java -jar target/hello-maven-1.0.jar` |
| change which main gets run by the jar | Edit the `<mainClass>` element in `pom.xml` |

* [javadocs](https://ucsb-cs56-pconrad.github.io/hello-maven/apidocs/)
* [site docs](https://ucsb-cs56-pconrad.github.io/hello-maven/)
