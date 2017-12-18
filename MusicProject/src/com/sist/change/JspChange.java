package com.sist.change;

public class JspChange {
  private static String[] jsp={
	  "../music/default.jsp",
	  "../member/join.jsp",
	  "../music/top50.jsp",
	  "../member/join_update.jsp",
	  "../music/recommand.jsp",
	  "../music/reserve.jsp",
	  "../qna/list.jsp",
	  "../qna/insert.jsp",
	  "../qna/content.jsp",
	  "../qna/reply.jsp",
	  "../qna/update.jsp", // 10
	  "../qna/delete.jsp",
	  "../databoard/list.jsp", // 12
	  "../databoard/insert.jsp",
	  "../databoard/content.jsp", // 14
	  "../databoard/delete.jsp", 
	  "../member/welcome.jsp", // 16
	  "../FreeBoard/list.jsp",
	  "../FreeBoard/content.jsp" //18
  };
  static public String change(int no)
  {
	  return jsp[no];
  }
}
