<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>찾아ZOOM</title>
    <!-- Custom Stylesheet -->
    <link href="../resources/css/style.css" rel="stylesheet">
    <link href="../resources//css/adminQnAList.css" rel="stylesheet" type="text/css" />

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="../resources/images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="../resources/images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="../resources/images/logo-text.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="../"> <span>사용자 페이지</span>
						</a></li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <!-- <span class="activity active"></span> -->
                                <img src="../resources/images/admin.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="../signout"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li aria-expanded="false">
                        <a class="has-arrow" href="../admin/index" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                    <li class="mega-menu mega-menu-sm" aria-expanded="false">
                        <a class="has-arrow" href="../admin/memberList" aria-expanded="false">
                            <i class="icon-people"></i><span class="nav-text">회원관리</span>
                        </a>
                    </li>
                    <li aria-expanded="false">
                        <a class="has-arrow" href="../admin/qnaList" aria-expanded="false">
                            <i class="icon-speech"></i> <span class="nav-text">게시판관리</span>
                        </a>
                    </li>
                    <li>
                        <a class="has-arrow" href="../admin/restaurant/list" aria-expanded="false">
                            <i class="icon-arrow-up-circle"></i><span class="nav-text">맛집등록</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <!--본문 내용-->
                                <section class="content">
                                    <div class="row">
                                        <!-- left column -->
                                        <div class="col-md-12">

										<h3>기능 구현 준비중</h3>
                                        </div>
                                        <!-- /.row -->
                                    </div> 
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="main_footer">
            <div class="copyright">
                <p>&copy; Untitled. All rights reserved. Design: TEMPLATED. Demo Images: Unsplash.</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../resources/plugins2/common/common.min.js"></script>
    <script src="../resources/js/custom.min.js"></script>
    <script src="../resources/js/settings.js"></script>
    <script src="../resources/js/gleek.js"></script>
    <script src="../resources/js/styleSwitcher.js"></script>

</body>

</html>