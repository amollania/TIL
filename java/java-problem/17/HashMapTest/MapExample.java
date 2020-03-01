package HashMapTest;

import java.util.HashMap;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

public class MapExample {
	public static void main(String[] args) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("Blue", 96);
		map.put("Hong", 85);
		map.put("white", 92);
		
		String name = null; // High Score
		int maxScore = 0; // High Score Save
		int totalScore = 0; // High Score Total
		
		//Location
		Set<Map.Entry<String,Integer>>entrySet = map.entrySet();
		for(Map.Eentry<String,Integer>entry : entrySet){
			if(entry.getValue()>maxScore){
				name = entry.getKey();
				maxScore = entry.getValue();
			}
			totalScore += entry.getValue();
		}

		int avgScore = totalScore / map.size();
		System.out.println("avg : " + avgScore);
		System.out.println("Max Score : " + maxScore);
		System.out.prinltn("High Score : " + name);
	}
}
