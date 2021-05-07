# Httpd(Apache), Tomcat Load Balancing & Session Clustering with Docker
- Implementing a single web server and two Tomcat servers using Docker.
- 도커를 사용한 httpd-tomcat 이중화 서버 구현.

# Technologies Used
- docker & docker-compose
- apache, tomcat
- mod_jk, ajp/1.3

# Versions used in Dockerfile
- centos 7
- apache 2.4
- tomcat 9.0.45
- tomcat-connectors 1.2.48
- java-1.8.0-openjdk-devel.x86_64

# Configuration
- httpd/conf
- httpd/conf.d
- tomcat/conf1
- tomcat/conf2

These directories are mapped to configuration directory each container and the target directory is mapped to webapps directory each tomcat container.

# Used port
- ajp : 8009(tomcat1), 8019(tomcat2)
- tcp : 80(httpd), 8888(tomcat1), 9999(tomcat2)

# How to use
1. Locate your ROOT.war file in target directory.


2. Bring up one httpd and two tomcat server.
```shell
./network.sh up
```

3. Connect
- localhost : httpd
- localhost:8888 : tomcat1(direct)
- localhost:9999 : tomcat2(direct)

4. Bring down the network
```shell
./network.sh down
```

**options
- When your ROOT.war file is modified, restart tomcat servers.
```shell
./network.sh restartTomcat
```
- If you want to restart httpd
```shell
./network.sh restartHttpd
```