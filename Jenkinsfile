pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
               sh """ git checkout $BUILD_BRANCH
                git pull
                # npm install
                # npx nx show projects --affected --base=origin/master
                """
            }
        }
        stage('Test'){
          steps{
            script {
                doDynamicParallelSteps()
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

def doDynamicParallelSteps(){
  tests = [:]
  for (f in ['abc','efg','wks']) {

    def var = "${f}"
    tests[var] = {
      node {
        stage("test "+var) {
          echo var
        }
      }
    }
  }
  parallel tests
}