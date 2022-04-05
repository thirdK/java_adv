package homework;

import java.util.Scanner;

public class Test {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("x = ");
		String x = sc.nextLine();
		
		if(check(x)) System.out.println("true");
		else System.out.println("false");
	}
	
	static boolean check(String x) {
		String str = "";
		for(int i=x.length()-1; i>=0; i--) {
			str += x.charAt(i);
		}
		return x.equals(str);
	}
}
