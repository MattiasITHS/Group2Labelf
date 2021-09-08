pipeline {
   agent any
  stages {
    stage('Checkout') {
       steps {
               git 'https://github.com/MattiasITHS/Group2Labelf'
          }
     }
stage ('Build') {
              steps {
                     bat "mvn compile"
                }
            }
     stage('newman') {
             steps {
                   sleep(20)
                     bat 'newman run  /Postman/Labelf.postman_collection.json --environment /Postman/LabelfProject.postman_environment.json'
                }
              post {
                    always {
                            junit '**/*xml'
                        }
                }
        }        
                   
 stage('Robot') {
            steps {
                //bat 'robot --variable BROWSER:headlesschrome -d Results Tests'
                 bat 'robot -d Results Tests'
            
            
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
                 
        }
}
}
