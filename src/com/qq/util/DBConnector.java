package com.qq.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {

	public static Connection getConnection() throws Exception{
		Connection con = null;
		
		
		String user= "user11";
		String password="user11";
		String url ="jdbc:oracle:thin:@211.238.142.39:1521:xe";
		String driver="oracle.jdbc.OracleDriver";
		
		Class.forName(driver);
		
		con = DriverManager.getConnection(url,user,password);

		return con;
	}
}
