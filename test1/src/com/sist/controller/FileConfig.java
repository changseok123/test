package com.sist.controller;

import java.io.*;
import java.util.*;

public class FileConfig {
	public List<String> componentScan(String pack) {
		List<String> list = new ArrayList<String>();
		try {
			String path = "https://github.com/changseok123/test/tree/master/test1/src"+"\\";
			path=path+pack.replace(".", "\\");
			File dir = new File(path);
			File[] files = dir.listFiles();
			//com.sist.model.Class명
			for (File f : files) {
				String name = f.getName();
				String ext = name.substring(name.lastIndexOf(".")+1);

				if (ext.equals("java")) {
					String str = pack+"."+name.substring(0, name.lastIndexOf("."));
					list.add(str);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}

