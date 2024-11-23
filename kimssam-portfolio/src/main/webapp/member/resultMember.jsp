<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository"
	scope="session" />
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
<style>
#information {
	margin-top: 300px;
	margin-bottom: 158px;
	margin-left: 300px;
}

h2>i {
	color: red;
}

h2>b {
	color: blue;
}
</style>
</head>

<body>

	<!-- header include-->
	<%@ include file="/step06/navi.jsp"%>


	<h1>회원정보</h1>
	<div class="container text-center" id="information">
		<%
		String msg = request.getParameter("msg");
		if (msg != null) {
			if (msg.equals("1"))
				out.print("<h2>회원가입을 <b> 축하드립니다 </b> 로그인을 해주세요</h2>");
			else if (msg.equals("2")) {
				String loginId = (String) session.getAttribute("sessionId");
				out.print("<h2>" + loginId + "님 <b> 환영합니다 </b></h2>");
			} else if (msg.equals("0")) {
				out.print("<h2 class='alert alert-danger text-center'> 회원정보가 수정되었습니다.</h2>");
			}
		} else {
			out.print("<h2>회원가입을 <i> 실패하였습니다 </i> 정보를 재입력해주세요</h2>");
		}
		%>
	</div>





	<!-- footer include -->
	<%@ include file="/step06/footer.jsp"%>

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