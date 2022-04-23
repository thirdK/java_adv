<%@page import="dao.JoinDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="dao.GymDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//session.setAttribute("이름", user_no);
//String user_no = session.getAttribute(name);
String user_no = "4";
ArrayList<String> toList = null;
ArrayList<String> fromList = null;
%>
<body>
	<div class="notify">


		<%
			final int LINE_PER_PAGE = 5; //페이지당 출력 줄
		final int PAGE_PER_BLOCK = 5; //블럭당 페이지

		int totalRow1 = 0; //총 게시물
		int totalPage1 = 0; //총 페이지

		int startPointer1 = 0; //DB 검색 시작 위치
		int curPageNo1 = 0; //현재 페이지 번호
		int block1 = 0; //블럭 번호
		int blockStartPageNo1 = 0; //블럭의 시작 페이지 번호
		int blockEndPageNo1 = 0; //블럭의 끝 페이지 번호
		int previousBlockStartPageNo1 = 0;//이전 블럭의 시작 페이지
		int nextBlockStartPageNo1 = 0; //다음 블럭의 시작 페이지

		totalRow1 = (new JoinDAO()).getToRow(user_no);
		totalPage1 = (int) Math.ceil((double) totalRow1 / LINE_PER_PAGE);

		//검색 페이지 확인
		if (request.getParameter("pageTo") == null) {
			curPageNo1 = 1;
		} else if (totalPage1 < Integer.parseInt(request.getParameter("pageTo"))) {
			curPageNo1 = totalPage1;
		} else {
			curPageNo1 = Integer.parseInt(request.getParameter("pageTo"));
		}

		startPointer1 = (curPageNo1 - 1) * LINE_PER_PAGE;

		toList = (new JoinDAO()).getToList(user_no, startPointer1, LINE_PER_PAGE);
		%>


		<%
			int totalRow2 = 0; //총 게시물
		int totalPage2 = 0; //총 페이지

		int startPointer2 = 0; //DB 검색 시작 위치
		int curPageNo2 = 0; //현재 페이지 번호
		int block2 = 0; //블럭 번호
		int blockStartPageNo2 = 0; //블럭의 시작 페이지 번호
		int blockEndPageNo2 = 0; //블럭의 끝 페이지 번호
		int previousBlockStartPageNo2 = 0;//이전 블럭의 시작 페이지
		int nextBlockStartPageNo2 = 0; //다음 블럭의 시작 페이지

		totalRow2 = (new JoinDAO()).getFromRow(user_no);
		totalPage2 = (int) Math.ceil((double) totalRow2 / LINE_PER_PAGE);

		//검색 페이지 확인
		if (request.getParameter("pageFrom") == null) {
			curPageNo2 = 1;
		} else if (totalPage2 < Integer.parseInt(request.getParameter("pageFrom"))) {
			curPageNo2 = totalPage2;
		} else {
			curPageNo2 = Integer.parseInt(request.getParameter("pageFrom"));
		}

		startPointer2 = (curPageNo2 - 1) * LINE_PER_PAGE;
		fromList = (new JoinDAO()).getFromList(user_no, startPointer2, LINE_PER_PAGE);
		%>



		<div class="toList">
			<div class="notify_row">
				<div>내가 보낸 목록</div>
			</div>
			<%
				for (String to : toList) {
				GymDTO gym = (new GymDAO()).getGym(to);
			%>
			<div class="notify_row">
				<div>
					<a href="gym의 프로필로"><%=gym.getGym_name()%></a>
					에게 이력서를 보냈습니다.
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="toBlock">
			<%
				//블럭의 번호(몇번째 블럭) = (현재페이지-1 / 블럭당 페이지 수) + 1;
			block1 = ((curPageNo1 - 1) / PAGE_PER_BLOCK) + 1;
			//블럭의 시작 페이지 번호 = ((블럭 번호 - 1) * 블럭당 페이지 수) +1;
			blockStartPageNo1 = ((block1 - 1) * PAGE_PER_BLOCK) + 1;
			//블럭의 끝 페이지 번호 = (블럭의 시작 페이지 번호 + 블럭당 페이지 수) - 1;
			blockEndPageNo1 = (blockStartPageNo1 + PAGE_PER_BLOCK) - 1;

			if (block1 > 1) {
				//[맨처음]
				out.print("&nbsp[<a href='notifyList.jsp?pageTo=1&pageFrom=" + curPageNo2 + "'>" + "맨처음</a>]&nbsp");

				//이전 블록 시작 페이지 = (현재)블럭 시작페이지 번호 - 블록당 페이지 수;
				previousBlockStartPageNo1 = blockStartPageNo1 - PAGE_PER_BLOCK;

				//[이전]
				out.print("&nbsp[<a href='notifyList.jsp?pageTo=" + previousBlockStartPageNo1 + "&pageFrom=" + curPageNo2
				+ "'>이전</a>]&nbsp");
			}

			// i를 (블록의 시작 페이지 넘버)부터 (블록의 끝 페이지 넘버)까지 i++ 
			for (int i = blockStartPageNo1; i <= blockEndPageNo1; i++) {
				if (i > totalPage1)
					break;
				if (i == curPageNo1)
					out.print("&nbsp" + i + "&nbsp");
				else
					out.print("&nbsp[<a href='notifyList.jsp?pageTo=" + i + "&pageFrom=" + curPageNo2 + "'>" + i + "</a>]");
				// i가 총페이지를 넘어가면 반복 종료
				// i가 현재 페이지와 같으면 i출력
				// 그 외에는 [i]출력
				// 즉, 지금 블럭의 시작 부터 끝까지 페이지 번호를 링크걸어서 뿌려줌
			}

			if (blockEndPageNo1 < totalPage1) {
				//다음 블럭 시작 페이지
				nextBlockStartPageNo1 = blockEndPageNo1 + 1;
				out.print("&nbsp[<a href = 'notifyList.jsp?pageTo=" + nextBlockStartPageNo1 + "&pageFrom=" + curPageNo2
				+ "'>다음</a>]&nbsp");
				out.print("&nbsp[<a href = 'notifyList.jsp?pageTo=" + totalPage1 + "&pageFrom=" + curPageNo2 + "'>맨끝</a>]&nbsp");
			}
			%>
		</div>


		<!-- ==================================================================================  -->


		<div class="fromList">
			<div class="notify_row">
				<div>내가 받은 목록</div>
			</div>
			<%
				for (String from : fromList) {
				GymDTO gym = (new GymDAO()).getGym(from);
			%>
			<div class="notify_row">
				<div>
					<a href="gym의 프로필로"><%=gym.getGym_name()%></a>
					에게서 알림이 왔습니다.
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="fromBlock">
			<%
				//블럭의 번호(몇번째 블럭) = (현재페이지-1 / 블럭당 페이지 수) + 1;
			block2 = ((curPageNo2 - 1) / PAGE_PER_BLOCK) + 1;
			//블럭의 시작 페이지 번호 = ((블럭 번호 - 1) * 블럭당 페이지 수) +1;
			blockStartPageNo2 = ((block2 - 1) * PAGE_PER_BLOCK) + 1;
			//블럭의 끝 페이지 번호 = (블럭의 시작 페이지 번호 + 블럭당 페이지 수) - 1;
			blockEndPageNo2 = (blockStartPageNo2 + PAGE_PER_BLOCK) - 1;

			if (block2 > 1) {
				//[맨처음]
				out.print("&nbsp[<a href='notifyList.jsp?pageTo=" + curPageNo1 + "&pageFrom=1'>" + "맨처음</a>]&nbsp");

				//이전 블록 시작 페이지 = (현재)블럭 시작페이지 번호 - 블록당 페이지 수;
				previousBlockStartPageNo2 = blockStartPageNo2 - PAGE_PER_BLOCK;

				//[이전]
				out.print("&nbsp[<a href='notifyList.jsp?pageTo=" + curPageNo1 + "&pageFrom=" + previousBlockStartPageNo2
				+ "'>이전</a>]&nbsp");
			}

			// i를 (블록의 시작 페이지 넘버)부터 (블록의 끝 페이지 넘버)까지 i++ 
			for (int i = blockStartPageNo2; i <= blockEndPageNo2; i++) {
				if (i > totalPage2)
					break;
				if (i == curPageNo2)
					out.print("&nbsp" + i + "&nbsp");
				else
					out.print("&nbsp[<a href='notifyList.jsp?pageTo=" + curPageNo1 + "&pageFrom=" + i + "'>" + i + "</a>]");
				// i가 총페이지를 넘어가면 반복 종료
				// i가 현재 페이지와 같으면 i출력
				// 그 외에는 [i]출력
				// 즉, 지금 블럭의 시작 부터 끝까지 페이지 번호를 링크걸어서 뿌려줌
			}

			if (blockEndPageNo2 < totalPage2) {
				//다음 블럭 시작 페이지
				nextBlockStartPageNo2 = blockEndPageNo2 + 1;
				out.print("&nbsp[<a href = 'notifyList.jsp?pageTo=" + curPageNo1 + "&pageFrom=" + nextBlockStartPageNo2
				+ "'>다음</a>]&nbsp");

				out.print("&nbsp[<a href = 'notifyList.jsp?pageTo=" + curPageNo1 + "&pageFrom=" + totalPage2 + "'>맨끝</a>]&nbsp");
			}
			%>
		</div>
	</div>
</body>
</html>