package com.epikat.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
	public DBConnection() {}
	
	public static Connection getDBConnection() {
		 Connection con=null;
		 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost/student", "test","test");
		 
		 }catch(Exception e) {
			 System.out.println("Exception Occure while creating mysql connectection :: "+e);
		 }
		 return con;
		
		
	}
}
