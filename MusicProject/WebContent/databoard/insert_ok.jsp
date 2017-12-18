<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
   model.databoardInsert_ok(request, response);
%>
