<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="common.JDBConnect" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">modify.jsp
  <title>프로그램</title>
</head>
<body>
   <script src = "script.js" ></script>
   <jsp:include page ="header.jsp"></jsp:include>
   <section class="main-section">
 
 <h2>홈쇼핑 회원수정</h2> <br>
 
 
 <form name="frm" method="post" action="action.jsp">
 
<!--   <input type="hidden"  name="mode" value="modify"> -->
  
 <table>
 
 <%
    System.out.println("modify.jsp");
    JDBConnect jdbc = new JDBConnect();
    
    String custno = "";
    String mod_custno = request.getParameter("mod_custno");
       
    try{    	
    	
     String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNO= "+ mod_custno;
     PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
	 ResultSet rs = pstmt.executeQuery();
	 
     if (rs.next()) {
   
    %>    
    
 <tr>
                <th>회원번호</th>
                <td><input type="text" name="custno" value="<%=mod_custno %>"></td>
            </tr>
            <tr>
                <th>회원성명</th>
                <td><input type="text" name="custname" value="<%=rs.getString(2) %>"></td>
            </tr>
            <tr>
                <th>회원전화</th>
                <td><input type="text" name="phone" value="<%=rs.getString(3) %>"></td>

            </tr>
            <tr>
                <th>회원주소</th>
                <td><input type="text" name="address" value="<%=rs.getString(4) %>"> </td>
            </tr>
            <tr>
                <th>가입일자</th>
                <td><input type="text" name="joindate" value="<%=rs.getDate(5) %>"></td>
            </tr>
            <tr>
                <th>고객등급[A:VIP,B:일반,C:직원]</th>
                <td><input type="text" name="grade" value="<%=rs.getString(6) %>"> </td>
            </tr>
            <tr>
                <th>도시코드</th>
                <td><input type="text" name="city" value="<%=rs.getString(7) %>"></td>
            </tr>
            <tr>
	
  <td colspan="2">
  <button class="btn" type="submit" name="mode" value="mod_up" onclick="modify();">수정</button>
  <button class="btn" type="submit" name="mode" value="mod_del" onclick="del_mod();">삭제</button>
  <button class="btn" type="button" onclick="search();" >조회</button>		
  </td>

</tr>

  <%
        }  //if  끝
    
    }catch(Exception e){
   	 e.printStackTrace();
    } //try 끝
    
  %>
 
</table>
 </form>

</section>


 <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>