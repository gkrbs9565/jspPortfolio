<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Index - Impact Bootstrap Template</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Favicons -->
<link href="../resources/assets/img/favicon.png" rel="icon">
<link href="../resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="../resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="../resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="../resources/assets/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingdate = "test";
	String shipping_zipCode = "";
	String shipping_addr = "";
	String shipping_detailAddr = "";
	String shipping_tell = "";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();

			if (n.equals("Shipping_cartId"))
		shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
		shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingdate"))
		shipping_shippingdate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
		shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addr"))
		shipping_addr = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_detailAddr"))
		shipping_detailAddr = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_tell"))
		shipping_tell = URLDecoder.decode((thisCookie.getValue()), "utf-8");

		}
	}
	%>
	<!-- header include-->
	<%@ include file="navi.jsp"%>
	<div class="container-fluid bg-light p-5">
		<h1 class="p-5 display-3 mt-5">주문 정보</h1>
	</div>
	<div class="container my-5">
		<div class="row text-center">
			<div class="alert alert-secondary text-center" border="1">
				<h2 class="text-center">영수증</h2>
				<table class="mb-4" width="100%">
					<tr>
						<th>배송 주소</th>
					</tr>
					<tr>
						<td>성명 : <%
						out.println(shipping_name);
						%></td>
					</tr>
					<tr>
						<td>연락처 : <%
						out.println(shipping_tell);
						%></td>
					</tr>
					<tr>
						<td>주소 : <%
						out.println(shipping_addr);
						%></td>
					</tr>
					<tr>
						<td>상세 주소 : <%
						out.println(shipping_detailAddr);
						%></td>
					</tr>
					<tr>
						<td>예상 도착일 : <%
						out.println(shipping_shippingdate);
						%></td>
					</tr>
				</table>

				<table class="table table-submit table-striped" width="100%"
					height="120px">
					<tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>상품별 총액</th>
					</tr>
					<%
					int sum = 0; //결제총액
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();
					for (int i = 0; i < cartList.size(); i++) {
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity(); //total:소계
						sum += total; //sum:결제총액
					%>
					<tr>
						<td><%=product.getProductId()%> - <%=product.getPname()%></td>
						<td><%=product.getUnitPrice()%></td>
						<td><%=product.getQuantity()%></td>
						<td><%=total%></td>
					</tr>

					<%
					}
					%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum%></th>
					</tr>

				</table>
			</div>

		</div>
		<!-- row -->
	</div>

	</div>
	<!-- row -->
	<div class="container mb-5">
		<a href="./cart.jsp" class="btn btn-danger">취소</a> <a
			href="./index.jsp" class="btn btn-primary">주문 완료</a>
	</div>


	<!-- row -->
	</div>








	<!-- footer include -->
	<%@ include file="footer.jsp"%>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="../resources/assets/vendor/aos/aos.js"></script>
	<script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="../resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script
		src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="../resources/assets/js/main.js"></script>

</body>

</html>