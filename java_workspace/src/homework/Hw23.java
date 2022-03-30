package homework;

import java.util.Scanner;
/* 
 * 1. 좌표를 정해진 양식에 맞게 입력받는다.
 * 		-> a1, b1, c2 등등
 * 		-> 행열 입력이 아니라 열행 입력이다.
 * 
 * 2. 입력받은 값을 처리가능한 값으로 변환한다.
 * 		x, y좌표로 생각하면 체스판 범위는 (1,1)~(8,8)
 * 		a1 -> (1,1)		b1 -> (1,2)		c2 -> (2,3)		h8 -> (8,8)
 * 		
 * 		알파벳을 y좌표 숫자로 바꾸기
 * 		- 문자열을 활용한다?
 * 		- 아스키코드 활용한다?
 * 		- 배열을 활용한다?
 * 		편한거 쓰면 될듯
 * 
 * 3. 경우의 수를 판단하여 카운트한다. 이동은 [수직2칸 -> 수평1칸] / [수평2칸 -> 수직1칸]
 * 
 */

public class Hw23 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("나이트의 위치 : ");
		System.out.println(callSol(sc.nextLine()));
	}
	
	static int callSol(String loc) {
		String num = "abcdefgh";	//a~h의 인덱스는 0~7 -> 체스판은 1~8이므로 사용시 +1
		int y = num.indexOf(loc.split("")[0])+1;	//loc[0]요소(알파벳(열))의 인덱스를 num에서 찾아 + 1
		int x = Integer.parseInt(loc.split("")[1]); //loc[1]요소(숫자(행)을 정수로 형변환
		
		return solution(x,y) + solution(y,x);
	}
	
	//경우의 수를 조건으로 검사하면됨
	//x와 y의 위치만 바꾸면 모든 경우의수를 찾기때문에 
	//callSol()메서드에서 호출을 2번 함  -> solution(x,y) + solution(y,x) 
	static int solution(int x, int y) {
		int cnt=0;
		
		if((y-2) > 0) {	
			if((x-1) > 0) cnt++;
			if((x+1) <= 8) cnt++;
		}
		if((y+2) <= 8) {
			if((x-1) > 0) cnt++;
			if((x+1) <= 8) cnt++;
		}
		return cnt;
	}
}
