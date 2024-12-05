<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header" class="header fixed-top">
    <% 
    	String sessionId = (String) session.getAttribute("sessionId");
	%>
    <div class="topbar d-flex align-items-center">
        <div class="container d-flex justify-content-center justify-content-md-between">
            <div class="contact-info d-flex align-items-center">
                <i class="bi bi-envelope d-flex align-items-center">
                    <a href="mailto:contact@example.com">contact@example.com</a>
                </i>
                <i class="bi bi-phone d-flex align-items-center ms-4">
                    <span>+1 5589 55488 55</span>
                </i>
            </div>
            <div class="social-links d-none d-md-flex align-items-center">
                <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
            </div>
        </div>
    </div>
    <!-- 관리자용 네브 -->
    <c:choose>
        <c:when test='${sessionId eq "admin"}'>
            <nav class="navmenu bg-warning" id="admin-nav">
                <ul>
                    <li><a href='<c:url value="/step06/index.jsp#products"/>'>products</a></li>
                    <li><a href='<c:url value="/step06/addProduct.jsp"/>'>Add product</a></li>
                    <li><a href="index.jsp?edit=update#products">Edit product</a></li>
                    <li><a href="index.jsp?edit=delete#products">Delete product</a></li>
                </ul>
            </nav>
        </c:when>
        <c:otherwise></c:otherwise>
    </c:choose>
    <div class="branding d-flex align-items-center">
        <div class="container position-relative d-flex align-items-center justify-content-between">
            <a href='<c:url value="/step06/index.jsp"/>' class="logo d-flex align-items-center">
                <h1 class="sitename">impact</h1> <span>.</span>
            </a>

            <!-- 일반 사용자용 네브 -->
            <nav id="navmenu" class="navmenu">
                <ul>
                    <li><a href='<c:url value="/step06/index.jsp#hero"/>' class="active">Home<br></a></li>
                    <li><a href='<c:url value="/step06/index.jsp#about"/>'>About</a></li>
                    <li><a href='<c:url value="/step06/index.jsp#services"/>'>Services</a></li>
                    <li><a href='<c:url value="/step06/index.jsp#team"/>'>Team</a></li>
                    <li><a href='<c:url value="/step06/blog.jsp"/>'>Blog</a></li>
                    <li><a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>Forum</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">product</a>
                        <ul class="dropdown-menu" aria-labelledby="navbardropdown">
                            <li><a class="dropdown-item" href='<c:url value="/step06/index.jsp#products"/>'>products</a></li>
                            <li><a class="dropdown-item" href='<c:url value="/step06/addProduct.jsp"/>'>Add product</a></li>
                            <li><a class="dropdown-item" href="index.jsp?edit=update#products">Edit product</a></li>
                            <li><a class="dropdown-item" href="index.jsp?edit=delete#products">Delete product</a></li>
                        </ul>
                    </li>
                    <c:choose>
                        <c:when test="${sessionId != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbardropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <span style="color:orange">[${sessionId}]님 로그인 중</span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbardropdown">
                                    <li><a class="dropdown-item" href='<c:url value="/member/logoutMember.jsp"/>'>Logout</a></li>
                                    <li><a class="dropdown-item" href='<c:url value="/member/editMember.jsp"/>'>Edit Member</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbardropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Log in</a>
                                <ul class="dropdown-menu" aria-labelledby="navbardropdown">
                                    <li><a class="dropdown-item" href='<c:url value="/member/loginMember.jsp"/>'>Sign in</a></li>
                                    <li><a class="dropdown-item" href='<c:url value="/member/addMember.jsp"/>'>Sign up</a></li>
                                    <li><a class="dropdown-item" href='<c:url value="/member/editMember.jsp"/>'>Edit Member</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Delivery information</a></li>
                                </ul>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>
        </div>
    </div>
</header>

<style>
    #admin-nav {
        padding-left: 295px;
    }
</style>