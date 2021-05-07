COMPOSE_FILE_TOMCAT=docker/docker-compose-tomcat.yml
COMPOSE_FILE_HTTPD=docker/docker-compose-httpd.yml

. scripts/utils.sh

function networkUp() {
  COMPOSE_FILES="-f ${COMPOSE_FILE_TOMCAT} -f ${COMPOSE_FILE_HTTPD}"
  docker-compose ${COMPOSE_FILES} up -d 2>&1
  docker ps -a
  if [ $? -ne 0  ]; then
    fatalln "Unable to start network"
  fi
}

function networkDown() {
  docker-compose -f $COMPOSE_FILE_TOMCAT $COMPOST_FILE_HTTPD down --volumes --remove-orphans
}

function restartTomcat() {
  docker-compose -f $COMPOSE_FILE_TOMCAT restart
}

function restartHttpd() {
  docker-compose -f $COMPOSE_FILE_HTTPD restart
}

## Parse mode
if [[ $# -lt 1 ]]; then
  printHelp
  exit 0
else
  MODE=$1
  shift
fi

# Determine mode of opertaion and printing out what we asked for
if [ "$MODE" == "up" ]; then
  infoln "Starting network"
elif [ "$MODE" == "down" ]; then
  infoln "Stopping network"
elif [ "$MODE" == "restartTomcat" ]; then
  infoln "Restarting tomcat netowrk"
elif [ "$MODE" == "restartHttpd" ]; then
  infoln "Restarting httpd netowrk"
else
  printHelp
  exit 1
fi

if [ "${MODE}" == "up" ]; then
  networkUp
elif [ "${MODE}" == "down" ]; then
  networkDown
elif [ "${MODE}" == "restartTomcat" ]; then
  restartTomcat
elif [ "${MODE}" == "restartHttpd" ]; then
  restartHttpd
else
  infoln "printHelp"
  exit 1
fi
