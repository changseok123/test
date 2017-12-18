package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReplyDAO {
	 private Connection conn;
	  private PreparedStatement ps;
	  public void getConnection()
	  {
		  try
		  {
			  Context init=new InitialContext();
			  // Connection객체가 저장되어 있는 곳 : POOL
			  Context c=(Context)init.lookup("java://comp/env");
			  DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			  conn=ds.getConnection();
		  }catch(Exception ex) 
		  {
			  System.out.println(ex.getMessage());
		  }
	  }
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
			  // tomcat ==> 반환 
		  }catch(Exception ex){}
	  }
	  
	  public int replyCount(int no) {
		  int count = 0;
		  
		  try {
			getConnection();
			String sql = "SELECT COUNT(*) "
					+ "FROM reply "
					+ "WHERE bno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		  } catch(Exception ex) {
			  System.out.println(ex.getMessage());
		  } finally {
			  disConnection();
		  }
		  
		  return count;
	  }
}
