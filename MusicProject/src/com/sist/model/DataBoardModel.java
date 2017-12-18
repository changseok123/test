package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.*;
public class DataBoardModel {
   public void databoardListData(HttpServletRequest req)
   {
	   DataboardDAO dao=new DataboardDAO();
	   String page=req.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   List<DataBoardVO> list=dao.databoardListData(curpage);
	   req.setAttribute("list", list);
	   
   }
   public void databoardInsert_ok(HttpServletRequest req,HttpServletResponse res)
   {
	   try
	   {
		   
		   req.setCharacterEncoding("EUC-KR");
		   String path="c:\\download";
		   int size=1024*1024*100;
		   String enctype="EUC-KR";
		   MultipartRequest mr=
				   new MultipartRequest(req, path,size,enctype,
						   new DefaultFileRenamePolicy());
		   // DefaultFileRenamePolicy() : ���ϸ��� �����Ҷ� ���ϸ��� �ڵ����� ���� 
		   // a.jpg => a1.jpg => a2.jpg
		   String name=mr.getParameter("name");
		   String subject=mr.getParameter("subject");
		   String content=mr.getParameter("content");
		   String pwd=mr.getParameter("pwd");
		   String filename=mr.getOriginalFileName("upload");
		   
		   DataBoardVO vo=new DataBoardVO();
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   // �ʼ� 
		   if(filename==null)
		   {
			   vo.setFilename("");
			   vo.setFilesize(0);
			   vo.setFilecount(0);
		   }
		   else
		   {
			   File f=new File("c:\\download\\"+filename);
			   vo.setFilename(f.getName());
			   vo.setFilesize((int)f.length());
			   vo.setFilecount(1);
		   }
		   
		   // DAO ���� 
		   DataboardDAO dao=new DataboardDAO();
		   dao.databoardInsert(vo);
		   // ȭ���̵� 
		   res.sendRedirect("../music/main.jsp?mode=12");
		   
	   }catch(Exception ex){}
   }
   public void databoardContentData(HttpServletRequest req)
   {
	   String no=req.getParameter("no");
	   // DAO���� 
	   DataboardDAO dao=new DataboardDAO();
	   DataBoardVO vo=dao.databoardContentData(Integer.parseInt(no));
	   // java=> jsp ó��������� ����    
	   req.setAttribute("vo", vo);
   }
   public void databoardDelete(HttpServletRequest req)
   {
	   String no=req.getParameter("no");
	   req.setAttribute("no", no);
   }
}






