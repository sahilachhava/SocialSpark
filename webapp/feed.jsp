<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="tag" %> 
<%@ page import="model.*"  %>
<%@ page import="java.util.*"  %>
<%
	boolean loggedIn = false;
	if(((User)session.getAttribute("user")) == null){
		response.sendRedirect("index.jsp");
	}else{
		loggedIn = true;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Home :: Social Spark</title>
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
        <div id="profile-main" class="container sidebar-boxed" data-open-sidebar data-page-title="Feeds">
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
                                    </a>
                                </div>
                                <div class="nav-drop-body is-friend-requests">
                                  
                                  <tag:if test="${friendRequests.size() < 1}">
	                                	<h2 style="text-align: center;color: #A2A5B9;">No new requests</h2>
                                   </tag:if>
                                   
									<tag:forEach var="request" items="${friendRequests}">
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
            
            <div id="activity-feed" class="view-wrap true-dom">
                <div class="columns">
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
					<% ArrayList<Integer> friendIDs = new ArrayList<Integer>(); %>
					<%
						if(loggedIn){
							//Current friendIDs
							for(User myFriend : (ArrayList<User>)session.getAttribute("allFriends")) {
								friendIDs.add(myFriend.getUserID());
							}
							session.setAttribute("myFriendIDs", friendIDs);
						}
					%>
						
                    <!-- Post Section starts -->
                    <div class="profile-timeline">
                    <tag:forEach var="post" items="${allPosts}">
                     <tag:if test="${post.getVisibility() == 0 || user.getUserID() == post.user.getUserID() || (post.getVisibility() == 1 && myFriendIDs.contains(post.user.getUserID()))}">
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
                                            <tag:if test="${post.getUserID() == user.getUserID()}">
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
                                        </tag:if>
                                            
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
                                                    <div class="comments-count"></div>
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
                                            <tag:if test="${post.getUserID() == user.getUserID()}">
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
                                        </tag:if>
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
                                                    <div class="comments-count"></div>
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
                    <!-- Post section ends -->
                    </div>

                    <!-- side bar start -->
                    <div class="column is-4">

                        <!-- messages section -->
                        <div class="card">
                            <div class="card-heading is-bordered">
                                <h4>Send Messages</h4>
                                <div class="dropdown is-spaced is-neutral is-right dropdown-trigger">
                                </div>
                            </div>

                            <div class="card-body no-padding">
                                <div class="story-block">
                                    <a id="add-story-button" href="#" class="add-story">
                                        <i data-feather="plus"></i>
                                    </a>
                                    <div class="story-meta">
                                        <span>Share new post</span>
                                        <span>Share an image, a video or some text</span>
                                    </div>
                                </div>
                                <% 
                                	if(loggedIn){
                                	int count = 0;
                                	for(User friend : (ArrayList<User>)session.getAttribute("allFriends")) {
                                %>
                                    <div class="story-block">
                                        <div class="img-wrapper">
                                            <img src="<%= friend.getPhoto() %>" alt="">
                                        </div>
                                        <div class="story-meta">
                                            <a href="./Messages?actionType=get&friendID=<%=friend.getUserID()%>"><span><%= friend.getfName() + " " + friend.getlName() %></span></a>
                                            <span><%=friend.getBio()%></span>
                                        </div>
                                    </div>
                                <% 		count++; 
	                                	if(count == 5){
	                                		break;
	                                	}
                                	} }
                                %>
                            </div>
                        </div>
                        <!-- messages section end -->

                        <!-- suggest friend section -->

                        <div class="card">
                            <div class="card-heading is-bordered">
                                <h4>Suggested Friends</h4> <!-- only 5 friends -->
                                <div class="dropdown is-spaced is-right dropdown-trigger"></div>
                            </div>
                            <div class="card-body no-padding">
							<% 
								if(loggedIn){
								int cntr = 0;
								
								for(User friend : (ArrayList<User>)session.getAttribute("allUsers")) { 
								if(friend.getUserID() != ((User)session.getAttribute("user")).getUserID()) {
										if(!friendIDs.contains(friend.getUserID())) {
							%>
								<div class="add-friend-block transition-block">
                                    <img src="<%= friend.getPhoto() %>" alt="">
                                    <div class="page-meta">
                                        <a href="./UserProfile?userID=<%=friend.getUserID()%>"><span><%= friend.getfName() + " " + friend.getlName() %></span></a>
                                        <span><%= friend.getCity() + " " + friend.getCountry() %></span>
                                    </div>
                                </div>
							<%
								cntr++; 
								} 
								}
								if(cntr == 5){
									break;
								}
								} }
							%>
                            </div>
                        </div>

                        <!-- suggest friend section ends -->
                    
                    </div>
                    <!-- side bar end -->
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
    <!-- Feed pages js -->
    <script src="assets/js/feed.js"></script>
    <script src="assets/js/compose.js"></script>
    <script src="assets/js/autocompletes.js"></script>
    <!-- profile js -->
    <script src="assets/js/profile.js"></script>

    <script>
         $(document).ready(function() {
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

    </script>
</body>
</html>