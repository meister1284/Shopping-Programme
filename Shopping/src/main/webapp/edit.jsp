<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프로그램</title>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
 
 <h2>회원목록조회/수정</h2> <br>
 
 
 <table>
    <tr>
      <th>회원번호</th>
	  <th>회원성명</th>
	  <th>전화번호</th>
	  <th>주소</th>
	  <th>가입일자</th>
	  <th>고객등급</th>
	  <th>거주지역</th>
    </tr>
		
<%
    System.out.println("edit.jsp");

    Connection conn = null;
    Statement stmt = null;
    String grade = "";
    
    JDBConnect jdbc = new JDBConnect();
   
    
    try{

    	String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
    	 
	     //SQL 쿼리를 실행하기 위해 PreparedStatement 
         PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	     //결과를 ResultSet에 저장하는 부분
	     ResultSet rs = pstmt.executeQuery();
	 
	 	 
	 while(rs.next()) {
		 
			 grade = rs.getString("grade");  //고객등급 체크

			 switch(grade) {   
		     case "A":
		    	grade = "VIP";
		    	break;
		     case "B":
		    	grade = "일반";
		    	break;
		     case "C":
		    	grade = "직원";
		    	break;
	       }
			 		 
%>

 <tr>
    <!--   <td> <%=rs.getString(1) %></td>   -->
     <td><a href="modify.jsp?mod_custno=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
	 <td> <%=rs.getString(2) %></td>
	 <td> <%=rs.getString(3) %></td>
	 <td> <%=rs.getString(4) %></td>
	 <td> <%=rs.getDate(5) %></td>
	 <td> <%=grade %></td>
	 <td> <%=rs.getString(7) %></td>
	
 </tr>
 
<%

  }
    } catch(Exception e){
	 e.printStackTrace();
 }
%>
</table>

</section>


 <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>