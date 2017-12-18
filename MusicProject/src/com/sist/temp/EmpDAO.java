package com.sist.temp;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
import java.sql.*;
public class EmpDAO {
  private Connection conn;
  private PreparedStatement ps;
  public void getConnection()
  {
	  try
	  {
		  Context init=new InitialContext();
		  Context c=(Context)init.lookup("java://comp/env");
		  DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		  conn=ds.getConnection();
	  }catch(Exception ex)
	  {
		  System.out.println(ex.getMessage());
	  }
  }
  // ¹ÝÈ¯ 
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
  /*
   *   public class A
   *   {
   *      int a;
   *      int b;
   *   }
   *   public class B
   *   {
   *     public void setA(A aa)
   *     {
   *        aa.a=100;
   *        aa.b=200;
   *     }
   *   }
   *   
   *   B b=new B();
   *   A a=new A();
   *   b.setA(a);  a.a=100 a.b=200
   */
  public List<EmpVO> empAllData()
  {
	  List<EmpVO> list=new ArrayList<EmpVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT empno,ename,job,sal,deptno "
		            +"FROM emp";
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  EmpVO vo=new EmpVO();
			  vo.setEmpno(rs.getInt(1));
			  vo.setEname(rs.getString(2));
			  vo.setJob(rs.getString(3));
			  vo.setSal(rs.getInt(4));
			  vo.setDeptno(rs.getInt(5));
			  list.add(vo);
		  }
		  rs.close();
		  
	  }catch(Exception ex)
	  {
		  System.out.println(ex.getMessage());
	  }
	  finally
	  {
		  disConnection();
	  }
	  return list;
  }
}





