pipeline {
   agent { label "docker" }
   stages {
        stage ('Watcher.Server - Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/release']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'bd77fbbe-d091-4d05-99bf-995f9c3bea79', url: 'git@github.com:lenchis001/Watcher.Server.git']]]) 
            }
        }
        stage ("Build image") {
            steps {
                sh "docker image build -t leon1996/watcher-${ENV}:0.${BUILD_NUMBER} ."
            }
        }
        stage ("Stop and remove old version") {
            steps {
                sh "docker container stop watcher-${ENV} || true && docker container rm watcher-${ENV} || true"
            }
        }
        stage("Deploy new version") {
           steps {
               script {
                   int port=0
                   switch(ENV) {            
                    case "dev": 
                        port=4009 
                        break; 
                    case "qa": 
                        port=4008 
                        break; 
                    case "prod": 
                        port=4007
                        break; 
                    }

                    sh "docker container run -d --name watcher-${ENV} -p ${port}:80 -e DATABASE_SERVER_ADDRESS=`docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' watcher-${ENV}-mysql` --net watcher --restart=unless-stopped leon1996/watcher-${ENV}:0.${BUILD_NUMBER} "
                }
           }
       }
   }
}