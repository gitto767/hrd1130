<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="dbconn.jsp" %>

<%
    PreparedStatement pstmt=null;
    String sNo=request.getParameter("sNo");
    String sName=request.getParameter("sName");    
    String kor=request.getParameter("kor");
    String eng=request.getParameter("eng");
    String math=request.getParameter("math");
    String hist=request.getParameter("hist");
    
    try{
    	String sql="insert into score1130 values(?,?,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sNo);
    	pstmt.setString(2, sName);
    	pstmt.setString(3, kor);
    	pstmt.setString(4, eng);
    	pstmt.setString(5, math);
    	pstmt.setString(6, hist);
    	pstmt.executeUpdate();
    	%>
    	<script>
    	  alert("성적입력이 완료 되었습니다.");
    	  location.href="score_select.jsp";
    	</script>
    	<%
    }catch(Exception e){
    	System.out.println("저장 실패");
    	e.printStackTrace();
    } 
  
%>

</body>
</html>