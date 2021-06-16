package org.zerock.persitence;

import lombok.extern.log4j.Log4j;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;

@Log4j
public class JDBCTests {
    // 1
//    static {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void testConnection() {
//        try(Connection con =
//                    DriverManager.getConnection(
//                            "jdbc:mysql://localhost:3306/데이터베이스 이름?serverTimezone=Asia/Seoul",
//                            "데이터베이스 사용자명",
//                            "사용자 비밀번호")){
//            System.out.println(con);
//        } catch (Exception e) {
//            fail(e.getMessage());
//        }
//    }


    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/mysql";
    private static final String USER ="root";
    private static final String PW = "qwe123!@#";

    @Test
    public void testConnection() throws Exception{

        Class.forName(DRIVER);

        try (Connection con = DriverManager.getConnection(URL, USER, PW))	{

            System.out.println(con);



        }catch(Exception e){

            System.err.println(e);

        }

    }
}
