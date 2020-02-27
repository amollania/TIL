package lecture10;

import java.util.Iterator;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HashMapExample1 {
	public static void main(String[] args) {
		//Map 컬렉션 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		//객체 저장
		map.put("Shin", 70);
		map.put("Hong", 52);
		map.put("Dong", 20);
		map.put("Mang", 94);
		//객체 저장된 수 얻기
		System.out.println("총 Entry 수 : " + map.size());
		
		//객체 찾기
		System.out.println("\t Hong : "+ map.get("Hong"));
		System.out.println();
		
		//객체 하나식 처리
		//1. keySet()을 이용하는 방법
		//2. entrySet()을 이용하는 방법
		Set<String>keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()) {
			String key = keyIterator.next();
			Integer value = map.get(key);
			System.out.println("- \t" + key + " : " + value);
		}
		
		// 객체 삭제
		map.remove("Hong");
		System.out.println("총 Entry 수 : " + map.size());
		
		
		// 객체를 하나씩 처리
		Set<Map.Entry<String, Integer>> entrySet = map.entrySet();
		Iterator<Map.Entry<String, Integer>> entryIterator = entrySet.iterator();
		while(entryIterator.hasNext()) {
			Map.Entry<String, Integer> entry = entryIterator.next();
			String key = entry.getKey();
			Integer value = entry.getValue();
			System.out.println("- \t" + key + " : " + value);
		}
		System.out.println();	

		for (String string : keySet) {
			int value = map.get(string);
			System.out.println("[" + string + "]");
		}
		
		
		
		
		// 객체 전체 삭제
		map.clear();
		System.out.println("총 Entry 수 : " + map.size());
	}
}
