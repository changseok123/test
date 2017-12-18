package com.sist.dao;
import java.util.*;// List
/*
 *   Collection => 제네릭스 타입 (데이터형의 통일)
 *   ==========
 *    List        Set       Map   ====> interface
 *    ====                  1) key,value
 *                          2) 저장 => put(key,value)
 *                          3) 값 가지고 오기  => get(key)
 *                          4) 클래스 저장 => MVC
 *                             put("a",new A()):싱글턴
 *                             lookup("jdbc/oracle")
 *                             DL/DI => Spring핵심
 *    1) 순서를 가지고 있다 (index)
 *    2) 데이터가 중복이 가능 
 *    3) 구현 클래스 
 *       ArrayList => 데이터베이스 연동 
 *       Vector => 네트워크 사용자 정보 저장 
 *       LinkedList
 *       List list=new ArrayList()
 *       List list=new Vector()
 *       List list=new LinkedList()
 *       ==============
 *       Queue  : 정류장
 *       Stack  : 주차장 
 *       ============== test coding
 *    4) 주요 메소드 
 *       CURD 프로그램 : C(Create),U(Update), R(Read),D(Delete)
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
 *    TCP / UDP(게임)  => RTCP(화상,CCTV)
 *    Connection : 각 데이터베이스 연결 객체  => Socket
 *       <=> Driver
 *    PreparedStatement : 통신 객체 (OutputStream,InputStream)
 *         input/output
 *    ResultSet : 결과값 저장 
 */
import javax.naming.*; // Context => lookup()
// JNDI => RMI (Socket을 대체하는 프로그램)
import javax.sql.*; // DataSource : 데이터베이스 모든 정보를 가지고 있다 
public class FreeboardDAO {
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
  public List<FreeBoardVO> freeboardListData(int page)
  {
	  List<FreeBoardVO> list=
			    new ArrayList<FreeBoardVO>();
	  try
	  {
		  // 주소 얻기 
		  getConnection();
		  int rowSize=10;
		  int start=(rowSize*page)-(rowSize-1);
		  int end=(rowSize*page);
		  String sql="SELECT no,subject,name,regdate,hit,num "
				    +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				    +"FROM (SELECT no,subject,name,regdate,hit "
				    +"FROM freeboard ORDER BY no DESC)) "
				    +"WHERE num BETWEEN "+start+" AND "+end;
		  // SELECT : 검색, 컬럼(스칼라 서브쿼리),테이블(인라인뷰)
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
		  // 반환
		  disConnection();
	  }
	  return list;
  }
  // 총페이지
  public int freeboardTotalPage()
  {
	  int total = 0;
	  
	  try {
		  getConnection();
		  String sql="SELECT CEIL(COUNT(*)/10) "
				    +"FROM freeboard";
		  ps = conn.prepareStatement(sql);
		  // 보내는 데이터 있는 경우에 설정 ps.setInt() ps.setString()
		  // ? 값을 채운다 ===> 없는 경우는 IN, OUT~
		  ResultSet rs = ps.executeQuery();
		  rs.next(); // 값이 있는 위치에 커서 이동
		  total = rs.getInt(1);
		  rs.close();
		  
	  } catch(Exception ex) {
		  System.out.println(ex.getMessage());
	  } finally {
		  disConnection();
	  }
	  
	  return total;
  }
  // 내용보기
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
  // 삭제 
  
}









