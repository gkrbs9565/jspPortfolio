<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
	Cookie cartId = new Cookie("Shipping_cartId", request.getParameter("cartId"));
	Cookie name = new Cookie("Shipping_name", request.getParameter("name"));
	Cookie shippingdate = new Cookie("Shipping_shippingdate", request.getParameter("shippingdate"));
	Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
	Cookie addr = new Cookie("Shipping_addr", URLEncoder.encode(request.getParameter("addr"),"utf-8"));
	Cookie detailAddr = new Cookie("Shipping_detailAddr", request.getParameter("detailAddr"));
	Cookie tell = new Cookie("Shipping_tell", request.getParameter("tell"));
	
	cartId.setMaxAge(2*60*60);
	name.setMaxAge(2*60*60);
	shippingdate.setMaxAge(2*60*60);
	zipCode.setMaxAge(2*60*60);
	addr.setMaxAge(2*60*60);
	detailAddr.setMaxAge(2*60*60);
	tell.setMaxAge(2*60*60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingdate);
	response.addCookie(zipCode);
	response.addCookie(addr);
	response.addCookie(detailAddr);
	response.addCookie(tell);
	
	response.sendRedirect("orderConfirmation.jsp");
	
	%>
</body>
</html>