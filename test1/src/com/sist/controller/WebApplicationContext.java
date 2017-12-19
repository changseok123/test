package com.sist.controller;
import java.io.File;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

//Ŭ���� ������
public class WebApplicationContext {
	
	private List<String> list = new ArrayList<String>();
	/*public static void main(String[] args) {
		String path = "C:\\webDev\\mvcStudy\\MVCFinalProject\\WebContent\\WEB-INF\\application-context.xml";
		WebApplicationContext wc = new WebApplicationContext(path);
		
	}*/
	public WebApplicationContext(String path) {
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			//SAX�ļ��� ����
			SAXParser sp = spf.newSAXParser();
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm);
			List<String> packList = hm.getList();//��Ű���� ����ִ� list
			
			FileConfig fc = new FileConfig();
			for(String pack : packList) {
				List<String> p = fc.componentScan(pack);
				for(String s : p) {
					System.out.println(s);
					list.add(s);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public List<String> getList() {
		return list;
	}
}
