# spring-initializr

## 环境

- java11
- nodejs12

## 启动

java -jar start-site-exec.jar

## 手动编译最新版本


注意事项：

1. mvn 下载慢解决，在git clone的pom.xml中修改：
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
> 或将setting.xml配置到~/.m2/目录下

2. git clone慢解决
git config --global http.proxy 'socks5://qtrj.i234.me:1080' && git config --global https.proxy 'socks5://qtrj.i234.me:1080'

