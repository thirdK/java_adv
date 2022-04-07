package homework;

import java.util.Scanner;

/*
경우의 수를 따지는 문제인거 같고 [재귀적으로 접근]한다.

k개의 다른 색상으로 n개의 기둥 울타리를 칠한다.
1개의 울타리는 1개의 색상으로 칠할 수 있으며 인접울타리 1개까지는 같은 색으로 칠할 수 있다.

2개의 상황으로 나누어 생각한다.

[상황1]
칠해야 하는 울타리 n=3
칠 할수 있는 색 k=2라고 해보자

(아직 칠하지 않은 울타리를 주어진 숫자로 생각하고 최종 결과로 전부 칠해진 울타리를 0으로 생각하면...)
(주어진 수를 0으로 만드는 경우의 수를 구하면된다. -> 문제는 인접 울타리는 1개까지만 같은 색으로 칠한다는 제약조건이 있다)

[상황2]
n=3을 0으로 만드는 경우의 수를 만들면 된다.
k는 빼는 수이고 k=1이면 [-1 / -2] 를 할 수 있다.(울타리 1개를 칠하면 -1/하나의 색으로 울타리 2개를 연속해서 칠하면 -2)
k=2 이면 [-1/-2], [-1/-2] 를 할 수 있다. 

상황 1로 생각하면 k=2면 2개의 색이라고 생각하지만 
상황 2로 생각하면 색이 몇 개든 무슨 색이든 그냥 어떠한 상황에서도 -1 아니면 -2이다.


 이제 재귀적으로 생각하면 된다. 
 1. 모든식이 만들어 졌다고 가정한다. (누군가 만들어줬다고 생각한다.) 
 2. 마지막 결과 직전의 상황을 생각한다. 
 	-> 이 문제에서는 울타리 1개/2개만 남았을 때의 경우의 수를 생각한다. (n까지 다 칠해지기 직전의 상황은 n-1이거나 n-2니까)  
 
 모든 경우의 수 = [n-1까지 칠하는 경우의 수] + [n-2까지 칠하는 경우의 수]  그리고 마지막 결과에 도착하기 위한 한번의 연산
 
즉, 마지막 연산 직전의 경우의 수는 solution(n-1) + solution(n-2) 으로 생각한다.(solution()은 임의의 메서드)

 마지막(n번째) 울타리는 k개의 경우의 수가 있다. (1개의 울타리를 k개의 색으로 칠하는 경우의 수는 당연히 주어진 색(k)만큼이다.)
 그렇다면 최종 식은 (solution(n-1)+solution(n-2)) * k 라고 볼 수 있다.
 그런데 n-1 번째와 n-2번째가 같은 색이면 n번재 울타리는 그 한가지 색을 피해야한다. 즉, (k-1)개의 경우의 수다
 최종 식은 (solution(n-1)+solution(n-2)) * (k-1) 으로 한다. 
 
이제 재귀에서 탈출하는 조건문을 만들어야 한다.
일단 n==1 이면 당연히 k를 반환한다. (1개의 울타리를 k개의 색으로 칠하는 경우의 수는 당연히 주어진 색(k)만큼이다.)
 
n==2 일때도 생각해야한다 마지막에 2개의 울타리가 남았다면 경우의 수 k*k 이다.
울타리 2개 까지는 연속되는 색에 대한 문제를 고민할 필요가 없으므로 k*k이다.


k=3인 경우 red/green/blue
	rr, rg, rb
	gg, gr, gb
	bb, br, bg

	k가 2일때		k가 3일때
n=1		2		3
n=2		4		9 -> n이 2일 때 규칙은 k의 제곱이다.


이제 조건식으로

if(n == 1) return k;
if(n == 2) return k*k;

넣으면 끝이다.

 */

public class Hw28 {
	static int k;
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("n개의 기둥 : ");
		int n = sc.nextInt();
		System.out.print("k개의 색 : ");
		k = sc.nextInt();
		System.out.println(solution(n)); 
	}
	
	
	static int solution(int n) {
		if(n == 1) return k;
		if(n == 2) return k*k;
		
		return (solution(n-2)+solution(n-1))*(k-1);
	}
}
