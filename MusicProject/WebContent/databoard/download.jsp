<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,java.net.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
    String path="c:\\download";
    try
    {
    	String fn=request.getParameter("fn");
    	// 파일 정보 읽기 
    	// 파일명 , 파일 크기를 미리 보내준다 header
    	File f=new File(path+"\\"+fn);
    	
    	response.setHeader("Content-Disposition", "attachment;filename="
    			       +URLEncoder.encode(fn, "UTF-8"));
    	response.setContentLength((int)f.length());
    	
    	BufferedInputStream bis=
    		new BufferedInputStream(new FileInputStream(f));
    	BufferedOutputStream bos=
    		new BufferedOutputStream(response.getOutputStream());
    	int i=0;
    	byte[] buffer=new byte[1024];
    	while((i=bis.read(buffer, 0, 1024))!=-1)
    	{
    		bos.write(buffer, 0, i);
    	}
    	bis.close();
    	bos.close();
    	out.clear();
    	out=pageContext.pushBody();
    	
    }catch(Exception ex){}
%>









