package lecture22;

import java.io.FileInputStream;
import java.io.FileReader;
import java.io.Reader;

public class InputStreamExample {
	public static void main(String[] args) throws Exception {
		String url = "/home/pc32/Download/Total.sql";

		/*
		// TODO Auto-generated method stub
		FileInputStream inputStream = new FileInputStream(url);
		byte[] b = new byte[1024]; // 3.6kb => 3600byte
		String result ="";
		while (inputStream.read(b) != -1) {
			result += new String(b);
			b = new byte[1024];
		}
		System.out.println(result);
		inputStream.close();
		*/
		
		// Reader
		Reader reader = new FileReader(url);
		String readerResult = "";
		char[] c = new char[1024];
		while (reader.read(c) != -1) {
			readerResult += new String(c);
		}
		System.out.println(readerResult);
		reader.close();
	}
}
