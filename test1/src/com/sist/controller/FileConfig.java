package com.sist.controller;

import java.io.*;
import java.util.*;

//com.sist.model.Class�� ���� ������ִ� ����
public class FileConfig {
	public List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		
		try {
			String path = "C:\\webDev\\mvcStudy\\MVCFinalProject\\src\\";
			path = path + pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			
			//�޸��Ҵ� : com.sist.model.Class��
			for(File f : files) {
				String name = f.getName(); //���ϸ� ��������
				String ext = name.substring(name.lastIndexOf(".")+1); //Ȯ���� �б�
				//java���ϸ� �б�
				if(ext.equals("java")) {
					String str = pack + "." + name.substring(0, name.lastIndexOf(".")); //Ŭ��������� ��������
					list.add(str); //pack + Ŭ�������� add
					//�޸��Ҵ����� �������� => Annotation���� ����
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
}
