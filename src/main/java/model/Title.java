package model;

import java.util.ArrayList;
import java.util.List;

public class Title {

	public List<String> search(String time1, List<String> titleList, List<String[]> timeList) {
		List<String> result = new ArrayList<String>();
		List<String> first = new ArrayList<String>();
		List<String> second = new ArrayList<String>();
		int timeInt = Integer.parseInt(time1); // String型のtimeをintに変換
		timeInt++;
		String time2 = Integer.toString(timeInt);//time1に１足した値のString型
		
		
		//timeListから検索する時間帯の前半1時間を探す
		for(int i=0; i<timeList.size(); i++) {
			String[] s = timeList.get(i);
			for(int j=0; j<s.length; j++) {
				if(!s[j].equals("0")) {
					String hour = s[j].substring(0, 2); //先頭2文字切り取り(時間帯を取得)
					if(hour.equals(time1)) {
						//時間とタイトルをListに入れる
						first.add(s[j]);
						first.add(titleList.get(i));
					}
				}
			}
		}
		
		//timeListから検索する時間帯の後半1時間を探す
		for(int i=0; i<timeList.size(); i++) {
			String[] s = timeList.get(i);
			for(int j=0; j<s.length; j++) {
				if(!s[j].equals("0")) {
					String hour = s[j].substring(0, 2); //先頭2文字切り取り(時間帯を取得)
					if(hour.equals(time2)) {
						//タイトルと時間をListに入れる
						second.add(s[j]);
						second.add(titleList.get(i));
					}
				}
			}
		}
		
		//並び替え
		sort(first);
		sort(second);
		for(String s: first) result.add(s);
		for(String s: second) result.add(s); 
		
		
		return result;
	}
	 public List<String> sort(List<String> list){
		 String s1,s2,sortTime,sortTitle;
		 int p,q,minNum,minLocate;
		 
		 for(int i=0; i<list.size(); i=i+2) {
			 s1 = list.get(i);
			 s1 = s1.substring(3);
			 p = Integer.parseInt(s1);
			 minNum = p; //最小値の初期値
			 minLocate = i; //最小値の位置の初期値
			 for(int j=i+2; j<list.size(); j=j+2) {
				 s2 = list.get(j);
				 s2 = s2.substring(3);
				 q = Integer.parseInt(s2);
				 if(minNum>q) {
					 minNum = q;
					 minLocate = j;
				 }
			 }
			 //ソート
			 sortTime = list.get(minLocate);
			 list.set(minLocate, list.get(i));
			 list.set(i, sortTime);
			 sortTitle = list.get(minLocate+1);
			 list.set(minLocate+1, list.get(i+1));
			 list.set(i+1, sortTitle);
		}
		 return list;
	 }
}
