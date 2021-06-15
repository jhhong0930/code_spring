# Chapter 06. 스프링 MVC의 Controller

## Controller 의 특징

1. HttpServletRequest, HttpServletResponse를 거의 사용하지 않고 필요한 기능을 구현
2. 다양한 타입의 파라미터 처리, 다양한 타입의 리턴타입 사용가능
3. GET, POST방식 등 전송 방식에 대한 처리를 어노테이션으로 처리 가능
4. 상속 / 인터페이스 방식대신에 어노테이션만으로도 필요한 설정 가능

- 스프링 MVC는 **어노테이션**을 중심으로 구성됨.



## @Controller, @RequestMapping

### 1. @RequestMaping

- **현재 클래스의 모든 메서드들의 기본적인 URL 경로**가 된다.
- 예를 들어, SampleController 클래스를 다음과 같이 "/sample/*"이라는 경로로 지정했다면
  "/sample/*"과 같은 URL은 모두 SampleController에서 처리됨.
  - /sample/aaa
  - /sample/bbb

- **@RequestMapping**은 **GET**, **POST **방식 모두를 지원해야하는 경우에 **배열**로 처리해서 지정 할 수 있다.

### 2. @Controller

- **파라미터가 자동으로 수집됨.**
  매번 request.getParameter()를 이용하는 불변함이 없어짐.

- Object가 아닌 기본 자료형이나 문자열등을 이용한다면 파라미터의 타입만을 맞게 선언해주는 방식을 이용해야함.
  **@RequestParam**

  ```java
  @GetMapping("/ex02")
  public void ex02(@RequestParam("name") String name, @Request("age") int age) {...}
  ```

  

