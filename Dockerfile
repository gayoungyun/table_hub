# Tomcat 기반 이미지를 사용
FROM tomcat:9.0-jdk11-openjdk-slim

# WAR 파일을 Tomcat의 webapps 디렉토리에 복사
COPY target/root-1.0.0-BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

COPY server.xml /usr/local/tomcat/conf/server.xml
COPY context.xml /usr/local/tomcat/conf/context.xml

# Tomcat의 기본 포트 8080을 열기
EXPOSE 8080

# Tomcat이 기본적으로 시작되도록 설정
CMD ["catalina.sh", "run"]