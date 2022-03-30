package homework;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("나이트의 위치 : ");
		String loc = sc.nextLine();
		
		String num = "abcdefgh";
		int y = num.indexOf(loc.split("")[0]);
		int x = Integer.parseInt(loc.split("")[1])-1;
		
		System.out.println(callSol(x,y));
		
	}
	static int callSol(int x, int y) {
		return solution(x,y) + solution(y,x);
	}
	static int solution(int x, int y) {
		int cnt=0;
		
		if((y-2) >= 0) {
			if((x-1) >=0) cnt++;
			if((x+1) <=7) cnt++;
		}
		if((y+2) <= 7) {
			if((x-1) >=0) cnt++;
			if((x+1) <=7) cnt++;
		}
		
		
		
		
//		if((tmpY = y-2) >= 0) {
//			if((tmpX = x-1) >=0) arr[tmpX][tmpY] = true;
//			if((tmpX = x+1) <=7) arr[tmpX][tmpY] = true;
//		}
//		if((tmpY = y+2) <= 7) {
//			if((tmpX = x-1) >=0) arr[tmpX][tmpY] = true;
//			if((tmpX = x+1) <=7) arr[tmpX][tmpY] = true;
//		}
//		if((tmpX = x-2) >= 0) {
//			if((tmpY = y-1) >= 0) arr[tmpX][tmpY] = true;
//			if((tmpY = y+1) <= 7) arr[tmpX][tmpY] = true;
//		}
//		if((tmpX = x+2) <= 7) {
//			if((tmpY = y-1) >= 0) arr[tmpX][tmpY] = true;
//			if((tmpY = y+1) <= 7) arr[tmpX][tmpY] = true;
//		}
//		
//		for(int i=0; i<8; i++) {
//			for(int j=0; j<8; j++) {
//				if(arr[i][j]) cnt++;
//			}
//		}
		
		return cnt;
		
	}
}
