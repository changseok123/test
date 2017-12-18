package com.sist.temp;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
public class EmpManager {
   public void jspSendData(HttpServletRequest req)
   {
	   EmpDAO dao=new EmpDAO();
	   List<EmpVO> list=dao.empAllData();
	   req.setAttribute("list", list); 
   }
}
