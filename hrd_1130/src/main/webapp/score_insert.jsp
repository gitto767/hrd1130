<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.sNo.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.form.sNo.focus();
	}else if(document.form.sName.value==""){
		alert("성명이 입력되지 않았습니다.");
		document.form.sName.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h3>학생 성적 입력</h3>
<form name="form" method=post action="score_insertProcess.jsp">
<table class="insert_table">
  <tr>
    <th>학번</th>
    <td><input type="text" name="sNo"></td>
  </tr>
  <tr>
    <th>성명</th>
    <td><input type="text" name="sName"></td>
  </tr>
  <tr>
    <th>국어</th>
    <td><input type="text" name="kor"></td>
  </tr>
  <tr>
    <th>수학</th>
    <td><input type="text" name="math"></td>
  </tr>
  <tr>
    <th>영어</th>
    <td><input type="text" name="eng"></td>
  </tr>
  <tr>
    <th>역사</th>
    <td><input type="text" name="hist"></td>
  </tr>
  <tr>
      <td colspan=2 class="last">
        <input class="buttons" type="button" value="등록" onclick="check()">
        <input class="buttons" type="reset" value="취소">
      </td>
    </tr>
</table>
</form>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>