package com.sist.dao;
import java.util.*;// List
/*
 *   Collection => ���׸��� Ÿ�� (���������� ����)
 *   ==========
 *    List        Set       Map   ====> interface
 *    ====                  1) key,value
 *                          2) ���� => put(key,value)
 *                          3) �� ������ ����  => get(key)
 *                          4) Ŭ���� ���� => MVC
 *                             put("a",new A()):�̱���
 *                             lookup("jdbc/oracle")
 *                             DL/DI => Spring�ٽ�
 *    1) ������ ������ �ִ� (index)
 *    2) �����Ͱ� �ߺ��� ���� 
 *    3) ���� Ŭ���� 
 *       ArrayList => �����ͺ��̽� ���� 
 *       Vector => ��Ʈ��ũ ����� ���� ���� 
 *       LinkedList
 *       List list=new ArrayList()
 *       List list=new Vector()
 *       List list=new LinkedList()
 *       ==============
 *       Queue  : ������
 *       Stack  : ������ 
 *       ============== test coding
 *    4) �ֿ� �޼ҵ� 
 *       CURD ���α׷� : C(Create),U(Update), R(Read),D(Delete)
 *                   =========            =======
 *                    INSERT               SELECT
 *       INSERT : add()
 *       UPDATE : set()
 *       DELETE : remove()
 *       SELECT : get()
 *       COUNT  : size()
 *       for(int i=0;i<list.size();i++)
 *       {
 *           A a=list.get(i);
 *       }
 *       for(A a:list)
 *       {
 *       }
 */
import java.sql.*;// Connection,PreparedStatement,ResultSet
/*
 *    TCP / UDP(����)  => RTCP(ȭ��,CCTV)
 *    Connection : �� �����ͺ��̽� ���� ��ü  => Socket
 *       <=> Driver
 *    PreparedStatement : ��� ��ü (OutputStream,InputStream)
 *         input/output
 *    ResultSet : ����� ���� 
 */
import javax.naming.*; // Context => lookup()
// JNDI => RMI (Socket�� ��ü�ϴ� ���α׷�)
import javax.sql.*; // DataSource : �����ͺ��̽� ��� ������ ������ �ִ� 
public class FreeboardDAO {
  private Connection conn;
  private PreparedStatement ps;
  public void getConnection()
  {
	  try
	  {
		  Context init=new InitialContext();
		  // Connection��ü�� ����Ǿ� �ִ� �� : POOL
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
		  // tomcat ==> ��ȯ 
	  }catch(Exception ex){}
  }
  public List<FreeBoardVO> freeboardListData(int page)
  {
	  List<FreeBoardVO> list=
			    new ArrayList<FreeBoardVO>();
	  try
	  {
		  // �ּ� ��� 
		  getConnection();
		  int rowSize=10;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=(rowSize*page);
		  String sql="SELECT no,subject,name,regdate,hit,num "
				    +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				    +"FROM (SELECT no,subject,name,regdate,hit "
				    +"FROM freeboard ORDER BY no DESC)) "
				    +"WHERE num BETWEEN "+start+" AND "+end;
		  // SELECT : �˻�, �÷�(��Į�� ��������),���̺�(�ζ��κ�)
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  FreeBoardVO vo=new FreeBoardVO();
			  vo.setNo(rs.getInt(1));
			  vo.setSubject(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setRegdate(rs.getDate(4));
			  vo.setHit(rs.getInt(5));
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex)
	  {
		  //System.out.println(ex.getMessage());
		  ex.printStackTrace();
	  }
	  finally
	  {
		  // ��ȯ
		  disConnection();
	  }
	  return list;
  }
  // ��������
  public int freeboardTotalPage()
  {
	  int total = 0;
	  
	  try {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/10) "
				    +"FROM freeboard";
		  ps = conn.prepareStatement(sql);
		  // ������ ������ �ִ� ��쿡 ���� ps.setInt() ps.setString()
		  // ? ���� ä��� ===> ���� ���� IN, OUT~
		  ResultSet rs = ps.executeQuery();
		  rs.next(); // ���� �ִ� ��ġ�� Ŀ�� �̵�
		  total = rs.getInt(1);
		  rs.close();
		  
	  } catch(Exception ex) {
		  System.out.println(ex.getMessage());
	  } finally {
		  disConnection();
	  }
	  
	  return total;
  }
  // ���뺸��
  public FreeBoardVO freeboardDetailData(int no) {
	  FreeBoardVO vo = new FreeBoardVO();
	  
	  try {
		  getConnection();
		  String sql = "UPDATE freeboard SET "
		  		+ "hit = hit+1 "
		  		+ "WHERE no = ?";
		  ps = conn.prepareStatement(sql);
		  ps.setInt(1, no);
		  ps.executeUpdate();
		  ps.close();
		  
		  sql = "SELECT no,name,subject,content,regdate,hit "
		  		+ "FROM freeboard "
		  		+ "WHERE no=?";
		  ps = conn.prepareStatement(sql);
		  ps.setInt(1, no);
		  ResultSet rs = ps.executeQuery();
		  rs.next();
		  vo.setNo(rs.getInt(1));
		  vo.setName(rs.getString(2));
		  vo.setSubject(rs.getString(3));
		  vo.setContent(rs.getString(4));
		  vo.setRegdate(rs.getDate(5));
		  vo.setHit(rs.getInt(6));
		  
		  rs.close();
	  } catch(Exception ex) {
		  System.out.println(ex.getMessage());
	  } finally {
		  disConnection();
	  }
	  
	  return vo;
  }
  // ���� 
  
}









