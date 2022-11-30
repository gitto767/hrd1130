<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h3>성적 조회 목록</h3>
<table class="select_table">
  <tr>
    <th>학년</th>
    <th>반</th>
    <th>번호</th>
    <th>성명</th>
    <th>국어</th>
    <th>영어</th>
    <th>수학</th>
    <th>역사</th>
    <th>총점</th>
    <th>평균</th>
  </tr>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
    try{
    	String sql="select sNo,sName,kor,eng,math,hist from score1130";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String sNo=rs.getString("sNo");
    		String sName=rs.getString("sName");
    		int kor=rs.getInt("kor");
    		int eng=rs.getInt("eng");
    		int math=rs.getInt("math");
    		int hist=rs.getInt("hist");
    		int total=(kor+eng+math+hist);
    		int avg=total/4;
    		String grade=sNo.substring(0,1);
    		String classs=sNo.substring(1,3);
    		String num=sNo.substring(3,5);
    		
    		%>
    	
  <tr>
    <td><%=grade %></td>
    <td><%=classs %></td>
    <td><%=num %></td> 
    <td><%=sName %></td>
    <td><%=kor %></td>
    <td><%=eng %></td>
    <td><%=math %></td>
    <td><%=hist %></td>
    <td><%=total %></td>
    <td><%=avg %></td>
  </tr>
  	<%
    	}
    }catch(Exception e){
    	System.out.println("조회실패");
    	e.printStackTrace();
    }
  %>
  <% 
  PreparedStatement pstmt1=null;
  ResultSet rs1=null;
  
  try{
  	String sql="select sum(kor),sum(math),sum(eng),sum(hist),avg(kor),avg(math),avg(eng),avg(hist) from score1130";
  	pstmt1=conn.prepareStatement(sql);
  	rs1=pstmt1.executeQuery();
  	while(rs1.next()){
  		int kor_s=rs1.getInt("sum(kor)");
  	    int eng_s=rs1.getInt("sum(eng)");
  	    int math_s=rs1.getInt("sum(math)");
  	    int hist_s=rs1.getInt("sum(hist)");
  	    int kor_a=rs1.getInt("avg(kor)");
  	    int eng_a=rs1.getInt("avg(eng)");
  	    int math_a=rs1.getInt("avg(math)");
  	    int hist_a=rs1.getInt("avg(hist)");
  	    int totalsum=(kor_s+eng_s+math_s+hist_s);
  	    int totalavg=totalsum/4;
  	    int avgsum=(kor_a+eng_a+math_a+hist_a);
  	    int avgavg=avgsum/4;
  	    %>
  	    
    <tr>
    <td></td>
    <td></td>
    <td></td>
    <th>총점</th>
    <th><%=kor_s %></th>
    <th><%=eng_s %></th>
    <th><%=math_s %></th>
    <th><%=hist_s %></th>
    <th><%=totalsum %></th>
    <th><%=totalavg %></th>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <th>총평균</th>
    <th><%=kor_a %></th>
    <th><%=eng_a %></th>
    <th><%=math_a %></th>
    <th><%=hist_a %></th>
    <th><%=avgsum %></th>
    <th><%=avgavg %></th>
  </tr>
  <%
  				
  	}
  		
  	}catch(Exception e){
  		e.printStackTrace();
  		System.out.println("조회실패");
  	}
  	%>
  
</table>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>