package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.MusicVo;

public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:ORCL";

	public MusicDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "scott", "1234");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public void disConnection() {
		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	// ±â´É
	public void musicInsert(MusicVo vo) {
		try {
			getConnection();
			
			String sql = "Insert Into genie_music VALUES ("
					+ "?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getSinger());
			ps.setInt(4, vo.getRank());
			ps.setString(5, vo.getState());
			ps.setInt(6, vo.getIdincrement());
			ps.setString(7, vo.getPoster());
			ps.setString(8, vo.getKey());
			ps.executeUpdate();
			
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
	}
	
	public List<MusicVo> musicAllData10() {
		List<MusicVo> list = new ArrayList<MusicVo>();
		
		try {
			getConnection();
			
			String sql = "SELECT no,title,singer,state,rank,poster,idincrement,key,rownum "
					+ "FROM (SELECT no,title,singer,state,rank,poster,idincrement,key FROM genie_music ORDER BY rank ASC) "
					+ "WHERE rownum <= 10";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MusicVo vo = new MusicVo();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSinger(rs.getString(3));
				vo.setState(rs.getString(4));
				vo.setRank(rs.getInt(5));
				vo.setPoster(rs.getString(6));
				vo.setIdincrement(rs.getInt(7));
				vo.setKey(rs.getString(8));
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
	
	public List<MusicVo> musicAllData50() {
		List<MusicVo> list = new ArrayList<MusicVo>();
		
		try {
			getConnection();
			
			String sql = "SELECT no,title,singer,state,rank,poster,idincrement,key,rownum "
					+ "FROM (SELECT no,title,singer,state,rank,poster,idincrement,key FROM genie_music ORDER BY rank ASC)"
					/*+ "WHERE rownum <= 10"*/;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MusicVo vo = new MusicVo();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSinger(rs.getString(3));
				vo.setState(rs.getString(4));
				vo.setRank(rs.getInt(5));
				vo.setPoster(rs.getString(6));
				vo.setIdincrement(rs.getInt(7));
				vo.setKey(rs.getString(8));
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
}
