<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tag" %> 
<%@ page import="model.*"  %>
<%@ page import="java.util.*"  %>
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

    <title>My Profile :: Social Spark</title>
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
                    <input id="tipue_drop_input" class="input" placeholder="Search friends...">
                    <div class="form-icon">
                        <i data-feather="search"></i>
                    </div>
                    <!-- <div id="friendContent" class="tipue-drop-content"></div>  -->
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
        <div id="profile-main" class="container sidebar-boxed" data-open-sidebar data-page-title="My Profile">

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
                                <img style="border-radius: 50%;margin-left: 420px;height: 200px; width: 200px;" id="user-avatar" class="avatar-image" src="${user.getPhoto()}" alt="">
                            </div>
                        <!-- </div> -->
                        <!-- <div class="cover-overlay"></div>
                        <div class="cover-edit modal-trigger" data-modal="change-cover-modal">
                            <i class="mdi mdi-camera"></i>
                            <span>Edit cover image</span>
                        </div> -->

                        <div class="profile-menu is-hidden-mobile">
                            <div class="menu-start">
                                <!-- <a href="profile-main.html" style="font-size: 14px;" class="button has-min-width">
                                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Add Friend
                                </a>
                                <a href="profile-about.html" style="font-size: 14px;" class="button has-min-width">
                                    <i class="fa fa-comments" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Message
                                </a> -->
                            </div>
                            <div class="menu-end">
                                <a href="./GetFriends?friend=false&userID=${user.getUserID()}" style="font-size: 14px;" class="button has-min-width">
                                    <i class="fa fa-users" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Friends
                                </a>
                                <a href="photos.jsp" style="font-size: 14px;" class="button has-min-width">
                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Photos
                                </a>
                            </div>
                        </div>

                        <div class="profile-subheader">
                            <div class="subheader-start is-hidden-mobile">
                                <!-- <span>3.4K</span>
                                <span>Friends</span> -->
                            </div>
                            <div class="subheader-middle" style="margin-top: -75px;">
                                <h2>${user.getfName()} ${user.getlName()}</h2>
                                <span>${user.getBio()}</span>
                            </div>
                            <div class="subheader-end is-hidden-mobile">
                                <!-- <a class="button has-icon is-bold">
                                    <i class="fa fa-user-times" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Block
                                </a> -->
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
                                        <a class="is-inverted">${user.getBio()}</a>
                                    </div>
                                    <i class="mdi mdi-bio"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Email Address</span>
                                        <a class="is-inverted">${user.getEmail()}</a>
                                    </div>
                                    <i class="mdi mdi-email"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Phone Number</span>
                                        <a class="is-inverted">${user.getPhone()}</a>
                                    </div>
                                    <i class="mdi mdi-phone"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>City</span>
                                        <a class="is-inverted">${user.getCity()}</a>
                                    </div>
                                    <i class="mdi mdi-map-marker"></i>
                                </div>
                                <div class="info-row">
                                    <div>
                                        <span>Country</span>
                                        <a class="is-muted">${user.getCountry()}</a>
                                    </div>
                                    <i class="mdi mdi-earth"></i>
                                </div>
                            </div>
                        </div>
                       
                        <div class="box-heading">
                            <h4>Friends</h4>
                            <div class="dropdown is-neutral is-spaced is-right dropdown-trigger">
                                <div>
                                    <div class="button">
                                        <i data-feather="more-vertical"></i>
                                    </div>
                                </div>
                                <div class="dropdown-menu" role="menu">
                                    <div class="dropdown-content">
                                        <a href="./GetFriends?friend=false&userID=${user.getUserID()}" class="dropdown-item">
                                            <div class="media">
                                                <i data-feather="users"></i>
                                                <div class="media-content">
                                                    <h3>All Friends</h3>
                                                    <small>View all friends.</small>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="friend-cards-list">
                            <div class="card is-friend-card">
								
								<tag:forEach var="friend" items="${allFriends}">
	                                <div class="friend-item">
	                                    <img src="${friend.getPhoto()}" alt="">
	                                    <div class="text-content">
	                                        <a href="./UserProfile?userID=${friend.getUserID()}">${friend.getfName()} ${friend.getlName()}</a>
	                                    </div>
	                                </div>
                                </tag:forEach>

                            </div>
                        </div>
                    </div>

                    <div class="column is-8">

                        <!-- Create Post Box Starts -->
                            <div id="compose-card" class="card is-new-content">
                                <!-- Top tabs -->
                                <div class="tabs-wrapper">
                                <form action="./CreatePost" enctype="multipart/form-data" method="post">
                                    <div class="tabs is-boxed is-fullwidth">
                                        <ul>
                                            <li class="is-active">
                                                <a>
                                                    <span class="icon is-small"><i data-feather="edit-3"></i></span>
                                                    <span>Publish Post</span>
                                                </a>
                                            </li>
                                            <!-- Close X button -->
                                            <li class="close-wrap">
                                                <span class="close-publish">
                                                       <i data-feather="x"></i>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
        
                                    <!-- Tab content -->
                                    <div class="tab-content">
                                        <!-- Compose form -->
                                        <div class="compose">
                                            <div class="compose-form">
                                                <img src="${user.getPhoto()}" alt="">
                                                <div class="control">
                                                    <textarea id="publish" name="postText" class="textarea" rows="3" placeholder="Write something about you..."></textarea>
                                                </div>
                                            </div>
                                            <div id="feed-upload" class="feed-upload"></div>
                                            <div id="options-summary" class="options-summary"></div>
                                        </div>
                                        <!-- /Compose form -->
        
                                        <!-- General basic options -->
                                        <div id="basic-options" class="compose-options">
                                            <div class="compose-option">
                                                <i data-feather="camera"></i>
                                                <span>Add Media</span>
                                                <input id="feed-upload-input-2" name="postImage" type="file" accept=".png, .jpg, .jpeg, .mp4" onchange="readURL(this)">
                                            </div>
                                        </div>
                                        <!-- /General basic options -->
        
                                        <!-- Hidden Options -->
                                        <div class="hidden-options">
                                            <div class="target-channels">
                                                <!-- Publication Channel -->
                                                <div class="channel">
                                                    <div class="channel-icon">
                                                        <i data-feather="bell"></i>
                                                    </div>
                                                    <div class="channel-name">Activity Feed</div>
                                                    <!-- Dropdown menu -->
                                                    <div class="dropdown is-spaced is-modern is-right is-neutral dropdown-trigger">
                                                        <div>
                                                            <button id="visibility" class="button" aria-haspopup="true">
                                                                <i id="visibilityIcon" class="main-icon" data-feather="globe"></i>
                                                                <span>Public</span>
                                                                <i class="caret" data-feather="chevron-down"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text" id="visibilityValue" name="visibility" value="0" hidden="" />
                                                        <div class="dropdown-menu" role="menu">
                                                            <div class="dropdown-content"> 
                                                                <a onclick="changeVisibility('public')" id="visibilityPublic" class="dropdown-item is-hidden">
                                                                    <div class="media">
                                                                        <i data-feather="globe"></i>
                                                                        <div class="media-content">
                                                                            <h3>Public</h3>
                                                                            <small>Anyone can see this post.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                                <a onclick="changeVisibility('friends')" id="visibilityFriends" class="dropdown-item">
                                                                    <div class="media">
                                                                        <i data-feather="users"></i>
                                                                        <div class="media-content">
                                                                            <h3>Friends</h3>
                                                                            <small>Only friends can see this post.</small>
                                                                        </div>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="more-wrap">
                                            <button id="publish-button" type="submit" class="button is-solid accent-button is-fullwidth is-disabled">
                                                Publish
                                            </button>
                                        </div>
                                    </div>
                                </form>
                                </div>
                            </div>
                        <!-- Create Post Box Ends -->

                    <div id="allPostBlock" style="display: block;">
                        <div id="profile-timeline-posts" class="box-heading">
                            <h4>All Posts</h4>
                            <div class="button-wrap">
                                <button onclick="showPosts('saved')" type="button" class="button">
                                    <i class="fa fa-bookmark" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    Saved
                                </button>
                            </div>
                        </div>

                        <div class="profile-timeline">
						
						<tag:forEach var="post" items="${allPosts}">
						<tag:if test="${user.getUserID() == post.user.getUserID()}">
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
                                            
                                         	<div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
							                <div>
							                    <div class="button">
							                        <i data-feather="more-vertical"></i>
							                    </div>
							                </div>
							                <div class="dropdown-menu" role="menu">
							                    <div class="dropdown-content">
							                        <a href="myProfile.jsp?editPostID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather=edit-3></i>
							                                <div class="media-content">
							                                    <h3>Edit</h3>
							                                    <small>Edit this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        <a href="./ManagePosts?actionType=deletePost&actionStatus=0&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="trash-2"></i>
							                                <div class="media-content">
							                                    <h3>Delete</h3>
							                                    <small>Delete this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        <hr class="dropdown-divider" />
							                        <tag:if test="${post.getVisibility() != 0}">
							                        <a href="./ManagePosts?actionType=visibility&actionStatus=0&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="globe"></i>
							                                <div class="media-content">
							                                    <h3>Change to Public</h3>
							                                    <small>Anyone can see this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        </tag:if>
							                        <tag:if test="${post.getVisibility() == 0}">
							                        <a href="./ManagePosts?actionType=visibility&actionStatus=1&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="users"></i>
							                                <div class="media-content">
							                                    <h3>Change to Friends</h3>
							                                    <small>Only friends can see this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        </tag:if>
							                    </div>
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
                                            <div class="dropdown is-spaced is-right is-neutral dropdown-trigger">
							                <div>
							                    <div class="button">
							                        <i data-feather="more-vertical"></i>
							                    </div>
							                </div>
							                <div class="dropdown-menu" role="menu" style="margin-top: -50px;">
							                    <div class="dropdown-content">
							                        <a href="myProfile.jsp?editPostID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather=edit-3></i>
							                                <div class="media-content">
							                                    <h3>Edit</h3>
							                                    <small>Edit this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        <a href="./ManagePosts?actionType=deletePost&actionStatus=0&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="trash-2"></i>
							                                <div class="media-content">
							                                    <h3>Delete</h3>
							                                    <small>Delete this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        <hr class="dropdown-divider" />
							                        <tag:if test="${post.getVisibility() != 0}">
							                        <a href="./ManagePosts?actionType=visibility&actionStatus=0&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="globe"></i>
							                                <div class="media-content">
							                                    <h3>Change to Public</h3>
							                                    <small>Anyone can see this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        </tag:if>
							                        <tag:if test="${post.getVisibility() == 0}">
							                        <a href="./ManagePosts?actionType=visibility&actionStatus=1&postID=${post.getPostID()}" class="dropdown-item">
							                            <div class="media">
							                                <i data-feather="users"></i>
							                                <div class="media-content">
							                                    <h3>Change to Friends</h3>
							                                    <small>Only friends can see this post.</small>
							                                </div>
							                            </div>
							                        </a>
							                        </tag:if>
							                    </div>
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

                    <!-- saved post code -->

                    <div id="savedPostBlock" style="display: none;">
                        <div id="profile-timeline-posts" class="box-heading">
                            <h4>Saved Posts</h4>
                            <div class="button-wrap">
                                <button type="button" onclick="showPosts('all')" class="button">
                                    <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                                    &nbsp;&nbsp;
                                    All Posts
                                </button>
                            </div>
                        </div>

                        <div class="profile-timeline">
							
					<tag:forEach var="post" items="${allPosts}">
					<tag:if test="${post.getUserSaves().contains(user.getUserID())}">
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
                                                      <a href="javascript:void(0);" class="small-fab save-btn">
                                                    	<i class="mdi mdi-bookmark"></i>
                                                        <p hidden="">${post.getPostID()}</p>
                                                    </a>
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
                                                     <a href="javascript:void(0);" class="small-fab save-btn">
                                                    	<i class="mdi mdi-bookmark"></i>
                                                        <p hidden="">${post.getPostID()}</p>
                                                    </a>
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
                            
                    	</div>

                    <!-- saved post code ends -->

                </div>
            </div>

        </div>
    </div>
    
    <!-- Edit Post Modal -->
    <div id="editPostModal" class="modal albums-help-modal is-xsmall has-light-bg">
		<div class="modal-background"></div>
		<div class="modal-content" style="margin-top: 200px;">
		<div class="card">
		<div class="card-heading">
			<h3>Update Post</h3>
			<div class="close-wrap">
			    <span id="closeEditModal" class="close-modal">
			    	<i data-feather="x"></i>
			    </span>
			</div>
		</div>
		<div class="card-body">
		<div class="content-block is-active">
		<% String postText = ""; %>
		<% int editPostID = Integer.parseInt((request.getParameter("editPostID") == null) ? "0" : request.getParameter("editPostID")); %>
		<% 
			if(editPostID != 0) {
				for(Post post : ((ArrayList<Post>)session.getAttribute("allPosts"))) { 
			   		if(post.getPostID() == editPostID) {
			   			postText = post.getPostText();
					} 
			   } 
			}
		%>
		<form action="./ManagePosts" method="post" id="editPostForm">
		   <textarea style="margin-top: 15px;
		   					margin-left: 45px;
		   					resize: none;
		   					font-size: 18px;
		   					font-weight:bold;
		   					border-radius: 20px;
		   					border: 2px solid black;
		   					padding: 7px;" 
		   id="postText" wrap="physical" name="updatedText" rows="10" cols="35"><%= postText %></textarea>
		  <input type="text" name="actionType" value="updatePost" hidden=""/>
			<input type="text" name="postID" value="<%=editPostID%>" hidden=""/>
		</form>
		</div>
		<div class="slide-dots"></div>
		
		<div class="action">
		    <button type="button" class="button is-solid accent-button next-modal raised edit-btn">Update</button>
		</div>
		</div>
	</div>
	</div>
	</div>
    
    <!-- Edit Post Modal Completes -->

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
    <script src="assets/js/compose.js"></script>
    <script src="assets/js/autocompletes.js"></script>
    
				
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
	    	
	    	var editPostID = getUrlParameter('editPostID');
            if(editPostID != ""){
            	$("#editPostModal").show();
            }
            $("#closeEditModal").on('click', function () {
            	$("#editPostModal").hide();
            }); 
            $(".edit-btn").on('click', function () {
            	$("#editPostForm").submit();
            }); 
	    });
    	
        function changeVisibility(visibility){
            if(visibility == "public"){
                $("#visibilityValue").val("0");
                $("#visibilityPublic").addClass("is-hidden");
                $("#visibilityFriends").removeClass("is-hidden");
                $("#visibility span").html("Public");
                $("#visibilityIcon").attr("data-feather", "globe");
            }else{
                $("#visibilityValue").val("1");
                $("#visibilityFriends").addClass("is-hidden");
                $("#visibilityPublic").removeClass("is-hidden");
                $("#visibility span").html("Friends");
                $("#visibilityIcon").attr("data-feather", "users");
            }
            feather.replace();
        }

        function showPosts(postType){
            if(postType == "saved"){
                $('#allPostBlock').css('display', 'none');
                $('#savedPostBlock').css('display', 'block');
            }else{
                $('#savedPostBlock').css('display', 'none');
                $('#allPostBlock').css('display', 'block');
            }
        }
        
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