package homework;

import java.util.Scanner;

interface Inter{
	public static final int a = 0;
	public static final String str = "";
	
	public abstract void aa();
	
}

class parent{
	int t=0;
	String str = "";
}

class Test1 extends parent implements Inter{
	int b= 3;
	@Override
	public void aa() {
		System.out.println(b);
	}
}

class Tests extends parent {
	int a;
}

public class Test {
	public static void main(String[] args) {
		Test1 t1 = new Test1();
		
		Tests t2 = new Tests();
		t2.a=7;
		
		parent tt = t2;
		
		Tests tt2 = (Tests)tt;
		System.out.println(tt);
		System.out.println((Tests)tt);
		System.out.println(tt2);
		
		
		Tests a1 = new Tests();
		a1.a = 9;
		
		parent parent = (parent)a1;
		
		System.out.println(((Tests)parent).a);
		
		Tests a2 = (Tests)parent;
		
		System.out.println(a2.a);
	}
}
