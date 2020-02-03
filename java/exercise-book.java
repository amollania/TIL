// 값의 리스트로 배열 생성
public class main {
    public static void main(String[] args) {

        int[] scores;
        scores = new int[] {83, 90, 87};
        int sum1 = 0;

        for(int i=0; i<3; i++) {
            sum1 += scores[i];
        }
        System.out.println("총합 : "+sum1);
        int sum2 = add(new int[] {83, 90, 87});
        System.out.println(("총합 : "+sum2));
        System.out.println();
    }

    public static int add(int[] scores) {
        int sum = 0;
        for(int i=0; i<3; i++) {
            sum += scores[i];
        }
        return sum;
    }
}


// new 연산자로 배열 생성
public class main {
    public static void main(String[] args) {

        // arr1
        int[] arr1 = new int[3];		
        for(int i=0; i<3; i++) {
            System.out.println("arr1 [" + i + "] : " + arr1[i]);
        }
        arr1[0] = 10;
        arr1[1] = 20;
        arr1[2] = 30;
        for(int i=0; i<3; i++) {
            System.out.println("arr2 [" + i + "] : " + arr1[i]);
        }
        
        // arr2
        double[] arr2 = new double[3];
        for(int i=0; i<3; i++) {
            System.out.println("arr2 [" + i + "] : " + arr2[i]);
        }
        
        // arr3 - result : null
        String[] arr3 = new String[3];
        for(int i=0; i<3; i++) {
            System.out.println("arr3[" + i + "] : " + arr3[i]);
        }
        
        arr3[0] = "1월";
        arr3[1] = "2월";
        arr3[2] = "3월";
        
        for(int i=0; i<3; i++) {
            System.out.println("arr3[" + i + "] : " + arr3[i]);
        }
    }
}

//배열의 length 필드
public class main {
	public static void main(String[] args) {

		int[] scores = {83, 90, 87};
		
		int sum = 0;
		for(int i=0; i<scores.length; i++) {
			sum += scores[i];
		}
		System.out.println("총합 : "+sum);
		
		double avg = (double) sum / scores.length;
		System.out.println("평균 : " + avg);

	}
}


//향상된 for문
public static void main(String[] args) {

    int[] scores = {95, 71, 84, 93, 87};
    
    int sum = 0;
    for (int score : scores) {
        sum = sum + score;
    }
    System.out.println("점수 총합 = " + sum);
    
    double avg = (double) sum / scores.length;
    System.out.println("점수 평균 = " + avg);

}


//주어진 항목에서 최대값을 구해보세요. (for문)
public static void main(String[] args) {
		
    int max = 0;
    int [] arrary= {1, 5, 3, 8, 2};
    
    for (int run=0;run<arrary.length;run++) {
        if(arrary[run] > max ) {
            max = arrary[run];
        }
    }
    System.out.print(max);
}


//주어진 항목의 합과 평균 구하기
public static void main(String[] args) {
		
    int[][] array = {
            {95, 86},
            {93, 92, 96},
            {78, 83, 93, 87, 88}
    };
    
    int sum = 0;
    double avg = 0.0;
    
    
    for(int i=0; i<array.length; i++) {
        for(int j=0; j<array[i].length; j++) {
            sum += array[i][j];
            avg ++;
        }
    }
    avg = sum / avg;
    
    System.out.println("sum : "+ sum);
    System.out.println("avg : "+ avg);   
}

