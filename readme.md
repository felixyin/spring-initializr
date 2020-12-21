# spring-initializr

## 环境

- java11
- maven3.6
- nodejs12
- nohup

## 启动

`java -jar start-site-exec.jar`

浏览器访问：

- http://localhost:8080
- http://localhost:20001 (my machine)

## linux & macos 安装

```
mkdir -p ~/tools/
mkdir -p ~/bin/

cp -r ../spring-initializr ~/tools/

ln -s ~/tools/spring-initializr/start.sh ~/bin/si

sudo chmod 777 ~/tools/spring-initializr/start.sh

echo "配置环境变量: echo export PATH=$PATH:~/bin"
echo "使用： si"
```

## 手动编译最新版本

```
git clone https://github.com/spring-io/start.spring.io.git
cd sart.spring.io
# 修改端口号
# vi start.spring.io/start-site/src/main/resources/application.yml
# add server.port=端口
mvn clean package -Dmaven.test.skip=true
cd start.spring.io/start-site/target
```

注意事项：

1. mvn 下载慢解决，在 git clone 的 pom.xml 中修改：

```
	<repositories>
		<!-- 代码库 -->
		<repository>
			<id>maven-ali</id>
			<url>http://maven.aliyun.com/nexus/content/groups/public//</url>
			<releases>
				<enabled>true</enabled>
			</releases>
			<snapshots>
				<enabled>true</enabled>
				<updatePolicy>always</updatePolicy>
				<checksumPolicy>fail</checksumPolicy>
			</snapshots>
		</repository>
		<repository>
			<id>spring-snapshots</id>
			<name>Spring Snapshots</name>
			<url>https://repo.spring.io/libs-snapshot</url>
			<snapshots>
				<enabled>true</enabled>
			</snapshots>
		</repository>

	</repositories>

</project>
```

> 或将 setting.xml 配置到~/.m2/目录下

2. git clone 慢解决

```
git config --global http.proxy 'socks5://qtrj.i234.me:1080'
git config --global https.proxy 'socks5://qtrj.i234.me:1080'
```
