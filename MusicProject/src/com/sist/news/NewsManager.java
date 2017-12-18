package com.sist.news;

/*
 * <rss>
 * 	<channel>
 * 		<item>
 * 			<title></title>
 * 			<link></link>
 * 			<description></description>
 * 		</item>
 * 		<item>
 * 			<title></title>
 * 			<link></link>
 * 			<description></description>
 * 		</item>
 * 		<item>
 * 			<title></title>
 * 			<link></link>
 * 			<description></description>
 * 		</item>
 * 	</channel>
 * </rss>
 * 
 */

import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;

public class NewsManager {
	public List<Item> naverNewsAllData() {
		List<Item> list = new ArrayList<Item>();
		
		try {
			//
			URL url = new URL("http://newssearch.naver.com/search.naver?where=rss&query="+URLEncoder.encode("À½¾Ç","UTF-8"));
			JAXBContext jc = JAXBContext.newInstance(Rss.class);
			Unmarshaller un = jc.createUnmarshaller();
			Rss rss = (Rss)un.unmarshal(url);
			list = rss.getChannel().getItem();
			
			
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return list;
	}
}
