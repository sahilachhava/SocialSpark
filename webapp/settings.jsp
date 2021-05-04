<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tag" %> 
<%@ page import="model.*"  %>
<%
	if(((User)session.getAttribute("user")) == null){
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Settings :: Social Spark</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <!-- Fonts -->
    <link href="assets/fonts.googleapis.com/csse409.css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="assets/fonts.googleapis.com/css0981.css?family=Roboto:400,500" rel="stylesheet">
    <link href="assets/cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
    <style>
    	/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox */
		input[type=number] {
		  -moz-appearance: textfield;
		}
    </style>
</head>

<body>
    <!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>
    <div class="app-overlay is-sidebar-v1"></div>

    <div class="sidebar-v1 is-fold">
        <div class="top-section">
            <button id="sidebar-v1-close" class="close-button">
                <i data-feather="arrow-left"></i>
            </button>
            <div class="field is-grouped">
                <div class="control">
                    <input id="tipue_drop_input" class="input" placeholder="Search...">
                    <div class="form-icon">
                        <i data-feather="search"></i>
                    </div>
                    <div id="tipue_drop_content" class="tipue-drop-content"></div>
                </div>
            </div>

            <div class="user-block">
                <img class="avatar" src="${user.getPhoto()}" alt="">
                <div class="meta">
                    <span>${user.getfName()} ${user.getlName()}</span>
                    <span>${user.getBio()}</span>
                </div>
            </div>
        </div>
        <div class="bottom-section">
            <ul>
                <li>
                    <a href="feeds.jsp" class="is-active">
                        <i data-feather="home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="myProfile.jsp">
                        <i data-feather="user"></i>
                        <span>My Profile</span>
                    </a>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="settings.jsp">
                        <i data-feather="settings"></i>
                        <span>Settings</span>
                    </a>
                </li>
                <li>
                    <a href="./Logout">
                        <i data-feather="log-out"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="view-wrapper is-sidebar-v1 is-fold">
        <!-- Container -->
        <div id="profile-main" class="container sidebar-boxed" data-open-sidebar data-page-title="Settings">

            <div class="toolbar-v1 is-narrow">
                <!-- Sidebar Trigger -->
                <div class="friendkit-hamburger sidebar-v1-trigger">
                    <span class="menu-toggle has-chevron">
            	            <span class="icon-box-toggle">
                            <span class="rotate">
                                <i class="icon-line-top"></i>
                                <i class="icon-line-center"></i>
                                <i class="icon-line-bottom"></i>
                            </span>
                    </span>
                    </span>
                </div>
                <h1>Timeline</h1>
                <div class="controls">
                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link is-friends" href="javascript:void(0);">
                            <i data-feather="users"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop is-right">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Friend requests</span>
                                    <a href="#">
                                        <!-- <i data-feather="search"></i> -->
                                    </a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">

                                    <tag:if test="${friendRequests.size() < 1}">
	                                	<h2 style="text-align: center;color: #A2A5B9;">No new requests</h2>
                                   </tag:if>
                                   
									<tag:forEach var="request" items="${friendRequests}">
	                                    <!-- Friend request -->
	                                    <div class="media">
	                                        <figure class="media-left">
	                                            <p class="image">
	                                                <img src="${request.getPhoto()}" alt="">
	                                            </p>
	                                        </figure>
	                                        <div class="media-content">
	                                            <a href="./UserProfile?userID=${request.getUserID()}">${request.getfName()} ${request.getlName()}</a>
	                                            <span>Sent you a request</span>
	                                        </div>
	                                        <div class="media-right">
	                                            <a href="./ManageFriends?type=1&userID=${request.getUserID()}" class="button icon-button is-solid grey-button raised">
	                                                <i data-feather="user-plus"></i>
	                                            </a>
	                                            <a href="./ManageFriends?type=2&userID=${request.getUserID()}" class="button icon-button is-solid grey-button raised">
	                                                <i data-feather="user-minus"></i>
	                                            </a>
	                                        </div>
	                                    </div>
	                                   </tag:forEach>

                                </div>
                                <div class="nav-drop-footer">
                                    <!-- <a href="#">View All</a> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="navbar-item is-icon drop-trigger">
                        <a class="icon-link" href="javascript:void(0);">
                            <i data-feather="bell"></i>
                            <span class="indicator"></span>
                        </a>

                        <div class="nav-drop is-right">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span>Notifications</span>
                                    <a href="#">
                                        <!-- <i data-feather="bell"></i> -->
                                    </a>
                                </div>
                                <div class="nav-drop-body is-notifications">

                                    <tag:if test="${notifications.size() < 1}">
	                                	<h2 style="text-align: center;color: #A2A5B9;">No new notifications</h2>
                                  </tag:if>
                                  
                                  <tag:forEach var="notify" items="${notifications}">
                                  <tag:if test='${notify.getnType().equals("FR")}'>
	                                	<div class="media">
	                                        <figure class="media-left">
	                                            <p class="image">
	                                                <img src="${notify.getFriend().getPhoto()}" alt="">
	                                            </p>
	                                        </figure>
	                                        <div class="media-content">
	                                            <span><a href="./UserProfile?userID=${notify.getFriendID()}">${notify.getFriend().getfName()} ${notify.getFriend().getlName()}</a> has accepted your friend request.</span>
	                                            <span class="time">${notify.getTime()}</span>
	                                        </div>
	                                        <div class="media-right">
	                                            <div class="added-icon">
	                                                <i data-feather="user-check"></i>
	                                            </div>
	                                        </div>
	                                    </div>
                                    </tag:if>
                                    <tag:if test='${notify.getnType().equals("LP")}'>
                                    <div class="media">
                                        <figure class="media-left">
                                            <p class="image">
                                                <img src="${notify.getFriend().getPhoto()}" alt="">
                                            </p>
                                        </figure>
                                        <div class="media-content">
                                            <span><a href="./UserProfile?userID=${notify.getFriendID()}">${notify.getFriend().getfName()} ${notify.getFriend().getlName()}</a> liked your post.</span>
                                            <span class="time">${notify.getTime()}</span>
                                        </div>
                                        <div class="media-right">
                                            <div class="added-icon">
                                                <i data-feather="heart"></i>
                                            </div>
                                        </div>
                                    </div>
                                    </tag:if>
                                   </tag:forEach>
                                   
                                </div>
                                <div class="nav-drop-footer">
                                    <!-- <a href="#">View All</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div id="account-dropdown" class="navbar-item is-account drop-trigger has-caret">
                        <div class="user-image">
                            <img src="${user.getPhoto()}" alt="">
                            <span class="indicator"></span>
                        </div>

                        <div class="nav-drop is-account-dropdown">
                            <div class="inner">
                                <div class="nav-drop-header">
                                    <span class="username">${user.getfName()} ${user.getlName()}</span>
                                    <label class="theme-toggle">
                                        <input type="checkbox">
                                        <span class="toggler">
            	                                <span class="dark">
            	                                    <i data-feather="moon"></i>
            	                                </span>
                                        <span class="light">
            	                                    <i data-feather="sun"></i>
            	                                </span>
                                        </span>
                                    </label>
                                </div>
                                <div class="nav-drop-body account-items">
                                    <a id="profile-link" href="myProfile.jsp" class="account-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <div class="image">
                                                    <img src="${user.getPhoto()}" alt="">
                                                </div>
                                            </div>
                                            <div class="media-content">
                                                <h3>${user.getfName()} ${user.getlName()}</h3>
                                                <small>Main account</small>
                                            </div>
                                        </div>
                                    </a>
                                   
                                    <hr class="account-divider">

                                    <a href="settings.jsp" class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="settings"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Settings</h3>
                                                <small>Privacy & Preferences.</small>
                                            </div>
                                        </div>
                                    </a>

                                    <a href="./Logout" class="account-item">
                                        <div class="media">
                                            <div class="icon-wrap">
                                                <i data-feather="power"></i>
                                            </div>
                                            <div class="media-content">
                                                <h3>Log out</h3>
                                                <small>Log out from your account.</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Header Section Completes here -->
            
            <div class="settings-wrapper is-full">

                <div id="general-settings" class="settings-section is-active">
                    <div class="settings-panel">

                        <div class="title-wrap">
                            <a class="mobile-sidebar-trigger">
                                <i data-feather="menu"></i>
                            </a>
                            <h2 id="settingTitle">General Settings</h2>
                        </div>

                        <div class="settings-form-wrapper">

                    <!-- general setting form starts  -->
                    <div id="generalForm">
                        <form action="./UpdateProfile" enctype="multipart/form-data" method="post">
                            <div class="settings-form">
                                <div class="columns is-multiline">

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>First Name</label>
                                            <div class="control has-icon">
                                                <input type="text" class="input is-fade" value="${user.getfName()}" name="fName" required>
                                                <div class="form-icon">
                                                    <i data-feather="user"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Email</label>
                                            <div class="control has-icon">
                                                <input type="email" class="input is-fade" value="${user.getEmail()}" name="email" required>
                                                <div class="form-icon">
                                                    <i data-feather="mail"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Last Name</label>
                                            <div class="control has-icon">
                                                <input type="text" class="input is-fade" value="${user.getlName()}" name="lName" required>
                                                <div class="form-icon">
                                                    <i data-feather="user"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Phone Number</label>
                                            <div class="control has-icon">
                                                <input type="number" minlength="10" maxlength="10" class="input is-fade" value="${user.getPhone()}" name="phone">
                                                <div class="form-icon">
                                                    <i data-feather="phone"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Bio</label>
                                            <div class="control has-icon">
                                                <input type="text" class="input is-fade" value="${user.getBio()}" name="bio" required>
                                                <div class="form-icon">
                                                    <i data-feather="meh"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Profile Picture</label>
                                            <div class="control has-icon">
                                                <input type="file" id="picField" name="picField" hidden="">
                                                <a id="uploadPic" style="margin-left: 10px; margin-top: 3px;width: 150px;height: 27px;" 
                                                class="input is-fade">Select picture</a>
                                                <div class="form-icon">
                                                    <i data-feather="image"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-12">
                                        <!--Field-->
                                        <div class="form-text">
                                            <p>Be sure to fill out your location settings. This will help us suggest you relevant friends and places you could like.</p>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>City</label>
                                            <div class="control has-icon">
                                                <input type="text" class="input is-fade" value="${user.getCity()}" name="city">
                                                <div class="form-icon">
                                                    <i data-feather="map-pin"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group is-autocomplete">
                                            <label>Country</label>
                                            <div class="control has-icon">
                                                <input id="country-autocpl" type="text" class="input is-fade" value="${user.getCountry()}" name="country">
                                                <div class="form-icon">
                                                    <i data-feather="globe"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-12">
                                        <div class="buttons">
                                            <button type="submit" class="button is-solid accent-button form-button">Save Changes</button>
                                            <a class="button is-light form-button advance-settings">Advanced Settings</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                        </div>
                        <!-- general setting form ends -->

                        <!-- advance setting form starts -->
                        <div  id="advanceForm" style="display: none;">
                        <form action="./UpdatePassword" method="post" id="passForm">
                            <div class="settings-form">
                               	<h2 style="margin-left: 5px; margin-bottom: 10px;">Change Password</h2>
                                <div class="columns is-multiline">
                                    <div class="column is-6">
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>Old Password</label>
                                            <div class="control has-icon">
                                                <input type="password" class="input is-fade" id="oldPass" value="" name="oldPass" required>
                                                <div class="form-icon">
                                                    <i data-feather="lock"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Field-->
                                        <div class="field field-group">
                                            <label>New Password</label>
                                            <div class="control has-icon">
                                                <input type="password" class="input is-fade" id="newPass" value="" name="newPass" required>
                                                <div class="form-icon">
                                                    <i data-feather="key"></i>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="field field-group">
                                            <label>Confirm Password</label>
                                            <div class="control has-icon">
                                                <input type="text" class="input is-fade" id="cPass" value="" name="cPass" required>
                                                <div class="form-icon">
                                                    <i data-feather="key"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="column is-6">
                                        <a href="./DeleteAccount?actionType=clearAccount" style="height:50px; width:200px;margin: 0px 50px 20px 0px;background-color: orange;" class="button is-solid form-button">Clear Account Data</a>
                                    	<a href="./DeleteAccount?actionType=deleteAccount" style="height:50px; width:200px;margin: 0px 50px 0 0px;background-color: red;" class="button is-solid form-button">Delete Account</a>
                                    </div>

                                    <div class="column is-12">
                                        <div class="buttons">
                                            <a id="validateForm" class="button is-solid accent-button form-button">Update Password</a>
                                            <a class="button is-light form-button general-settings">General Settings</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                        <!-- advance setting form ends -->

                            <div class="illustration">
                                <img class="light-image" src="assets/img/illustrations/settings/1.svg" alt="">
                                <img class="dark-image" src="assets/img/illustrations/settings/1-dark.svg" alt="">
                                <p>If you'd like to know about general settings, then it's your profile details which you can update from here.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Concatenated js plugins and jQuery -->
    <script src="assets/js/app.js"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="assets/data/tipuedrop_content.js"></script>

    <!-- Core js -->
    <script src="assets/js/global.js"></script>

    <!-- Navigation options js -->
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
    <script src="assets/js/settings.js"></script>

    <script>
        //Profile Photo Upload Code
        $('#uploadPic').click(function(){ $('#picField').trigger('click'); });
        document.getElementById('picField').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement, files = tgt.files;
            if (FileReader && files && files.length) {
                if((files[0].size / 1024 / 1024) < 3){
                    document.getElementById("uploadPic").innerHTML = files[0].name;
                }else{
                    alert("Photo size should be less than 3 MB only.");
                    document.getElementById("uploadPic").innerHTML = "Select picture";
                    document.getElementById("picField").value = "";
                }
            }
        }
        
        $(".advance-settings").on('click', function(){
            $("#generalForm").css("display", "none");
            $("#advanceForm").css("display", "block");
            $("#settingTitle").text("Advance Settings");
        });

        $(".general-settings").on('click', function(){
            $("#advanceForm").css('display', 'none');
            $("#generalForm").css('display', 'block');
            $("#settingTitle").text("General Settings");
        });
        
        $("#validateForm").on('click', function(){
           var newPass = document.getElementById("newPass").value;
           var cPass = document.getElementById("cPass").value;
        	
        	if(newPass != cPass){
        		alert("Password not matched!");
        	}else{
        		$("#passForm").submit();
        	}
        });
        
        $( document ).ready(function() {
            var success = getUrlParameter('success');
            if(success != ""){
                if(success == "1"){
                    alert("Profile details updated successfully");
                }else if(success == "2"){
                	alert("Invalid old password, Please try again");
                }else if(success == "3"){
                	alert("Password updated successfully");
                }else{
                    alert("Something went wrong, Please try again");
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