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
		
		int[] arr = new int[len];
		for(int i=0; i<len; i++) {
			arr[i] = sc.nextInt();
		}
		
		solution1(arr);	//방법 1
		solution2(arr);	//방법 2
		solution3(arr); //방법 3
		//한번에 돌려도 상관 없지만 배열을 매개변수로 보내기 때문에 하나씩 돌리는게 정확함
	}
//==========================================================================
	static void solution1(int[] arr) {	//반복문 돌리기
		Arrays.sort(arr);					//우선 오름차순 정렬
//		int[] result = new int[arr.length];	//result를 사용하면 2개의 배열을 사용하게됨
		
//		for(int i=0; i<arr.length; i++) {	//result를 사용하는 방법.. 반대로 넣기만하면 됨
//			result[arr.length-1 - i] = arr[i];
//		}
		
		for(int i=0; i<arr.length/2; i++) {	//내부에서 정렬하는 방법
			int tmp = arr[i];
			arr[i] = arr[arr.length-1-i];
			arr[arr.length-1-i] = tmp;
		}
		
		for(int i : arr) {
			System.out.print(i+" ");
		}
		System.out.println();
	}
//===========================================================================================
	//Arrays.sort()의 comparator를 람다로 구현해서 역정렬
	static void solution2(int[] arr) {
		Integer[] arr2 = new Integer[arr.length];	//Integer배열로 생성
		
		for(int i=0; i<arr.length; i++) {	//옮겨 담기
			arr2[i] = arr[i];
		}
		Arrays.sort(arr2, (i1,i2) -> i2-i1);	
		//comparator를 람다로 구현하면됨.. 대신 기본자료형은 안되고 래퍼클래스를 사용해야함
		
		for(int i : arr2) {
			System.out.print(i+" ");
		}
		System.out.println();
	}
	
//===========================================================================================
	//stream을 이용하여 역정렬
	static void solution3(int[] arr) {
		Arrays.stream(arr)	//스트림 생성
			.boxed()		//박싱
			.sorted(Comparator.reverseOrder()) //역정렬
			.forEach(i -> System.out.print(i + " ")); //출력
	}
}
