<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header id="header" class="header fixed-top">

	<div class="topbar d-flex align-items-center">
		<div
			class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
				<i class="bi bi-envelope d-flex align-items-center"><a
					href="mailto:contact@example.com">contact@example.com</a></i> <i
					class="bi bi-phone d-flex align-items-center ms-4"><span>+1
						5589 55488 55</span></i>
			</div>
			<div class="social-links d-none d-md-flex align-items-center">
				<a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a> <a
					href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
					href="#" class="instagram"><i class="bi bi-instagram"></i></a> <a
					href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
			</div>
		</div>
	</div>
	<!-- end top bar -->

	<div class="branding d-flex align-items-cente">

		<div
			class="container position-relative d-flex align-items-center justify-content-between">
			<a href='<c:url value="/step06/index.jsp"/>' class="logo d-flex align-items-center"> <!-- uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="../resources/assets/img/logo.png" alt=""> -->
				<h1 class="sitename">impact</h1> <span>.</span>
			</a>

			<nav id="navmenu" class="navmenu">
				<ul>
					<li><a href='<c:url value="/step06/index.jsp#hero"/>'
						class="active">Home<br></a></li>
					<li><a href='<c:url value="/step06/index.jsp#about"/>'>About</a></li>
					<li><a href='<c:url value="/step06/index.jsp#services"/>'>Services</a></li>
					<li><a href='<c:url value="/step06/index.jsp#team"/>'>Team</a></li>
					<li><a href='<c:url value="/step06/blog.jsp"/>'>Blog</a></li>
					<!-- <li class="dropdown"><a href="#"><span>dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="#">dropdown 1</a></li>
                <li class="dropdown"><a href="#"><span>deep dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                  <ul>
                    <li><a href="#">deep dropdown 1</a></li>
                    <li><a href="#">deep dropdown 2</a></li>
                    <li><a href="#">deep dropdown 3</a></li>
                    <li><a href="#">deep dropdown 4</a></li>
                    <li><a href="#">deep dropdown 5</a></li>
                  </ul>
                </li> 
                <li><a href="#">dropdown 2</a></li>
                <li><a href="#">dropdown 3</a></li>
                <li><a href="#">dropdown 4</a></li>
              </ul>
            </li>
            -->
					<li><a href='<c:url value="/step06/index.jsp#contact"/>'>Contact</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle"
						href="#"
						id="navbardropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">product</a>
						<ul class="dropdown-menu" aria-labelledby="navbardropdown">
							<li><a class="dropdown-item"
								href='<c:url value="/step06/index.jsp#products"/>'>products</a></li>
							<li><a class="dropdown-item"
								href='<c:url value="/step06/addProduct.jsp"/>'>Add product</a></li>
							<li><a class="dropdown-item"
								href="index.jsp?edit=update#products">Edit product</a></li>
							<li><a class="dropdown-item"
								href="index.jsp?edit=delete#products">Delete product</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Log
							in</a>
						<ul class="dropdown-menu" aria-labelledby="navbardropdown">
							<li><a class="dropdown-item"
								href='<c:url value="/member/loginMember.jsp"/>'>Sign in</a></li>
							<li><a class="dropdown-item"
								href='<c:url value="/member/addMember.jsp"/>'>Sign up</a></li>
							<li><a class="dropdown-item"
								href='<c:url value="/member/editMember.jsp"/>'>Edit Member</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Delivery
									information</a></li>
						</ul></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
			</nav>

		</div>

	</div>

</header>