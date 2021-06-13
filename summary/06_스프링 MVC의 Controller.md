# 스프링 MVC의 컨트롤러

---

#### Controller의 특징

- HttpServletRequest, HttpServletResponse를 거의 사용할 필요 없이 필요한 기능 구현
- 다양한 타입의 파라미터 처리, 다양한 타입의 리턴 타입 사용 가능
- GET, POST방식 등 전송 방식을 어노테이션으로 처리 가능
- 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능

#### @RequestMapping의 변화

- @RequestMapping은 현재 클래스의 모든 메서드들의 기본적인 URL 경로가 된다
- @Controller 어노테이션은 추가적인 속성을 지정할 수 없지만, @RequestMapping은 method 속성을 추가할 수 있으며 GET과 POST방식을 구분해서 사용할 때 이용된다
- Spring 4.3부터는 GET과 POST방식의 축약형인 @GetMapping, @PostMapping을 사용할 수 있다

```java
@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
public void basicGet(){}

@GetMapping("/basicOnlyGet")
public void basicGet2(){}
```

#### 파라미터의 수집과 변환

- Controller는 파라미터 타입에 따라 자동으로 변환하여 수집한다, 기본 자료형이나 문자열 등을 이용한다면 파라미터의 타입만을 맞게 @RequestParam을 이용하여 선언해줄 수 있다
- 동일한 이름의 파라미터가 여러 개 전달되는 경우에는 ArrayList<>, 배열 등을 이용하여 처리가 가능하다

```java
public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {...}
public String ex02List(@RequestParam("ids") ArrayList<String> ids) {...}
```

#### @ModelAttribute

- @MedelAttribute는 강제로 전달받은 파라미터를 Model에 담아서 전달하도록 할 때 필요한 어노테이션이다
  타입에 관계없이 무조건 Model에 담아서 전달되므로 파라미터로 전달된 데이터를 다시 화면에서 사용할 때 유용하다

#### @RedirectAttributes

- 일회성으로 데이터를 전달하는 용도로 사용

```java
// Servlet에서 redirect 방식
response.sendRedirect("/home?name=aaa&age=10");
// 스프링 MVC를 이용하는 redirect 처리
rttr.addFlashAttribute("name", "AAA");
rttr.addFlashAttribute("age", 10);
return "redirect:/";
```

#### Controller의 리턴 타입

- String: jsp를 이용하는 경우 jsp 파일의 경로와 파일이름을 나타내기 위하여 사용
- void: 호출하는 URL과 동일한 이름의 jsp를 의미
- VO, DTO 타입: 주로 JSON 타입의 데이터를 만들어서 반환하는 용도로 사용
- ResponseEntity 타입: response 할 때 Http 헤더 정보와 내용을 가공하는 용도로 사용
- Model, ModelAndView: Model로 데이터를 반환하거나 화면까지 같이 지정하는 경우에 사용
  (최근에는 많이 사용하지 않음)
- HttpHeaders: 응답에 내용 없이 Http 헤더 메시지만 전달하는 용도로 사용

#### 파일 업로드 처리

- build.gradle에 의존성 주입 commons-fileupload, commons-io
- servlet-context.xml 빈 설정

```xml
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"></bean>
<!--
<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    <beans:property name="defaultEncoding" value="utf-8"></beans:property>
    <beans:property name="maxUploadSize" value="104857560"></beans:property>
    <beans:property name="maxUploadSizePerFile" value="2097152"></beans:property>
    <beans:property name="uploadTempDir" value="file:/C:/dev/Joe/upload/temp"></beans:property>
    <beans:property name="maxInMemorySize" value="10485756"></beans:property>
</beans:bean>
-->
```

#### Controller의 Exception 처리

- @ControllerAdvice: 행당 객체가 스프링의 컨틀로러에서 발생하는 예외를 처리하는 존재임을 명시
- @ExceptionHandler: 해당 메서드가 들어가는 예외 타입을 처리하는다는 것을 의미

#### Custom 404 에러 페이지

- web.xml Processes application requests 코드 추가

```xml
<init-param>
    <param-name>throwExceptionIfNoHandlerFound</param-name>
    <param-value>true</param-value>
</init-param>
```

- CommonExceptionAdvice 메서드 추가

```java
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handle404(NoHandlerFoundException ex) {
        return "custom404";
    }
```

- custom404.jsp 에 보여질 내용 추가
