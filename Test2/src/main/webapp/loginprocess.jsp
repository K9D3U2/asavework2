<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.tech.w01.AccountDAO"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="ab" class="com.tech.w01.AccountBean" />
<jsp:setProperty property="*" name="ab" />

<%
	AccountDAO dao=AccountDAO.getInstance();
	int boo=dao.checkAccount(ab);
	
	switch(boo){
	case 0:
		response.sendRedirect("loginsuccess.jsp");
		break;
	case 1:
		out.println("<script>alert('존재하지 않는 계정');</script>");
		out.println("<script>history.go(-1);</script>");
		break;
	case 2:
		out.println("<script>alert('DB Connection Error');history.go(-1);</script>");
		break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<%=boo %>
	</h1>
</body>
</html>