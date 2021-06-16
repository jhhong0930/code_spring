## Chapter 07. 스프링 MVC프로젝트의 기본 구성(이론)



### 스프링 MVC의 단계 (3-tier 방식) 

```
3-tier 방식 : Presentation <-> Business <-> Persistence tier

# Persentation Tier
	- 화면계층
	- 화면에서 보여주는 기술을 사용하는 영역
	- Servlet/Jsp, 스프링 MVC가 담당하는 영역

# Business Tier
	- 비즈니스 계층
	- 순수한 비즈니스 로직을 담고 있는 영역
	- 고객이 원하는 요구사하을 반영하는 계층
	- 이 영역의 설계는 고객의 요구사항과 정확히 일치해야한다.
	- 주로 "xxxService"와 같은 이름으로 구성됨.
	- 메서드의 이름 역시 고객들이 사용하는 용어를 그대로 사용하는 것이 좋음.

# Persistence Tier
	- 영속 계층 or 데이터 계층
	- 데이터를 어떤 방식으로 보관하고, 사용하는가에 대한 설계가 들어가는 계층
	- 데이터베이스, 네트워크 호출, 원격 호출등의 기술이 접목됨.
	- MyBatis와 mybatis-spring을 이용하여 구성
```



#### 각 영역의 Naming Convention

```
# Contorller
	- 스프링 MVC에서 동작하는 Controller 클래스를 설꼐할 때 사용(xxxContorller)
	
# Service
	- 비즈니스 영역을 담당하는 인터페이스(xxxService)
    - 인터페이스를 구현한 클래스(xxxServiceImpl)
    
# DAO, Repository
	- 영역을 따로 구성하는 것(xxxDAO, xxxRepository)
	- MyBatis의 Mapper 인터페이스를 활용

# VO, DTO
	- 데이터를 담고 있는 객체를 의미
	- VO(xxxVO) : Read Only의 목적이 강하다.
	- DTO : 데이터 수집의 용도가 더 강하다.
```



#### 프로젝트를 위한 요구사항

```

```



