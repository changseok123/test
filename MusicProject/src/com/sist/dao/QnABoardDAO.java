package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class QnABoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//�̸� �����Ǿ� �ִ� Ǯ �ȿ��� connection�� �ּ� ���
	public void getConnection() {
		try {
			Context init = new InitialContext();
			//Ž���� ==> JNDI(JAVA NAIMING DIRECTORY INTERFACE)
			Context c = (Context)init.lookup("java://comp/env");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	//��ȯ
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public List<QnABoardVO> boardListData(int page) {
		List<QnABoardVO> list = new ArrayList<QnABoardVO>();
		
		try {
			getConnection();
			int rowSize = 10;
			int start = (page*rowSize) - (rowSize-1);
			int end = page*rowSize;
			//�ζ��κ� ==> Top-N
			String sql = "SELECT no,subject,name,regdate,hit,group_tab,num "
						+"FROM (SELECT no,subject,name,regdate,hit,group_tab, rownum as num "
						+"FROM (SELECT no,subject,name,regdate,hit,group_tab "
						+"FROM qnaBoard ORDER BY group_id DESC, group_step ASC)) "
						+"WHERE num BETWEEN " + start + " AND " + end;
			
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				QnABoardVO vo = new QnABoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		
		return list;
	}
	
	public void boardInsert(QnABoardVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO qnaboard (no, name, subject, content, pwd, group_id) "
					+ "VALUES (qna_no_seq.nextval, ?, ?, ?, ?, (SELECT NVL(MAX(group_id)+1, 1) FROM qnaBoard))";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
	}
	
	public int boardTotalPage() {
		int total=0;
		
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10) FROM qnaBoard";
			/*
			 * ����Ŭ���� �����ϴ� ���� �Լ�
			 * COUNT, CEIL, NVL, MAX => �����Լ�
			 */
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	
	public int boardRowCount() {
		int total=0;
		
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM qnaBoard";
			/*
			 * ����Ŭ���� �����ϴ� ���� �Լ�
			 * COUNT, CEIL, NVL, MAX => �����Լ�
			 */
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}
	public QnABoardVO boardContentData(String type, int no) {
		QnABoardVO vo = new QnABoardVO();
		
		try {
			getConnection();
			String sql="";
			if(type.equals("content")) {
				sql="UPDATE qnaBoard SET "
						+ "hit = hit+1 "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
			
			// ���뺸��, ���������� �б�
			sql = "SELECT no,name,subject,content,regdate,hit "
					+"FROM qnaboard "
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
	
	// �亯�ϱ�***********************************************************�߿�
	public void boardReply(int pno, QnABoardVO vo) {
		try {
			getConnection();//����
			conn.setAutoCommit(false);
			// 1. ���� �Խù��� group_id, group_step, group_tab
			/*
			 * 				gi	gs	gt
			 * AAAA			1	0	0
			 * 	=> BBBB		1	1	1
			 */
			String sql = "SELECT group_id, group_step, group_tab "
					+ "FROM qnaBoard "
					+ "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi = rs.getInt(1);
			int gs = rs.getInt(2);
			int gt = rs.getInt(3);
			rs.close();
			ps.close();
			// �亯, ����� �ٽ� SQL
			// �ֽ� ����� �߰��Ǹ� ���� ��ۺ��� group_step�� ū ��۵��� group_step�� 1�� ������Ų��.
			sql = "UPDATE qnaboard SET "
					+ "group_step = group_step+1 "
					+ "WHERE group_id = ? AND group_step > ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			ps.close();
			/*				gi	gs	gt
			 * AAAA			10	0	0	1
			 *  => EEEE		10	1	1	5
			 *  => DDDD		10	2	1	4
			 *  => BBBB		10	3	1	2
			 *     => CCCC	10	4	2	3
			 */
			
			// �߰�(�亯)
			sql = "INSERT INTO qnaboard (no, name, subject, content, pwd, group_id, group_step, group_tab, root) "
					+ "VALUES (qna_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs+1);
			ps.setInt(7, gt+1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			ps.close();
			
			// �����Խù� ==> depth ����
			sql = "UPDATE qnaboard SET "
					+ "depth = depth + 1 "
					+ "WHERE no = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pno);
			ps.executeUpdate();
			conn.commit();
			
		// Ʈ����� �Ѻ�
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			// Ʈ����� �Ѻ�
			try {
				conn.rollback();
			} catch(Exception ex1) {
				ex1.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			disConnection();
		}
	}
	
	// �����ϱ�
	public boolean boardUpdate(QnABoardVO vo) {
		boolean bCheck = false;
		
		try {
			getConnection();
			String sql = "SELECT pwd FROM qnaboard "
					+ "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			ps.close();
			
			if(db_pwd.equals(vo.getPwd())) {
				bCheck = true;
				sql="UPDATE qnaBoard SET "
						+ "name=?,subject=?,content=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		
		return bCheck;
	}
	
	// �����ϱ�
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck = false;
		
		try {
			getConnection();
			conn.setAutoCommit(false);
			
			//SQL
			//password
			String sql = "SELECT pwd, root, depth "
					+ "FROM qnaboard "
					+ "WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			int root = rs.getInt(2);
			int depth = rs.getInt(3);
			rs.close();
			ps.close();
			if(db_pwd.equals(pwd)) {
				bCheck = true;
				if(depth == 0) { // ����� ���� ����
					sql = "DELETE FROM qnaboard "
							+ "WHERE no = ?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
				} else {
					String msg = "�����ڰ� ������ �Խù��Դϴ�.";
					sql = "UPDATE qnaboard SET "
							+ "subject = ?, content=? "
							+ "WHERE no = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, msg);
					ps.setString(2, msg);
					ps.setInt(3, no); // IN OUT
					// ORA-111
					ps.executeUpdate();
					ps.close();
				}
				sql = "UPDATE qnaboard SET "
						+ "depth=depth-1 "
						+ "WHERE no = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, root);
				ps.executeUpdate();
			}
			
			conn.commit();
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			try {
				conn.rollback();
			} catch(Exception ex1) {
				ex.printStackTrace();
			}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch(Exception e) {}
			disConnection();
		}
		
		return bCheck;
	}
}
