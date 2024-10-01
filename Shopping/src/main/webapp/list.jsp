<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 프로그램</title>
</head>
<body>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
 
 <h2>회원목록조회/수정</h2> <br>
 <table>
 <tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출 </th>
</tr>   
		
<%
    System.out.println("list.jsp");

    Connection conn = null;
    Statement stmt = null;
    String grade = "";
    
    JDBConnect jdbc = new JDBConnect();
   
    
    try{

    	
    String sql = "SELECT me.custno, me.custname, me.grade,sum(mo.price) price " +
    			 "FROM MEMBER_TBL_02 me, MONEY_TBL_02 mo " + 
    			 "WHERE me.custno = mo.custno " +
    			 "GROUP BY me.custno, me.custname,me.grade " +
    			 "ORDER by sum(mo.price) desc " ;
    	 
    	 
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
    <td> <%=rs.getString("custno") %></td>
    <td> <%=rs.getString("custname") %></td>
    <td> <%=grade %></td>
    <td> <%=rs.getString("price") %></td>
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