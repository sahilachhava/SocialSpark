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

    <title>Profile :: Social Spark</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <!-- Fonts -->
    <link href="assets/fonts.googleapis.com/csse409.css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="assets/fonts.googleapis.com/css0981.css?family=Roboto:400,500" rel="stylesheet">
    <link href="assets/cdn.jsdelivr.net/npm/fontisto%40v3.0.4/css/fontisto/fontisto-brands.min.css" rel="stylesheet">
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
    <link rel="stylesheet" href="assets/css/font-awesome-4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/font-awesome-4.7.0/css/font-awesome.min.css">
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
                    <a href="feed.jsp" class="is-active">
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
        <div id="profile-main" class="container sidebar-boxed" data-open-sidebar data-page-title="Profile">

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
                                            <!-- <div class="media-right">
                                                <i data-feather="check"></i>
                                            </div> -->
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

            <!-- Profile page main wrapper -->
            <div class="view-wrap is-headless">
                <div class="columns is-multiline no-margin">
                    <!-- Left side column -->
                    <div class="column is-paddingless">
                        <!-- Timeline Header -->
                        <!-- html/partials/pages/profile/timeline/timeline-header.html -->
                        <!-- <div class="cover-bg"> -->
                            <!-- <img class="cover-image" src="assets/img/demo/unsplash/10.jpg" alt=""> -->
                            <div class="avatar">
                                <img style="border-radius: 50%;margin-left: 420px;height: 200px; width: 200px;" id="user-avatar" class="avatar-image" src="${showUser.getPhoto()}" alt="">
                            </div>
                        <!-- </div> -->
                        <!-- <div class="cover-overlay"></div>
                        <div class="cover-edit modal-trigger" data-modal="change-cover-modal">
                            <i class="mdi mdi-camera"></i>
                            <span>Edit cover image</span>
                        </div> -->

                        <div class="profile-menu is-hidden-mobile">
                        	<tag:if test="${friendStatus == -2}">	
	                        	<div class="menu-start">
	                        		 <a href="./ManageFriends?type=0" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-user-plus" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Add Friend
	                                </a>
	                                 <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-comments" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Message
	                                </a>
	                        	</div>
	                        	<div class="menu-end">
	                                <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-users" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Friends
	                                </a>
	                                <a href="profile-photos.html" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Photos
	                                </a>
	                            </div>
                        	</tag:if>
                        	<tag:if test="${friendStatus == 0}">	
	                        	<div class="menu-start">
	                        		 <a href="./ManageFriends?type=2" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-close" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Cancel Request
	                                </a>
	                                 <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-comments" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Message
	                                </a>
	                        	</div>
	                        	<div class="menu-end">
	                                <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-users" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Friends
	                                </a>
	                                <a href="profile-photos.html" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Photos
	                                </a>
	                            </div>
                        	</tag:if>
                        	<tag:if test="${friendStatus == 2}">	
	                        	<div class="menu-start">
	                        		 <a href="./ManageFriends?type=1" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-user-plus" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Accept Request
	                                </a>
	                                 <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-comments" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Message
	                                </a>
	                        	</div>
	                        	<div class="menu-end">
	                                <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-users" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Friends
	                                </a>
	                                <a href="profile-photos.html" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Photos
	                                </a>
	                            </div>
                        	</tag:if>
                        	<tag:if test="${friendStatus == 1}">	
	                        	<div class="menu-start">
	                        		 <a href="./ManageFriends?type=2" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-user-times" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Unfriend
	                                </a>
	                                 <a href="#" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-comments" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Message
	                                </a>
	                        	</div>
	                        	<div class="menu-end">
	                                <a href="./GetFriends?friend=true&userID=${showUser.getUserID()}" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-users" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Friends
	                                </a>
	                                <a href="photos.jsp?friends=0" style="font-size: 14px;" class="button has-min-width">
	                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Photos
	                                </a>
	                            </div>
                        	</tag:if>
                        	<tag:if test="${friendStatus == -1}">	
	                        	<div class="menu-start">
	                        		 <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-user" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Blocked
	                                </a>
	                                 <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-comments" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Message
	                                </a>
	                        	</div>
	                        	<div class="menu-end">
	                                <a href="#" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-users" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Friends
	                                </a>
	                                <a href="profile-photos.html" style="font-size: 14px;" class="button has-min-width" disabled="">
	                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Photos
	                                </a>
	                            </div>
                        	</tag:if>
                        </div>

                        <div class="profile-subheader">
                            <div class="subheader-start is-hidden-mobile">
                               	<span></span>
                               	<tag:if test="${friendStatus == 0}">
                                	<span>&nbsp;&nbsp;Request has been sent</span>
                                </tag:if>
                                <tag:if test="${friendStatus == 1}">
                                	<span>&nbsp;&nbsp;Friends</span>
                                </tag:if>
                                <tag:if test="${friendStatus == -1}">
                                	<span>&nbsp;&nbsp;User is Blocked</span>
                                </tag:if>
                            </div>
                            <div class="subheader-middle" style="margin-top: -75px;">
                                <h2>${showUser.getfName()} ${showUser.getlName()}</h2>
                                <span>${showUser.getBio()}</span>
                            </div>
                            <div class="subheader-end is-hidden-mobile">
                           	 	<tag:if test="${friendStatus == -2}">
                            		<a href="#"  class="button has-icon is-bold" disabled="">
	                                    <i class="fa fa-ban" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Block
	                                </a>
                                </tag:if>
                            	<tag:if test="${friendStatus != -1 and friendStatus != -2}">
                            		<a href="./ManageFriends?type=-1"  class="button has-icon is-bold">
	                                    <i class="fa fa-ban" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Block
	                                </a>
                                </tag:if>
                            	<tag:if test="${friendStatus == -1}">
	                                <a href="./ManageFriends?type=2"  class="button has-icon is-bold">
	                                    <i class="fa fa-unlock-alt" aria-hidden="true"></i>
	                                    &nbsp;&nbsp;
	                                    Unblock
	                                </a>
                                </tag:if>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="columns">
                    <div id="profile-timeline-widgets" class="column is-4">

                        <div class="box-heading">
                            <h4>About me</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button" style="cursor: default;">
                                        <!-- <i data-feather="more-vertical"></i> -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="basic-infos-wrapper">
                            <div class="card is-profile-info">
                                <div class="info-row">
                                    <div>
                                        <span>Bio</span>
                                        <a class="is-inverted">${showUser.getBio()}</a>
                                    </div>
                                    <i class="mdi mdi-bio"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Email Address</span>
                                        <a class="is-inverted">${showUser.getEmail()}</a>
                                    </div>
                                    <i class="mdi mdi-email"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Phone Number</span>
                                        <a class="is-inverted">${showUser.getPhone()}</a>
                                    </div>
                                    <i class="mdi mdi-phone"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>City</span>
                                        <a class="is-inverted">${showUser.getCity()}</a>
                                    </div>
                                    <i class="mdi mdi-map-marker"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Country</span>
                                        <a class="is-muted">${showUser.getCountry()}</a>
                                    </div>
                                    <i class="mdi mdi-earth"></i>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="column is-8">
                        <div id="profile-timeline-posts" class="box-heading" style="height: 56px;">
                            <h4>Posts</h4>
                            <div class="button-wrap">
                            </div>
                        </div>

                        <div class="profile-timeline">

                       <tag:forEach var="post" items="${allPosts}">
						<tag:if test="${showUser.getUserID() == post.user.getUserID() && (post.getVisibility() == 0 || (post.getVisibility() == 1 && allFriends.contains(post.user.getUserID())))}">
						<!-- Media Posts -->
						<tag:if test="${post.isMedia()}">
                            <div class="profile-post">
                                <div class="card is-post">
                                    <div class="content-wrap">
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="${post.user.getPhoto()}" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="./UserProfile?userID=${post.user.getUserID()}">${post.user.getfName()} ${post.user.getlName()}</a>
                                                    <span class="time">${post.getTime()}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="post-text">
                                                <p>${post.getPostText()}<p>
                                            </div>
                                            <div class="post-image">
                                            
                                            	<tag:if test="${!post.isVideo()}">
                                                	<img src="${post.getPostPhoto()}" alt="">
                                                </tag:if>
                                                
                                                <tag:if test="${post.isVideo()}">
                                                	<video controls="controls" src="${post.getPostPhoto()}"></video>
                                                </tag:if>
                                                
                                                <div class="like-wrapper">
                                                   <tag:if test="${!post.getUserLikes().contains(user.getUserID())}">
	                                                    <a href="javascript:void(0);" class="like-button like-btn">
	                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
	                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
	                                                        <span class="like-overlay"></span>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                    <tag:if test="${post.getUserLikes().contains(user.getUserID())}">
	                                                    <a href="javascript:void(0);" class="like-button like-btn is-active">
	                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
	                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
	                                                        <span class="like-overlay"></span>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                </div>
                                                
                                                <div class="fab-wrapper is-share">
                                                	<tag:if test="${!post.getUserSaves().contains(user.getUserID())}">
	                                                     <a href="javascript:void(0);" class="small-fab save-btn">
	                                                    	<i class="mdi mdi-bookmark-outline"></i>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                    <tag:if test="${post.getUserSaves().contains(user.getUserID())}">
	                                                     <a href="javascript:void(0);" class="small-fab save-btn">
	                                                    	<i class="mdi mdi-bookmark"></i>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="likers-text">
                                                <div class="social-count">
                                                    <div class="likes-count">
                                                        <i data-feather="heart"></i>
                                                        <span>${post.getUserLikes().size()}</span>
                                                    </div>
                                                    <div class="shares-count">
                                                        <i data-feather="save"></i>
                                                        <span>${post.getUserSaves().size()}</span>
                                                    </div>
                                                    <div class="comments-count">
                                                        <i data-feather="message-circle"></i>
                                                        <span>5</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </tag:if>
                            
                            <!-- Non Media Posts -->
                            <tag:if test="${!post.isMedia()}">
                            <div class="profile-post is-simple">
                                <div class="card is-post">
                                    <div class="content-wrap">
                                        <div class="card-heading">
                                            <div class="user-block">
                                                <div class="image">
                                                    <img src="${post.user.getPhoto()}" data-user-popover="0" alt="">
                                                </div>
                                                <div class="user-info">
                                                    <a href="./UserProfile?userID=${post.user.getUserID()}">${post.user.getfName()} ${post.user.getlName()}</a>
                                                    <span class="time">${post.getTime()}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="post-text">
                                                <p>${post.getPostText()}<p>
                                            </div>
                                            <div class="post-actions">
                                            
                                                <div class="like-wrapper">
                                                   <tag:if test="${!post.getUserLikes().contains(user.getUserID())}">
	                                                    <a href="javascript:void(0);" class="like-button like-btn">
	                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
	                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
	                                                        <span class="like-overlay"></span>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                    <tag:if test="${post.getUserLikes().contains(user.getUserID())}">
	                                                    <a href="javascript:void(0);" class="like-button like-btn is-active">
	                                                        <i class="mdi mdi-heart not-liked bouncy"></i>
	                                                        <i class="mdi mdi-heart is-liked bouncy"></i>
	                                                        <span class="like-overlay"></span>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                </div>
                                                
                                                <div class="fab-wrapper is-share">
                                                	<tag:if test="${!post.getUserSaves().contains(user.getUserID())}">
	                                                     <a href="javascript:void(0);" class="small-fab save-btn">
	                                                    	<i class="mdi mdi-bookmark-outline"></i>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                    <tag:if test="${post.getUserSaves().contains(user.getUserID())}">
	                                                     <a href="javascript:void(0);" class="small-fab save-btn">
	                                                    	<i class="mdi mdi-bookmark"></i>
	                                                        <p hidden="">${post.getPostID()}</p>
	                                                    </a>
                                                    </tag:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="likers-text">
                                                <div class="social-count">
                                                    <div class="likes-count">
                                                        <i data-feather="heart"></i>
                                                        <span>${post.getUserLikes().size()}</span>
                                                    </div>
                                                    <div class="shares-count">
                                                        <i data-feather="save"></i>
                                                        <span>${post.getUserSaves().size()}</span>
                                                    </div>
                                                    <div class="comments-count">
                                                        <i data-feather="message-circle"></i>
                                                        <span>2</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            	</div>
                            </tag:if>
                            </tag:if>
                         </tag:forEach>

                            <!-- post 1 complete -->
                          
                        </div>
                    </div>

                  

                </div>
            </div>

        </div>
    </div>
    
    <!-- Extra hidden tags  -->
	<h6 id="profileUserID" hidden="">${showUser.getUserID()}</h6>
	<h6 id="getFriendStatus" hidden="">${friendStatus}</h6>
	
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
    <!-- Feed pages js -->
    <script src="assets/js/feed.js"></script>
    <!-- profile js -->
    <script src="assets/js/profile.js"></script>
     <script>
	    $( document ).ready(function() {
	    	$('.like-btn').on('click', function () {
    			var postID = $(this).find('p').text();
	    		if($(this).hasClass('is-active')){
                    $(this).removeClass('is-active');
                    window.location.href = "./ManagePosts?actionType=likePost&actionStatus=0&postID="+postID;
                }else{
                    $(this).addClass('is-active');
                    window.location.href = "./ManagePosts?actionType=likePost&actionStatus=1&postID="+postID;
                }
	      	});
	    	
	    	$('.save-btn').on('click', function () {
    			var postID = $(this).find('p').text();
	    		if($(this).find('i').hasClass('mdi-bookmark-outline')){
                    $(this).find('i').removeClass('mdi-bookmark-outline');
                    $(this).find('i').addClass('mdi-bookmark');
                    window.location.href = "./ManagePosts?actionType=savePost&actionStatus=1&postID="+postID;
                }else{
                	$(this).find('i').removeClass('mdi-bookmark');
                    $(this).find('i').addClass('mdi-bookmark-outline');
                    window.location.href = "./ManagePosts?actionType=savePost&actionStatus=0&postID="+postID;
                }
	      	}); 
	    });
	 </script>
</body>
</html>