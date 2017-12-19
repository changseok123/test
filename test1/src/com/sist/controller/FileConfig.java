package com.sist.controller;

import java.io.*;
import java.util.*;

//com.sist.model.Class명 으로 만들어주는 역할
public class FileConfig {
	public List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		
		try {
			String path = "C:\\webDev\\mvcStudy\\MVCFinalProject\\src\\";
			path = path + pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			
			//메모리할당 : com.sist.model.Class명
			for(File f : files) {
				String name = f.getName(); //파일명 가져오기
				String ext = name.substring(name.lastIndexOf(".")+1); //확장자 읽기
				//java파일만 읽기
				if(ext.equals("java")) {
					String str = pack + "." + name.substring(0, name.lastIndexOf(".")); //클래스명까지 가져오기
					list.add(str); //pack + 클래스명을 add
					//메모리할당할지 안할지는 => Annotation으로 구분
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return list;
	}
}
