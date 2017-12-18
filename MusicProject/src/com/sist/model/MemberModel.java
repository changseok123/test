package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.MemberDAO;
import com.sist.dao.PostVO;

public class MemberModel {
	public void postAllData(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("UTF-8");
			String dong = req.getParameter("dong");
			MemberDAO dao = new MemberDAO();
			List<PostVO> list = dao.postfindData(dong);
			req.setAttribute("list", list);
			
			// count
			int count = dao.postCount(dong);
			req.setAttribute("count", count);
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
//	public void postCount(HttpServletRequest req) {
//		try {
//			req.setCharacterEncoding("UTF-8");
//			String dong = req.getParameter("dong");
//			MemberDAO dao = new MemberDAO();
//			int count = dao.postCount(dong);
//			req.setAttribute("count", count);
//			
//		} catch(Exception ex) {
//			System.out.println(ex.getMessage());
//		}
//	}
}
