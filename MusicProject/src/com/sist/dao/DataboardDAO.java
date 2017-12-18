package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;
public class DataboardDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   // 미리 생성되어 있는 풀안에서 connection의 주소 얻기
	   public void getConnection()
	   {
		   try
		   {
			   Context init=new InitialContext();
			   // 탐색기 ==> JNDI
			   Context c=(Context)init.lookup("java://comp/env");
			   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			   conn=ds.getConnection();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   // 반환 
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public List<DataBoardVO> databoardListData(int page)
	   {
		   List<DataBoardVO> list=new ArrayList<DataBoardVO>();
		   try
		   {
			   getConnection();
			   int rowSize=10;
			   int start=(page*rowSize)-(rowSize-1);
			   int end=(page*rowSize);
			   String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
					     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					     +"FROM (SELECT no,subject,name,regdate,hit "
					     +"FROM databoard ORDER BY no DESC)) "
					     +"WHERE num BETWEEN "+start+" AND "+end;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   DataBoardVO vo=new DataBoardVO();
				   vo.setNo(rs.getInt("no"));
				   // rs.getInt("no")
				   vo.setSubject(rs.getString("subject"));
				   vo.setName(rs.getString("name"));
				   vo.setDbday(rs.getString("dbday"));
				   vo.setHit(rs.getInt("hit"));
				   vo.setRownum(rs.getInt("num"));
				   list.add(vo);
			   }
			   rs.close();
		   }
		   catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   // 추가 
	   public void databoardInsert(DataBoardVO vo)
	   {
		   try
		   {
			   getConnection();
			   String sql="INSERT INTO databoard VALUES("
					     +"data_no_seq.nextval,?,?,?,?,SYSDATE,0,?,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setString(4, vo.getPwd());
			   ps.setString(5, vo.getFilename());
			   ps.setInt(6, vo.getFilesize());
			   ps.setInt(7, vo.getFilecount());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   public DataBoardVO databoardContentData(int no)
	   {
		   DataBoardVO vo=new DataBoardVO();
		   try
		   {
			   getConnection();
			   String sql="UPDATE databoard SET "
					     +"hit=hit+1 "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
			   ps.close();
			   
			   sql="SELECT no,name,subject,content,regdate,"
				  +"hit,filename,filesize,filecount "
				  +"FROM databoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setRegdate(rs.getDate(5));
			   vo.setHit(rs.getInt(6));
			   vo.setFilename(rs.getString(7));
			   vo.setFilesize(rs.getInt(8));
			   vo.setFilecount(rs.getInt(9));
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }
	   public DataBoardVO databoardFileInfo(int no)
	   {
		   DataBoardVO vo=new DataBoardVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT filename,filecount "
					     +"FROM databoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1,no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setFilename(rs.getString(1));
			   vo.setFilecount(rs.getInt(2));
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }
	   public boolean databoardDelete(int no,String pwd)
	   {
		   boolean bCheck=false;
		   try
		   {
			   getConnection();
			   String sql="SELECT pwd FROM databoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   ps.close();
			   
			   if(pwd.equals(db_pwd))
			   {
				   bCheck=true;
				   sql="DELETE FROM databoard "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
			   }
			   
			   
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return bCheck;
	   }
	   
}









