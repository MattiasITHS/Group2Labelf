pipeline {
   agent any
  stages {
    stage('Checkout') {
       steps {
               git 'https://github.com/SubhashiniPenumatsa/Group2Labelf'
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
							bat 'newman run  petclinic.postman_collection.json --environment petclinic.postman_environment.json --reporters junit'
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

