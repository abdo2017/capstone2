pipeline {
     agent any
  environment{
    AWS_DEFAULT_REGION = "us-west-2"
    // DOCKERHUB_CREDENTIALS = credentials("docker-cred")
  }
   stages {
       stage('Build') {
            steps {
                sh 'echo Building...'
            }
       }
       stage('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
       }
       stage('Build Docker Image') {
            steps {
                sh 'docker build -t capstone-project-cloud-devops .'
            }
       }

       // stage("docker login") {
       //  steps {
       //    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
       //  }
       // }
       stage('Push Docker Image') {
            steps {
                withDockerRegistry([url: "", credentialsId: "docker-cred"]){
              // docker.withRegistry( '', registryCredential ) { 
                sh "docker tag capstone-project-cloud-devops abdoesam2011/capstone-project-cloud-devops"
                sh 'docker push abdoesam2011/capstone-project-cloud-devops'
              }
            }
       }
       stage('Deploying') {
            steps{
                echo 'Deploying to AWS...'
                withAWS(credentials: 'aws-cred', region: 'us-west-2') {
                    sh "aws eks --region us-west-2 update-kubeconfig --name CapstoneEKS-UEdB71F8J2DZ"
                    sh "kubectl set image deployments/capstone-project-cloud-devops capstone-project-cloud-devops=abdoesam2011/capstone-project-cloud-devops:latest"
                    sh "kubectl apply -f deployment/deployment.yml"
                    sh "kubectl get nodes"
                    sh "kubectl get deployment"
                    sh "kubectl get pod -o wide"
                    sh "kubectl get service/capstone-project-cloud-devops"
                }
            }
      }
      stage("Cleaning up") {
            steps{
                  echo 'Cleaning up...'
                  sh "docker system prune"
            }
      }
   }
}
