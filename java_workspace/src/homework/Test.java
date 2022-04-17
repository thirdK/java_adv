package homework;

import java.util.Scanner;

interface Inter{
	public static final int a = 0;
	public static final String str = "";
	
	public abstract void aa();
	
}

class Tt{
	int t=0;
	String str = "";
}

class Test1 extends Tt implements Inter{
	int b= 3;
	@Override
	public void aa() {
		System.out.println(b);
	}
}

public class Test {
	public static void main(String[] args) {
		Test1 t1 = new Test1();
		
		
	}
}
