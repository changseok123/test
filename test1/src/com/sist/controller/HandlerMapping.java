package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import java.util.*;

//XML파싱하는 역할
/*
 *   XML : 등록(클래스, 패키지, 오라클 정보)
 *   Annotation : 찾기(=인덱스)
 */

/*
 *   <동작하는 순서> => 코딩은 반대로
 *   web.xml (xml의 경로명 전송) => DispatcherServlet => WebApplicationContext ==xml(파싱)===> HandlerMapping
 *                             ================= 			||			  <===결과값=====
 *                               class메모리할당			FileConfig
 *                               찾기(메소드)                                        
 */
public class HandlerMapping extends DefaultHandler{
	private List<String> list = new ArrayList<String>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		//qName : 태그명 , attributes : 속성값
		try {
			if(qName.equals("context:component-scan")) {
				//패키지명 가져오기
				String pack = attributes.getValue("base-package");
				list.add(pack);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<String> getList() {
		return list;
	}
	
}
