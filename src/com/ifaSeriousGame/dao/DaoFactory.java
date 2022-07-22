package com.ifaSeriousGame.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
	
 	private String url;
    private String username;
    private String password;
     
    
   DaoFactory(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }
    public static DaoFactory getInstance() {
    	 try {
             Class.forName("com.mysql.cj.jdbc.Driver");
         } catch (ClassNotFoundException e) {
         }
        
        DaoFactory instance = new DaoFactory(
        		"jdbc:mysql://127.0.0.1:3306/serious_game?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=Europe/Paris", "root", "1000%bites@mysql");
        return instance;
    }
    

    public Connection getConnection() throws SQLException {
        Connection connexion = DriverManager.getConnection(url, username, password);
        connexion.setAutoCommit(true);
        return connexion; 
    }

}