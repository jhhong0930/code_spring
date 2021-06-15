package org.zerock.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = {"org.zerock.sample"})
public class RootConfig {
//
//    @Bean
//    public DataSource dataSource() {
//        HikariConfig hikariConfig = new HikariConfig();
////        hikariConfig.setDriverClassName("com.mysql.jdbc.driver");
//        hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/mysql");
//        hikariConfig.setUsername("root");
//        hikariConfig.setPassword("qwe123!@#");
//
//        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
//
//        return dataSource;
//
//    }

}