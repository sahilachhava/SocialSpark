<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tag" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Social Spark :: Login</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <!-- Fonts -->
    <link href="assets/fonts.googleapis.com/csse409.css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="assets/fonts.googleapis.com/css0981.css?family=Roboto:400,500" rel="stylesheet">
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
</head>
<body class="is-white">
    <!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>
    <div class="login-wrapper">
        
        <!-- Main Wrapper -->
        <div class="login-wrapper columns is-gapless">
            <!--Left Side (Desktop Only)-->
            <div class="column is-6 is-hidden-mobile hero-banner">
                <div class="hero is-fullheight is-login">
                    <div class="hero-body">
                        <div class="container">
                            <div class="left-caption">
                                <h2>Join an Exciting Social Experience.</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Right Side-->
            <div class="column is-6">
                <div class="hero form-hero is-fullheight">
                    <!--Logo-->
                    <div class="logo-wrap">
                        <div class="wrap-inner">
                            <img src="assets/img/emoji-1.svg" alt="">
                        </div>
                    </div>

                    <!-- Login Form -->
                    <div class="hero-body">
                        <div class="form-wrapper">
                            <!--Avatar-->
                            <div class="avatar">
                                <div class="badge">
                                    <i data-feather="check"></i>
                                </div>
                                <img src="assets/img/azzouz.jpg" alt="">
                            </div>
                            <!--Form-->
                            <form action="./Login" method="post">
                                <div class="login-form">
                                    <div class="field">
                                        <div class="control">
                                            <input class="input email-input" type="email" name="email" id="email" placeholder="example@example.com" required>
                                            <div class="input-icon">
                                                <i data-feather="user"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="control">
                                            <input class="input password-input" type="password" name="pass" id="pass" placeholder="●●●●●●●" required>
                                            <div class="input-icon">
                                                <i data-feather="lock"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="control">
                                            <button type="submit" class="button is-solid primary-button raised is-rounded is-fullwidth">Login</button>
                                        </div>
                                    </div>
                                </div>
                                </form>

                            <div class="section forgot-password">
                                <div class="has-text-centered">
                                    <a href="forgotPass.jsp">Forgot password?</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="register.jsp">Create New Account</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Login Form finished -->

        </div>
    </div>

    <!-- Concatenated js plugins and jQuery -->
    <script src="assets/js/app.js"></script>
    
    <!-- Core js -->
    <script src="assets/data/tipuedrop_content.js"></script>
    <script src="assets/js/global.js"></script>
    
    <script src="assets/js/navbar-v1.js"></script>
    <script src="assets/js/navbar-v2.js"></script>
    <script src="assets/js/navbar-mobile.js"></script>
    <script src="assets/js/navbar-options.js"></script>
    <script src="assets/js/sidebar-v1.js"></script>

    <!-- Core instance js -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/chat.js"></script>
    <script src="assets/js/touch.js"></script>
    <script src="assets/js/tour.js"></script>

    <!-- Components js -->
    <script src="assets/js/explorer.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="assets/js/modal-uploader.js"></script>
    <script src="assets/js/popovers-users.js"></script>
    <script src="assets/js/popovers-pages.js"></script>
    <script src="assets/js/lightbox.js"></script>
    
    <!-- Page and UI related js -->
    <script src="assets/js/signup.js"></script>
    
    <script>
	    $( document ).ready(function() {
	        var success = getUrlParameter('success');
	        if(success != ""){
	            if(success != "1"){
	               alert("Invalid login credentials, please try again");
	            }
	        }
	    });
	
	    var getUrlParameter = function getUrlParameter(sParam) {
	        var sPageURL = window.location.search.substring(1),
	            sURLVariables = sPageURL.split('&'),
	            sParameterName,
	            i;
	        for (i = 0; i < sURLVariables.length; i++) {
	            sParameterName = sURLVariables[i].split('=');
	
	            if (sParameterName[0] === sParam) {
	                return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
	            }
	        }
	        return false;
		};
    </script>
</body>
</html>