<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.ProductDAO"%>
<%@page import="util.FileUtil"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

// images로 전체 데이터가 넘어온다.
String pid = null;
String pname = null;
String pprice = null;
String pdesc = null;
String pmanu = null;
String pcate = null;
String pcondi = null;
String pimage = null;

byte[] pfile = null;

ArrayList<String> arr = new ArrayList<>();
//이미지를 여러개 추가하면 이름을 여러개 저장하기 위해 ArrayList사용

ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
// 추출 값들을 객체 형태로 저장할 준비
List items = sfu.parseRequest(request);
// 입력된 값들을 추출하여 객체에 저장
Iterator iter = items.iterator();
// 순차적으로 접근하기 위해 객체 생성

while (iter.hasNext()) { 
	// 요소가 있으면 계속 반복 없으면 종료
	
	FileItem item = (FileItem) iter.next(); //요소를 하나씩 추출
	// 이미지가 2개 이상이면 이미지 요소를 1개씩 추출함 즉, 2개이상이면 반복문이 2번이상 실행됨
	
	String name = item.getFieldName(); //위에서 추출한 요소의 이름을 가져옴(pid,pname,pimage등등)
	
	System.out.println();
	System.out.println();
	System.out.println(name);//이름 잘 뽑히는지 테스트
	
	if (item.isFormField()) { //이름과 값으로 즉 맵 형태 쌍으로 구성되어 있는지 확인
		//텍스트를 추출		
		String value = item.getString("utf-8");
		if (name.equals("pid"))	pid = value;
		else if (name.equals("pname")) pname = value;
		else if (name.equals("pprice")) pprice = value;
		else if (name.equals("pdesc")) pdesc = value;
		else if (name.equals("pmanu")) pmanu = value;
		else if (name.equals("pcate")) pcate = value;
		else if (name.equals("pcondi")) pcondi = value;
	} else {
		//사진을 추출
		if (name.equals("images")) {
			pimage = item.getName(); //사진이름
			arr.add(pimage);//이미지파일 이름을 ArrayList에 저장함(여러개면 여러개 저장됨)
			
			pfile = item.get(); //사진내용
			
			//서버에 사진 저장
			String root = application.getRealPath(java.io.File.separator);
			System.out.println(root);
			FileUtil.saveImage(root, pimage, pfile);//사진을 서버에 저장하는 메소드 

		}
	}
}
//DB에 게시물 모든 정보 전달
ProductDAO dao = new ProductDAO();
if (dao.insert(pid, pname, pprice, pdesc, pmanu, pcate, pcondi, arr)) {
	response.sendRedirect("productlist.jsp");
}
%>















