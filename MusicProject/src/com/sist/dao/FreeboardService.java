package com.sist.dao;
import java.util.*;
public class FreeboardService {
   private FreeboardDAO fdao = new FreeboardDAO();
   private ReplyDAO rdao = new ReplyDAO();
   
   public List<FreeBoardVO> freeboardListData(int page)
   {
	   return fdao.freeboardListData(page);
   }
   public int freeboardTotalPage() {
	   return fdao.freeboardTotalPage();
   }
   public int replyCount(int no) {
	   return rdao.replyCount(no);
   }
   public FreeBoardVO freeboardDetailData(int no) {
	   return fdao.freeboardDetailData(no);
   }
}
