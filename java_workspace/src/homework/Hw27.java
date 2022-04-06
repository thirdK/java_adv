package homework;

import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class Hw27 {
	//내림차순 정렬문제
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		System.out.print("정렬할 요소의 수 : ");
		int len = sc.nextInt();
		
		solution1(len);	//방법 1
		solution2(len);	//방법 2
		solution3(len); //방법 3
	}
//==========================================================================
	static void solution1(int len) {	//반복문 돌리기
		System.out.println("첫번째 요소들 입력");
		int[] arr = new int[len];
//		int[] result = new int[arr.length];	//result를 사용하면 2개의 배열을 사용하게됨
		
		for(int i=0; i<len; i++) {
			arr[i] = sc.nextInt();
		}
		Arrays.sort(arr);					//우선 오름차순 정렬
		
//		for(int i=0; i<arr.length; i++) {	//result를 사용하는 방법.. 반대로 넣기만하면 됨
//			result[arr.length-1 - i] = arr[i];
//		}
		
		for(int i=0; i<arr.length/2; i++) {	//내부에서 정렬하는 방법
			int tmp = arr[i];
			arr[i] = arr[arr.length-1];
			arr[arr.length-1] = tmp;
		}
		
		for(int i : arr) {
			System.out.print(i+" ");
		}
		System.out.println();
	}
//===========================================================================================
	//Arrays.sort()의 comparator를 람다로 구현해서 역정렬
	static void solution2(int len) {
		System.out.println("두번째 요소들 입력");
		Integer[] arr = new Integer[len];	//Integer배열로 생성
		for(int i=0; i<len; i++) {
			arr[i] = sc.nextInt();
		}
		
		Arrays.sort(arr, (i1,i2) -> i2-i1);	
		//comparator를 람다로 구현하면됨 기본자료형은 안되고 래퍼클래스를 사용해야함
		
		for(int i : arr) {
			System.out.print(i+" ");
		}
		System.out.println();
	}
	
//===========================================================================================
	//stream을 이용하여 역정렬
	static void solution3(int len) {
		System.out.println("세번째 요소들 입력");
		int[] arr = new int[len];
		for(int i=0; i<len; i++) {
			arr[i] = sc.nextInt();
		}
		int[] result = Arrays.stream(arr)	//스트림 생성
				.boxed()					//박싱
				.sorted(Comparator.reverseOrder()) //역정렬
				.mapToInt(Integer::intValue)//각요소 기본자료형으로 변환(언박싱)
				.toArray();					//배열로 반환
		
		for(int i : result) {
			System.out.print(i+" ");
		}
		
		System.out.println();
	}
	
	
}
