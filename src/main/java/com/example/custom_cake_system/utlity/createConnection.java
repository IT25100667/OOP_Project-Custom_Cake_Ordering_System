package com.example.custom_cake_system.utlity;

import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.sql.DriverManager;

public class createConnection {

    public DSLContext getConnection(){
        String userName = "admin";
        String password = "AVNS_UiQCF9zo7uD_bLSw8nv";
        String url = "jdbc:mysql://oop-bakery-limupua-c6d6.a.aivencloud.com:20596/defaultdb?sslMode=REQUIRED";
        try {
            Connection conn = DriverManager.getConnection(url, userName, password);
            return DSL.using(conn, SQLDialect.MYSQL);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
