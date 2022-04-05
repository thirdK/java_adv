package homework;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

public class Test2 {
	public static void main(String[] args) {
		int[] arr1 = {7, -5, 3, 8, -4, 11, -19, 21};
		int[] arr2 = {6, 13, -7, 0, 11, -4, 3, -5};
		
		int[] result = AA.solution(arr1, arr2);		//방법1
		System.out.println(Arrays.toString(result));
		
		int[] result2 = AA.solution2(arr1, arr2);	//방법2
		System.out.println(Arrays.toString(result2));
		
	}
}

class AA{
	//두개의 배열을 하나의 배열로 합치고 중복은 제거할 것 결과는 정렬된 상태로 만든다.
	
	static int[] solution(int[] arr1, int[] arr2) {
		int[] result;
		int idx=0;
		HashSet<Integer> set = new HashSet<>(); //set은 중복을 허용하지 않으므로 중복제거하기 편하다
		for(int i : arr1) {						//두 배열의 값을 반복문으로 set에 넣는다.
			set.add(i);
		}
		for(int i : arr2) {
			set.add(i);
		}
		result = new int[set.size()]; 			//set의 사이즈 만큼 결과 배열을 생성한다.
		
		Iterator<Integer> it = set.iterator();	//배열에 요소를 추가하기 위해 Iterator 참조변수에 담는다.
		while(it.hasNext()) {					//hasNext()는 값이 존재하면 true를 반환한다.
			result[idx++] = it.next();			//next()는 값을 1개씩 반환한다.
		}
		
		Arrays.sort(result);	//정렬한다.
		return result;			//반환한다.
	}
	
	//스트림 사용하는 방법
	static int[] solution2(int[] arr1, int[] arr2) {
		int[] tmp = new int[arr1.length+arr2.length];
		System.arraycopy(arr1, 0, tmp, 0, arr1.length);	//두개의 배열을 복사하여 tmp에 넣는다.
		System.arraycopy(arr2, 0, tmp, arr1.length, arr2.length);
		
		int[] result = Arrays.stream(tmp)	//스트림 생성
				.boxed()					//박싱
				.distinct()					//중복제거
				.sorted()					//정렬
				.mapToInt(Integer::intValue)//각 요소 언박싱
				.toArray();					//배열로 반환
		
		return result;
	}
}
