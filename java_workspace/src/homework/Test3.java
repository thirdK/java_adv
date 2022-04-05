package homework;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;
import java.util.stream.Collectors;
//버전의 . 을 기준으로 1칸이라고 보고 각 칸의 숫자를 비교한다.
//선행되는 0은 정수형태로 바꾸어 생략하면된다. -> 0001 == 1
public class Test3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);	//스캐너 객체 생성
		System.out.print("version1 = ");		//버전 1을 입력받음
		String ver1 = sc.nextLine();			//문자열로 저장
		System.out.print("version2 = ");		//버전 2를 입력받음
		String ver2 = sc.nextLine();			//문자열로 저장
		
		System.out.println(BB.verCheck(ver1, ver2));	//방법 1
		System.out.println(BB.verCheck2(ver1, ver2));	//방법 2
	}
}

class BB{
	static int verCheck(String ver1, String ver2) {
		String[] str1 = ver1.split("\\.");	//split으로 쪼개서 배열에 담는다.
		String[] str2 = ver2.split("\\.");	//split은 매개변수로 정규식을 받으므로 "\\."을 넣는다.
		int[] arr1 = new int[str1.length];	//정수로 저장하여 선행 0을 날려준다.
		int[] arr2 = new int[str1.length];	//각 배열의 크기와 일치하는 정수배열을 만든다.	
		int result = 0;						//결과 (0/1/-1)을 저장할 변수
		int len = arr1.length > arr2.length ? arr1.length : arr2.length; //둘중 길이가 긴 배열의 길이를 저장한다.
		
		for(int i=0; i<str1.length; i++) {			//str1의 요소를 정수형으로 변환하여
			arr1[i] = Integer.parseInt(str1[i]); 	//arr1배열에 저장한다.
		}
		for(int i=0; i<str2.length; i++) {			//str2의 요소를 정수형으로 변환하여
			arr2[i] = Integer.parseInt(str2[i]); 	//arr2배열에 저장한다.
		}
		
		for(int i=0,j=0; i<len; i++, j++) {		//i와 j를 len만큼 증가시키며 반복
			int tmp1 = 0, tmp2 = 0;				//0으로 초기화 하므로 길이가 짧을 경우 0을 갖게된다.
			if(i<arr1.length) tmp1 = arr1[i];	//index오류 막기위해 조건문사용
			if(j<arr2.length) tmp2 = arr2[i];	//존재하는 index이면 각 배열의 값이 tmp1/tmp2에 저장
												//존재하지 않으면 위에서 초기값으로 설정한 0을 가짐
			if(tmp1 == tmp2) result=0;			//자리수를 비교한 결과 같으면 0
			else if(tmp1 > tmp2) {				//tmp1이 크면
				result = 1;						//1을 저장
				break;							//반복문 탈출
			}
			else {								//tmp2가 크면
				result = -1;					//-1을 저장
				break;							//반복문 탈출
			}
		}
		
		return result;		//result 반환 (0/1/-1)
	}
	
	
	//방법 2 스트림과 Queue를 사용
	static int verCheck2(String ver1, String ver2) {
		int result = 0;	//결과(0/1/-1)를 저장할 변수
		//(Queue는 인터페이스 이므로 Queue를 구현한 LinkedList형태의 인스턴스를 생성해야 한다.)
		
		Queue<Integer> q1 = Arrays.stream(ver1.split("\\."))	//ver1을 스플릿으로 나눠서 반환된 배열로 스트림 생성
				.map(Integer::valueOf)							//각 요소를 String에서 Integer로 변환
				.collect(Collectors.toCollection(LinkedList::new));//반환을 LinkedList로
		
		Queue<Integer> q2 = Arrays.stream(ver2.split("\\.")).map(Integer::valueOf).collect(Collectors.toCollection(LinkedList::new));
		//위와 동일하다.
		
		while(!q1.isEmpty() || !q2.isEmpty()) {	//q1과 q2중 하나라도 값이 있으면 반복
			int tmp1=0, tmp2=0;					//초기값을 0으로
			if(!q1.isEmpty()) tmp1 = q1.poll();	//각 요소를 앞에서부터 꺼내는데
			if(!q2.isEmpty()) tmp2 = q2.poll();	//null예외가 발생할 수 있으므로 조건문 사용 
			
			if((result = check(tmp1, tmp2)) != 0) break;	//check()메서드의 결과가 0이 아니면 탈출
		}
		return result;	//결과 반환
	}
	
	static int check(int num1, int num2) {//숫자 2개를 매개변수로 받는 메서드
		if(num1==num2) return 0;	//같으면 0
		if(num1>num2) return 1;		//num1이 크면 1
		else return -1;				//num2가 크면 -1
	}
}
