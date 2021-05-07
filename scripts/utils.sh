#!/bin/bash

C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_BLUE='\033[0;34m'
C_YELLOW='\033[1;33m'

# Print the usage message
function printHelp() {
  USAGE="$1"
  if [ "$USAGE" == "up" ]; then
    println "Usage: "
    println "  network.sh \033[0;32mup\033[0m "
    println " Description: One httpd(apache) and Two tomcat are deployed"
  elif [ "$USAGE" == "restartTomcat" ]; then
    println "Usage: "
    println "  network.sh \033[0;32mrestartTomcat\033[0m "
    println " Description: restart two tomcat server"
  elif [ "$USAGE" == "restartHttpd" ]; then
    println "Usage: "
    println "  network.sh \033[0;32mrestartHttpd\033[0m "
    println " Description: restart one httpd(apache) server "
  else
    println "Usage: "
    println "  network.sh <Mode> "
    println "    Modes:"
    println "      \033[0;32mup\033[0m - Bring up One httpd(apache) and two tomcat server."
    println "      \033[0;32mrestartTomcat\033[0m - restart two tomcat server. The target directory is mapped to webapps"
    println "      \033[0;32mrestartHttpd\033[0m - restart httpd(apache) server."
    println "      \033[0;32mdown\033[0m - Bring down the network"
    println
    println " Examples:"
    println "   network.sh up "
    println "   network.sh restartTomcat "
    println "   network.sh restartHttpd "
    println "   network.sh down "
  fi
}

# println echos string
function println() {
  echo -e "$1"
}

# errorln echos i red color
function errorln() {
  println "${C_RED}${1}${C_RESET}"
}

# successln echos in green color
function successln() {
  println "${C_GREEN}${1}${C_RESET}"
}

# infoln echos in blue color
function infoln() {
  println "${C_BLUE}${1}${C_RESET}"
}

# warnln echos in yellow color
function warnln() {
  println "${C_YELLOW}${1}${C_RESET}"
}

# fatalln echos in red color and exits with fail status
function fatalln() {
  errorln "$1"
  exit 1
}

export -f errorln
export -f successln
export -f infoln
export -f warnln
