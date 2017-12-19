package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import java.util.*;

//XML�Ľ��ϴ� ����
/*
 *   XML : ���(Ŭ����, ��Ű��, ����Ŭ ����)
 *   Annotation : ã��(=�ε���)
 */

/*
 *   <�����ϴ� ����> => �ڵ��� �ݴ��
 *   web.xml (xml�� ��θ� ����) => DispatcherServlet => WebApplicationContext ==xml(�Ľ�)===> HandlerMapping
 *                             ================= 			||			  <===�����=====
 *                               class�޸��Ҵ�			FileConfig
 *                               ã��(�޼ҵ�)                                        
 */
public class HandlerMapping extends DefaultHandler{
	private List<String> list = new ArrayList<String>();

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		//qName : �±׸� , attributes : �Ӽ���
		try {
			if(qName.equals("context:component-scan")) {
				//��Ű���� ��������
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
