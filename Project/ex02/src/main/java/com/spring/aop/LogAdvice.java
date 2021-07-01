package com.spring.aop;

import lombok.extern.log4j.Log4j;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Log4j
@Component
public class LogAdvice {

    @Before( "execution(* com.spring.service.SampleService*.*(..))")
    public void logBefore() {
        log.info("=======================");
    }

    @Before( "execution(* com.spring.service.SampleService*.doAdd(String, String)) && args(str1, str2)")
    public void logBeforeWithParam(String str1, String str2){
        log.info("str1: " + str1);
        log.info("str2: " + str2);
    }

    @AfterThrowing(pointcut = "execution(* com.spring.service.SampleService*.*(..))", throwing = "exception")
    public void logExecption(Exception exception) {
        log.info("Exception.....!!!");
        log.info("exception: " + exception);
    }
}
