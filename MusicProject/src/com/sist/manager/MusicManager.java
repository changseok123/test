package com.sist.manager;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.MusicDAO;
import com.sist.vo.MusicVo;

//<tr class="list rank-1" songId="87546441">
//	<td class="check"><input type="checkbox" class="select-check" title=" ¡¡æ∆ "/>
//	<td class="number">1
//  	<span class="rank"><span class="rank-none"><span class="hide">¿Ø¡ˆ</span></span></span>
//	</td>
//	<td><a href="#" class="cover"  onclick="fnViewAlbumLayer(81002774); return false;" ontouchend="fnViewAlbumLayer(81002774); return false;" ><span class="mask"></span><img onerror="this.src='//image.genie.co.kr/imageg/web/common/blank_68.gif';" src="//image.genie.co.kr/Y/IMAGE/IMG_ALBUM/081/002/774/81002774_1510722333800_1_140x140.JPG" alt="¡¡æ∆" /></a></td>
//	<td class="link"><a href="#" class="btn-basic btn-info" onclick="fnViewSongInfo(87546441); return false;" ontouchend="fnViewSongInfo(87546441); return false;" >∞Ó ¡¶∏Ò ¡§∫∏ ∆‰¿Ã¡ˆ</a></td>
//  <td class="info">
//       <a href="#" class="title ellipsis" title="¡¡æ∆" onclick="fnPlaySong('87546441;','1'); return false;" ontouchend="fnPlaySong('87546441;','1'); return false;">
//¡¡æ∆</a>
//        <a href="#" class="artist ellipsis"onclick="fnViewArtist(80548643); return false;" ontouchend="fnViewArtist(80548643); return false;" >πŒº≠ & ¿±¡æΩ≈</a>

public class MusicManager {
	
	public static void main(String[] args) {
		MusicManager m = new MusicManager();
		List<MusicVo> list = m.genieTop100();
//		m.youtubeKeyData("¡¡¥œ");
		MusicDAO dao = new MusicDAO();
		for (MusicVo vo : list) {
			dao.musicInsert(vo);
		}
		System.out.println("¿˙¿Â ¡æ∑·");
	}
	
	public List<MusicVo> genieTop100() {
		List<MusicVo> list = new ArrayList<MusicVo>();
		
		try {
			Document doc = Jsoup.connect("http://www.genie.co.kr/chart/top100").get();
			Elements title = doc.select("tr.list td.info a.title");
			Elements poster = doc.select("tr.list td a.cover img");
			Elements singer = doc.select("tr.list td.info a.artist");
			Elements temp = doc.select("tr.list td.number");
//			Elements state = doc.select("tr.list td.number span.hide");
//			Elements in = doc.select("tr.list td.number");
			
			for(int i = 0; i < 50; i++) {
				Element t = title.get(i);
				Element s = singer.get(i);
				Element tmp = temp.get(i);
				String str = tmp.text();
				// [A-Za-z] [0-9] [∞°-»˛]+s
				String rank = str.substring(0, str.indexOf(" "));
				String state = str.replaceAll("[^∞°-»˛]","");
//				String state = str.substring(str.length()-2, str.length());
				String in = str.substring(str.indexOf(" ")+1);
//				in = in.replaceAll(state, "");
				in = in.replaceAll("[∞°-»˛]", "");
				if(in.equals(""))
					in = "0";
				Element p = poster.get(i);
				
//				System.out.println(t.text()+" = "+s.text() + " = " + tmp.text() + " = " + p.attr("src") + " = ∑©≈© : " + rank + " = " + state + " = " + in);
				
				MusicVo vo = new MusicVo();
				vo.setNo(i+1);
				vo.setTitle(t.text());
				vo.setSinger(s.text().replace("&", "^"));
				vo.setPoster("http:"+p.attr("src"));
				vo.setState(state);
				vo.setRank(Integer.parseInt(rank));
				vo.setIdincrement(Integer.parseInt(in));
				String tt = t.text();
				int index = tt.indexOf("(");
				if(index > 0) {
					tt = tt.substring(0, tt.indexOf("(")).trim();
				}
				vo.setKey(youtubeKeyData(tt));
				list.add(vo);
			}
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return list;
	}
	
	public String youtubeKeyData(String title) {
		String data = "";
		
		try {
			Document doc = Jsoup.connect("https://www.youtube.com/results?search_query="+title).get();
			String pattern = "/watch\\?v=[^∞°-∆R]+";
//			System.out.println(doc.toString());
			Pattern p = Pattern.compile(pattern); // ø¯«œ¥¬ πÆ¿Â¿ª ≈Ωªˆ // like %/watch?v=%
			Matcher m = p.matcher(doc.toString());
			while(m.find()) {
				data = m.group();
				break;
			}
			data = data.substring(data.indexOf("=")+1, data.indexOf("\""));
			
//			System.out.println(data);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		return data;
	}
}
