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
   <script src = "script.js" ></script>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
 
 <h2>홈쇼핑 회원등록</h2> <br>
 
 
 <form name="frm" method="post" action="action.jsp">
 
  <input type="hidden"  name="mode" value="insert">
  
 <table>
 
 <%
    System.out.println("join.jsp");
    Connection conn = null;
    Statement stmt = null;
    String custno = "";
    
    JDBConnect jdbc = new JDBConnect();
       
    try{
    	
     String sql = "SELECT MAX(custno)+1 custno FROM MEMBER_TBL_02" ;
	 //SQL 쿼리를 실행하기 위해 PreparedStatement 
	 PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	 //결과를 ResultSet에 저장하는 부분
	 ResultSet rs = pstmt.executeQuery();
	 rs.next();  //제목줄 넘기기
	 custno = rs.getString("custno"); //마지막번호 가져오기
    }
    catch(Exception e){
   	 e.printStackTrace();
    }
    %>    
 <tr>
    <th>회원번호(자동발생)</th>
    <td><input type="text"  name="custno" value="<%=custno %>" readonly></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" autofocus></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" placeholder="예)010-1111-5555"></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" ></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type="text" name="joindate" placeholder="예)2015-12-12"></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade" ></td>
	</tr>
	<tr>
		<th>도시코드[01,30,60]</th>
		<td><input type="text" name="city" placeholder="예)01,30,60"></td>
	</tr>
	<tr>
	
    <td colspan="2">
  <button class="btn" type="submit" onclick="fn_submit(); return false;">등록</button>
  <button class="btn" type="button" onclick= "location='list.jsp'" >조회</button>		
	
		</td>
	</tr>
 
</table>
 </form>

</section>


 <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>