## Chapter 07. 스프링 MVC프로젝트의 기본 구성(실습)



### 예제 프로젝트 구성

- Build.Gradle

  ```groovy
  plugins {
      id 'java'
      id 'war'
  }
  
  group 'com.spring'
  version '1.0-SNAPSHOT'
  
  repositories {
      mavenCentral()
  }
  
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
  
      // hikari
      implementation 'com.zaxxer:HikariCP:4.0.3'
  
      // mysql
      implementation group: 'mysql', name: 'mysql-connector-java', version: '8.0.23'
  
      // mybatis
      implementation group: 'org.mybatis', name: 'mybatis', version: '3.5.7'
  
      // mybatis spring
      implementation group: 'org.mybatis', name: 'mybatis-spring', version: '2.0.6'
  
      // spring-tx
      implementation group: 'org.springframework', name: 'spring-tx', version: '5.0.7.RELEASE'
  
      // spring jdbc
      implementation group: 'org.springframework', name: 'spring-jdbc', version: '5.0.7.RELEASE'
  
      // log4jdbc
      implementation group: 'org.bgee.log4jdbc-log4j2', name: 'log4jdbc-log4j2-jdbc4.1', version: '1.16'
  
      // javax servlet api
      implementation group: 'org.glassfish', name: 'javax.servlet', version: '3.1'
      compileOnly group: 'javax.servlet', name: 'javax.servlet-api', version: '3.1.0'
  
  
      // jackson databind
      implementation group: 'com.fasterxml.jackson.core', name: 'jackson-databind', version: '2.12.3'
  
      // commons fileupload
      implementation group: 'commons-fileupload', name: 'commons-fileupload', version: '1.4'
  
      // commons io
      implementation group: 'commons-io', name: 'commons-io', version: '2.9.0'
      
      //commons logging
  	implementation group: 'commons-logging', name: 'commons-logging', version: '1.2'
      
      // jstl
      implementation group: 'javax.servlet', name: 'jstl', version: '1.2'
  
  }
  
  test {
      useJUnitPlatform()
  }
  ```

  

- DB 구성

  ```mysql
  #database utf8 설정
  create database ex02 default character set utf8;
  
  #데이터베이스의 사용자 생성 (localhost : 로컬, % : 외부 접속용)
  create user '[USERID]'@'localhost' identified by '[PASSWD]';
  create user '[USERID]'@'%' identified by '[PASSWD]';
  
  #사용자에게 데이터베이스 권한 부여.
  GRANT ALL PRIVILEGES ON [DBNAME].* TO [USERID]@'%';
  GRANT ALL PRIVILEGES ON [DBNAME].* TO [USERID]@'localhost';
  
  # 권한 확인
  show grants for [USERID]@'%';
  show grants for [USERID]@'localhost';
  
  # 테이블 생성
  CREATE TABLE tbl_board (
  	bno INT NOT NULL auto_increment primary key,
      title varchar(200) not null,
      content varchar(2000) not null,
      writer varchar(50) not null,
      regdate datetime default current_timestamp,
      updatedate datetime default current_timestamp
  );
  
  # 생성된 테이블 구조 확인
  desc tbl_board;
  
  # 더미 데이터 추가
  insert into tbl_board (title, content, writer) values ('테스트 제목', '테스트 내용', 'user00');
  insert into tbl_board (title, content, writer) values ('테스트 제목', '테스트 내용', 'user01');
  ```

  

- DB관련 설정 및 테스트 (XML)

  - 설정  
    - file: src/main/java/webapp/WEB-INF/spring/**root-context.xml**

  ```xml
      <!-- Root Context : defines shared resource visible to all other web compoents -->
      <bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
          <!-- spring jdbc 사용 -->
          <property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
          <property name="jdbcUrl" value="jdbc:mysql://localhost:3306/ex02" />
          
          <!-- log4jdbc 사용(log4jdbc.log4j2.properties 필요) -->
          <property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
          <property name="jdbcUrl" value="jdbc:log4jdbc:mysql://127.0.0.1:3306/ex02" />
          <property name="username" value="root" />
          <property name="password" value="qwe123!@#" />
      </bean>
  
      <!-- HikariCP configuration -->
      <bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close" >
          <constructor-arg ref="hikariConfig" />
      </bean>
  
      <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
          <property name="dataSource" ref="dataSource"/>
      </bean>
  
      <mybatis-spring:scan base-package="com.spring.mapper" />
  ```

  

  - 테스트

    - file : src/test/java/com/spring/persistence/DataSourceTests.java

    ```java
    package com.spring.persistence;
    
    import lombok.Setter;
    import lombok.extern.log4j.Log4j;
    import org.apache.ibatis.session.SqlSession;
    import org.apache.ibatis.session.SqlSessionFactory;
    import org.junit.Test;
    import org.junit.runner.RunWith;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.test.context.ContextConfiguration;
    import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
    
    import javax.sql.DataSource;
    
    import java.sql.Connection;
    
    import static org.junit.Assert.fail;
    
    @RunWith(SpringJUnit4ClassRunner.class)
    @ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
    @Log4j
    public class DataSourceTests {
    
        @Setter(onMethod_ = { @Autowired})
        private DataSource dataSource;
        @Setter(onMethod_ = { @Autowired})
        private SqlSessionFactory sqlSessionFactory;
    
        @Test
        public void testConnection() {
            try (Connection conn = dataSource.getConnection()) {
                log.info(conn);
            } catch (Exception e) {
                fail(e.getMessage());
            }
        }
    
        @Test
        public void testMyBatis() {
            try (SqlSession session = sqlSessionFactory.openSession();
                 Connection conn = session.getConnection();
            ) {
                log.info(session);
                log.info(conn);
    
            } catch (Exception e) {
                fail(e.getMessage());
            }
        }
    
    }
    ```

    

    - file : src/tets/java/com/spring/persistence/JDBCTests.java

    ```java
    package com.spring.persistence;
    
    import lombok.extern.log4j.Log4j;
    import org.junit.Test;
    
    import java.sql.Connection;
    import java.sql.DriverManager;
    
    import static org.junit.Assert.fail;
    
    
    @Log4j
    public class JDBCTests {
        static {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
    
        @Test
        public void testConnection() {
    
            try(Connection con =
                        DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/ex02?serverTimezone=Asia/Seoul",
                                "root",
                                "qwe123!@#")){
                System.out.println(con);
            } catch (Exception e) {
                fail(e.getMessage());
            }
    
        }
    }
    ```

    



- DB관련 설정 및 테스트( Java Config )

  - 설정

    - file : src/main/java/WebConfig.java

    ```java
    
    ```

    

  - 테스트

    - file: src/test/java/com/spring/config/ServletConfig.java

    ```java
    
    ```

    