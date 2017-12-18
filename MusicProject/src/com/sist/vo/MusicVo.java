package com.sist.vo;

//CREATE TABLE genie_music(
//		no NUMBER,
//		title VARCHAR2(200) CONSTRAINT gm_title_nn NOT NULL,
//		singer VARCHAR2(200) CONSTRAINT gm_singer_nn NOT NULL,
//		rank NUMBER,
//		state VARCHAR2(10)CONSTRAINT gm_state_nn NOT NULL,
//		idincrement NUMBER,
//		poster VARCHAR2(260) CONSTRAINT gm_poster_nn NOT NULL,
//		key VARCHAR2(30) CONSTRAINT gm_key_nn NOT NULL,
//		CONSTRAINT gm_no_pk PRIMARY KEY(no)
//	);

public class MusicVo {
	private int no;
	private String title;
	private String singer;
	private int rank;
	private String state;
	private int idincrement;
	private String poster;
	private String key;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getIdincrement() {
		return idincrement;
	}
	public void setIdincrement(int idincrement) {
		this.idincrement = idincrement;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	
}
