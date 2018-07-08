package model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ReadText {
	public List<String> Title(String fileName){
		List<String> titleList = new ArrayList<String>();
		FileReader fr = null;
		BufferedReader br = null;
		//映画タイトル読み込み
				try {
					fr = new FileReader(fileName);
			        br = new BufferedReader(fr);
			 
			        String line;
			        while ((line = br.readLine()) != null) {
			        	titleList.add(line);
			        }
			    } catch (FileNotFoundException e) {
			        e.printStackTrace();
			    } catch (IOException e) {
			        e.printStackTrace();
			    } finally {
			        try {
			            br.close();
			            fr.close();
			        } catch (IOException e) {
			            e.printStackTrace();
			        }
			    }
		return titleList;
	}
	
	public List<List<String>> Time(String fileName){
		List<List<String>> timeList = new ArrayList<List<String>>();
		FileReader fr = null;
		BufferedReader br = null;
		//映画上映時刻読込(上映回数が5未満の場合はtextに0を入れる)
				try {
					fr = new FileReader(fileName);
			        br = new BufferedReader(fr);
			 
			        String line;
			        while ((line = br.readLine()) != null) {
			        	List<String> timeArray = new ArrayList<String>();
			        	String[] time = line.split(",",0); //カンマ区切り
			        	for(int i=0; i<time.length; i++) {
			        		timeArray.add(time[i]);
			        	}
			        	timeList.add(timeArray);
			        }
			    } catch (FileNotFoundException e) {
			        e.printStackTrace();
			    } catch (IOException e) {
			        e.printStackTrace();
			    } finally {
			        try {
			            br.close();
			            fr.close();
			        } catch (IOException e) {
			            e.printStackTrace();
			        }
			    }
				
		return timeList;
	}

}
