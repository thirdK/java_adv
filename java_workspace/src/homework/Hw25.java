package homework;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.stream.Collectors;

/*
버전1 , 버전2 를 비교하여
버전1이 크면 1 / 버전2가 크면 -1 / 그 외 0

주의할것
선행 0은 무시한다. 1.01 == 1.001		-> 01과 001이 같으려면 문자열을 정수로 바꾸면 된다.

 1. 버전을 2개 입력받는다
 	- 2개의 문자열로 받는다.
 	- split(".")사용해서 2개의 배열로 저장한다. -> 정수형으로 형변환해서 저장
 2. 버전을 비교한다.
 	- 각 배열을 0번 인덱스 부터 비교한다. (Queue를 사용해도 편할듯?)
 		->여기서 각 인덱스는 .을 기준으로 나뉘어 있다. 
 		  1.01이든 1.001이든 2칸 배열이 만들어지고 각 칸에 1이 들어갈 것이다. 즉, 두 버전은 같다. 
 	- 동일한 인덱스에서 한쪽만 1이면 그 버전이 큰것이다. 
 	- 둘다 0이면 한 쪽이라도 1이 나올때까지 다음 칸으로 넘긴다.
 	- 1이 나왔을 때 값을 비교한다.
 	- 만약 끝까지 탐색해도 양쪽다 1이 나오지 않는다면 동일한 값이다. 
 	- 두 배열의 길이가 다른 경우를 주의하자(짧으면 나머지 0으로 계산)
 	

 */

public class Hw25 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("version1 = ");
		String str1 = sc.nextLine();
		System.out.print("version2 = ");
		String str2 = sc.nextLine();
		
		System.out.println(solution(str1, str2));	//배열사용한 결과
		System.out.println(makeQueue(str1, str2));	//Queue를 사용한 결과
	}
	
	
	static int solution(String str1, String str2) {
		//split()메서드는 매개변수를 정규식으로 받으므로 .을 기준으로 나누고 싶으면 "\\."으로 넣어줘야함
		int[] arr1 = Arrays.stream(str1.split("\\.")).mapToInt(Integer::parseInt).toArray();
		int[] arr2 = Arrays.stream(str2.split("\\.")).mapToInt(Integer::parseInt).toArray();
		int result = 0;
		int len = arr1.length > arr2.length ? arr1.length : arr2.length;
		//두 배열의 길이중 긴 배열의 길이를 len에 저장
		
		for(int i=0,j=0; i<len; i++, j++) {
			int tmp1 = 0, tmp2 = 0;	//0으로 초기화 하므로 길이가 짧을 경우 0을 갖게된다.
			if(i<arr1.length) tmp1 = arr1[i];	//index오류 막기위해 조건문사용
			if(j<arr2.length) tmp2 = arr2[i];
			
			if(tmp1 == tmp2) result=0;	//자리수를 비교한 결과
			else if(tmp1 > tmp2) {
				result = 1;
				break;
			}
			else {
				result = -1;
				break;
			}
			//1또는 -1이라는 결과가 나오면 더이상 비교하지 않고 break로 나와서 result 반환함
		}
		
		return result;
	}
	
//=============================================================================================
	//Queue를 사용하는 방법
	//배열 사용과 크게다르지 않음 자리수 비교하는 조건문만 check()메서드로 분리시켰음
	static int makeQueue(String str1, String str2) {
		
		Queue<Integer> q1 = Arrays.stream(str1.split("\\.")).map(Integer::valueOf).collect(Collectors.toCollection(LinkedList::new));
		Queue<Integer> q2 = Arrays.stream(str2.split("\\.")).map(Integer::valueOf).collect(Collectors.toCollection(LinkedList::new));
		int result = 0;
		
		while(!q1.isEmpty() || !q2.isEmpty()) {
			int tmp1=0, tmp2=0;
			if(!q1.isEmpty()) tmp1 = q1.poll();
			if(!q2.isEmpty()) tmp2 = q2.poll();
			
			if((result = check(tmp1, tmp2)) != 0) break;
		}
		return result;
	}
	
	static int check(int num1, int num2) {
		if(num1==num2) return 0;
		if(num1>num2) return 1;
		else return -1;
	}
	
	

}


















