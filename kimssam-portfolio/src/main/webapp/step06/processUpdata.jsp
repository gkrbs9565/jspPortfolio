<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %> --%>
<%@ include file="dbconn.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

String filename = "";
String realFolder = application.getRealPath("/resources/assets/img/product/");
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024; //5MB

//이미지 등록시 필요한 MultipartRequest의 생성자 함수를 이용하여 이미지 업로드에 대한 정보 설정
MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
String productId = multi.getParameter("newProduct");
String pName = multi.getParameter("pName");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String condition = multi.getParameter("condition");
String pQuantity = multi.getParameter("pQuantity");

int price;
if (unitPrice.isEmpty())
	price = 0;
else
	price = Integer.valueOf(unitPrice);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

int quantity = Integer.valueOf(pQuantity);

String sql = "select * from product where p_productId = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, productId);
rs = pstmt.executeQuery();

if (rs.next()) {
	if (fileName != null) {
		sql = "UPDATE product SET p_pname=?, p_unitPrice=?, p_description=?, p_category=?, p_condition=?, p_filename=?, p_quantity=? WHERE p_productId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pName);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setString(5, condition);
		pstmt.setString(6, fileName);
		pstmt.setInt(7, quantity);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();
	} else {
		sql = "UPDATE product SET p_pname=?, p_unitPrice=?, p_description=?, p_category=?, p_condition=?, p_filename=?, p_quantity=? WHERE p_productId";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pName);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setString(5, condition);
		pstmt.setString(6, fileName);
		pstmt.setInt(7, quantity);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();
	}
}

if(rs != null)
	rs.close();
if(pstmt != null)
	pstmt.close();
if(conn != null)
	conn.close();

response.sendRedirect("index.jsp?edit=update#products");
%>
