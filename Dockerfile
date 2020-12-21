FROM qtrj.i234.me:8084/centos:7

WORKDIR /opt

ENV JAVA_HOME=/etc/alternatives/java_sdk_11

# 加速maven下载
RUN mkdir -p /root/.m2/repository
ADD settings.xml ~/.m2
ADD settings.xml /root/.m2


RUN yum install java-11-openjdk-devel git node -y && curl --silent --location https://rpm.nodesource.com/setup_12.x | bash - && yum install nodejs -y  

RUN curl https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz | tar xvz -C /opt/ --exclude="*.cmd" --exclude="docs" --exclude="example" --exclude="licenses" \
    && ln -s /opt/apache-maven-3.6.0/bin/mvn /bin/mvn 

# 加快下载速度
RUN git config --global http.proxy 'socks5://qtrj.i234.me:1080' && git config --global https.proxy 'socks5://qtrj.i234.me:1080' \
    && git clone https://github.com/spring-io/start.spring.io.git /opt/site 

RUN cd /opt/site && mvn -B install -Dmaven.test.skip=true \
    && cd /opt/site/start-site  && mvn -B package -Dmaven.test.skip=true \
    && mv target/start-site.jar /opt/app.jar \
    && cd /opt && rm -rf ~/.m2/ /opt/site/ /bin/mvn /opt/apache-maven* 

RUN yum remove git -y && yum autoremove -y \
    && yum clean all && rm -rf /tmp/* && rm -rf /usr/share/doc/ && rm -rf /usr/share/man

CMD ["/etc/alternatives/java_sdk_11/bin/java","-jar","/opt/app.jar"]