# 01. 개발을 위한 준비



```
★ 사용 개발 환경
	1) IDE: Intellij
	2) 빌드 관리 도구	: Gradle
	3) JDK Versoin : 1.8.0
```



### 1.2. 스프링 프로젝트 생성

```
★ 프로젝트 기본 생성
	New Project 
    	└ Gradle
            ├ SDK   : 1.8
            └ Check : java, Web
                ├ Name : 이름 입력
                ├ Location : 폴더 선택
                └ Artifact Coordinates
                           ├ GroupID : org.[NAME]
                           ├ ArtifacID : [Name]
                           └ version : [Default]
```

```groovy
파일명: build.gradle 

dependencies {
    //Junit
    testImplementation 'junit:junit:4.11'
    testImplementation 'org.junit.jupiter:junit-jupiter-api:5.7.0'
    testRuntimeOnly 'org.junit.jupiter:junit-jupiter-engine:5.7.0'
    testRuntimeOnly 'org.junit.vintage:junit-vintage-engine:5.1.0'

    //spring
    implementation group: 'org.springframework', name: 'spring-context', version: '5.0.7.RELEASE'
    implementation group: 'org.springframework', name: 'spring-test', version: '5.0.7.RELEASE'
    implementation group: 'org.springframework', name: 'spring-webmvc', version: '5.0.7.RELEASE'

    //lombok
    compileOnly 'org.projectlombok:lombok:1.18.20'
    annotationProcessor 'org.projectlombok:lombok:1.18.20'
    testCompileOnly 'org.projectlombok:lombok:1.18.20'
    testAnnotationProcessor 'org.projectlombok:lombok:1.18.20'

    //log4j
    implementation group: 'log4j', name: 'log4j', version: '1.2.17'
}
```

#### Lombok 컴파일 환경 설정

Setting -> build -> Compiler -> Annotation Processors -> Check 'Enable annotaion processing'



#### Log4j 환경설정

- 경로
  	src/main/resources/log4j.properties
  	src/test/resources/log4j.properties

- 내용

```
log4j.properties
log4j.rootLogger=INFO, stdout

#Direct log message to stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.Target=System.out
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern= %-5p %c{1}:%L - %m%n
```



### 1.3. Tomcat을 이용한 프로젝트 실행 확인

Edit Configurations... -> + -> TomcatServer -> local -> Tomcat 9.0.45



### 1.4. XML 파일 생성

```
생성할 파일
root-context.xml
servlet-context.xml

폴더 구조
src/webapp/WEB-INF/spring/appServlet/root-context.xml
src/webapp/WEB-INF/spring/servlet-context.xml
```



servlet\-context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

    <mvc:annotation-driven/>
    <context:component-scan base-package="com.spring.controller" />
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/" />
        <property name="suffix" value=".jsp" />
    </bean>
</beans>
```



root-context.xml

```xaml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

</beans>
```



web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/spring/root-context.xml</param-value>
    </context-param>
    
    <!-- Creates the Spring container shared by all Servlets and Filters -->
    <listener>
        <listener-class>
            org.springframework.web.context.ContextLoaderListener
        </listener-class>
    </listener>
    
    <!-- Processes application requests -->
    <servlet>
        <servlet-name>appServlet</servlet-name>
        <servlet-class>
            org.springframework.web.servlet.DispatcherServlet
        </servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    
    <servlet-mapping>
        <servlet-name>appServlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
```
