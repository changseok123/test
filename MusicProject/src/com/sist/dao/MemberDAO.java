package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
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
	   //ID중복체크 
	   public int memberIdcheck(String id)
	   {
		   int count=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT COUNT(*) "
					     +"FROM member "
					     +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return count;
	   } 
	   // 우편번호 검색
	   public List<PostVO> postfindData(String dong) {
		   List<PostVO> list = new ArrayList<PostVO>();
		   
		   try {
			   getConnection();
			   String sql = "SELECT zipcode, sido, gugun, dong, NVL(bunji, ' ') "
			   		+ "FROM post "
			   		+ "WHERE dong LIKE '%'||?||'%'";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, dong);
			   ResultSet rs = ps.executeQuery();
			   
			   while(rs.next()) {
				   PostVO vo = new PostVO();
				   vo.setZipcode(rs.getString(1));
				   vo.setSido(rs.getString(2));
				   vo.setGugun(rs.getString(3));
				   vo.setDong(rs.getString(4));
				   vo.setBunji(rs.getString(5));
				   list.add(vo);
			   }
			   rs.close();
		   } catch(Exception ex) {
			   System.out.println(ex.getMessage());
		   } finally {
			   disConnection();
		   }
		   
		   return list;
	   }
	   
	   public int postCount(String dong) {
		   int count = 0;
		   
		   try {
			   getConnection();
			   String sql = "SELECT COUNT(*) "
			   		+ "FROM post "
			   		+ "WHERE dong LIKE '%'||?||'%'";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, dong);
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
	   // 회원가입
	   // ID찾기, PW찾기
	   // 로그인 처리
	   public MemberVO isLogin(String id, String pwd) {
		   MemberVO vo = new MemberVO();
		   
		   try {
			   getConnection();
			   String sql = "SELECT COUNT(*) FROM member WHERE id = ?";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, id);
			   ResultSet rs = ps.executeQuery();
			   rs.next();
			   int no = rs.getInt(1);
			   
			   rs.close();
			   ps.close();
			   
			   if(no == 0) {
				   vo.setCount(1);
			   } else {
				   sql = "SELECT id, pwd, name, admin "
				   		+ "FROM member "
				   		+ "WHERE id = ?";
				   ps = conn.prepareStatement(sql);
				   ps.setString(1, id);
				   rs = ps.executeQuery();
				   rs.next();
				   vo.setId(rs.getString(1));
				   vo.setPwd(rs.getString(2));
				   vo.setName(rs.getString(3));
				   vo.setAdmin(rs.getString(4));
				   
				   rs.close();
				   
				   if(pwd.equals(vo.getPwd())) {
					   vo.setCount(3);
				   } else {
					   vo.setCount(2);
				   }
			   }
		   } catch(Exception ex) {
			   System.out.println(ex.getMessage());
		   } finally {
			   disConnection();
		   }
		   
		   return vo;
	   }
	   
	   //회원가입
	   public void memberJoin(MemberVO vo) {
		   try {
			   getConnection();
			   String sql = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, " + 
			   		"?, ?, ?, ?, 'n', SYSDATE, 'n', 0)";
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, vo.getId());
			   ps.setString(2, vo.getPwd());
			   ps.setString(3, vo.getName());
			   ps.setString(4, vo.getSex());
			   ps.setString(5, vo.getBirthday());
			   ps.setString(6, vo.getEmail());
			   ps.setString(7, vo.getPost());
			   ps.setString(8, vo.getAddr1());
			   ps.setString(9, vo.getAddr2());
			   ps.setString(10, vo.getTel());
			   ps.setString(11, vo.getContent());
			   ps.executeUpdate();
		   } catch(Exception ex) {
			   System.out.println(ex.getMessage());
		   } finally {
			   disConnection();
		   }
	   }
}







