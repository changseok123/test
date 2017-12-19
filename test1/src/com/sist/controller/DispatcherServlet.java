package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WebApplicationContext wc;
	private List<String> list = new ArrayList<String>();
	
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("contextConfigLocation");
		wc = new WebApplicationContext(path);
		list = wc.getList();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd = request.getRequestURI();
			cmd = cmd.substring(request.getContextPath().length()+1);
			/*
			 *   http://localhost:8080/MVCFinalProject/main.do
			 *   					  ========================URI
			 *   					  ================ContextPath => 뒤에있는 /까지 잘라내기 위해 +1
			 */
			
			for(String s : list) {
				Class clsName = Class.forName(s); //클래스 정보 읽기
				
				//Controller라는 Annotation이 올라가 있는지 (@Controller : Model클래스 => 요청처리)
				//어노테이션 없다면
				if(clsName.isAnnotationPresent(Controller.class) == false) {
					continue;
				}
				//Annotation이 존재할 때 객체 메모리 할당
				Object obj = clsName.newInstance();
				
				//메소드 호출
				Method[] methods = clsName.getDeclaredMethods(); //선언되어 있는 클래스의 모든 메소드를 읽어온다.
				for(Method m : methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class); //메소드 위에 있는 RequestMapping이라는 어노테이션 읽어옴
					if(rm.value().equals(cmd)) {
						//@RequestMapping("main.do")
						//rm.value() ==> main.do
											   //가변 매개변수 Object...
						String jsp = (String)m.invoke(obj, request, response);//이름없이 메소드 호출
						RequestDispatcher rd = request.getRequestDispatcher(jsp);
						rd.forward(request, response);
						return; //찾으면 Service메소드 종료
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
