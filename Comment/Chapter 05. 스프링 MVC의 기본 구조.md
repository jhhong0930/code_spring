# Capter 05. 스프링 MVC의 기본 구조



### xml 설정

- spring MVC	: servlet-context.xml
- Spring Core	: root-context.xml
- MyBatis	      : root-context.xml
- DB



### java 설정

- Spring MVC	: ServletConfig.class
- Spring Core	: RootConfig.class
- MyBatis		  : RootConfig.class
- DB



## 예제 프로젝트의 로딩 구조

### XML

- 톰캣 관련
  - web.xml
- 스프링 관련
  - root-context.xml
  - servlet-context.xml



### 프로젝트 구동 순서

1. web.xml
2. root-context.xml
3. servlet-context.xml