#!groovy
def affectedProjects = []

pipeline {
    agent any

    stages {
        stage('Check files') {
            steps {
                script {
                    def output = sh(script: 'ls', returnStdout: true).trim()
                    echo "Output: ${output}"
                }
            }
        }


        stage('Init') {
            steps {
               sh """ git checkout $BUILD_BRANCH
                git pull
                npm ci
                """

                script {
                    affectedProjects =  sh(returnStdout:true, script: "npx nx show projects --affected --base=origin/master").trim().split('\n').toList()

                    println(affectedProjects);
                }
            }
        }
        stage('Build'){
          steps{
            script {
                doDynamicParallelSteps(affectedProjects)
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

def doDynamicParallelSteps(affectedProjects){
  build = [:]
  for (pro in affectedProjects) {
    def var = "${pro}"
    build[var] = {
      node {
        stage("build ${var}") {
            sh """ git checkout $BUILD_BRANCH
                git pull
                npm ci
                """
            pwd
            echo " npx nx build ${var}"
            sh " npx nx build ${var}"
        }
      }
    }
  }
  parallel build
}