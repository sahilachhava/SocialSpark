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

    <title>Friends :: Social Spark</title>
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
        <div id="profile-main" class="container sidebar-boxed" data-open-sidebar data-page-title="Photos">

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
            
            <%
	            String checkUser = (request.getParameter("friends") == null) ? "1" : "0";
                String status = "false";
	           	if(checkUser.equals("0")){
	           		session.setAttribute("pUser", session.getAttribute("showUser"));
                    status = "true";
	           	}else{
	           		session.setAttribute("pUser", session.getAttribute("user"));
	           	}
            %>
            
            <% boolean flag = false; %>
            <tag:forEach var="post" items="${allPosts}">
            	<tag:if test="${post.getUserID() == pUser.getUserID() || post.getUserLikes().contains(pUser.getUserID()) || post.getUserSaves().contains(pUser.getUserID())}">
            		<% flag = true; %>
            	</tag:if>
            </tag:forEach>

            <% if(!flag) { %>
                <div class="page-placeholder">
                    <div class="placeholder-content">
                        <img class="light-image" src="assets/img/1.svg" alt="" />
                        <img class="dark-image" src="assets/img/1.svg" alt="" />
                       	<%  if(checkUser.equals("0")) { %>
	                        <h3>${pUser.getfName()} don't have any photos yet.</h3>
	                        <p class="is-large">Too bad. Looks like ${pUser.getfName()} didn't created any post yet.</p>
                        <% } else { %>
                        	<h3>You don't have any photos yet.</h3>
	                        <p class="is-large">Too bad. Looks like you didn't created any post yet. But don't fret that
	                            should start anytime soon.</p>
                        <% } %>
                    </div>
                </div>
           <% } %>

            <% if(flag) { %>
            <div class="view-wrap is-headless">
                <div class="columns is-multiline no-margin">
                    <div class="column is-paddingless">
                            <div class="avatar">
                                <img style="border-radius: 50%;margin-left: 420px;height: 200px; width: 200px;" id="user-avatar" class="avatar-image" src="${pUser.getPhoto()}" alt="">
                            </div>

                        <div class="profile-menu is-hidden-mobile">
                            <div class="menu-start">
                            </div>
                            <div class="menu-end">
                                <a href="./GetFriends?friend=<%=status%>&userID=${pUser.getUserID()}" style="font-size: 14px;" class="button has-min-width">
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
                            </div>
                            <div class="subheader-middle" style="margin-top: -75px;">
                                <h2>${pUser.getfName()} ${pUser.getlName()}</h2>
                                <span>${pUser.getBio()}</span>
                            </div>
                            <div class="subheader-end is-hidden-mobile">
                            </div>
                        </div>
                    </div>

                </div>

               
                    <div class="columns">
                        <div class="column">
                            <div class="box-heading">
                                <div class="dropdown friends-dropdown is-spaced is-neutral dropdown-trigger">
                                    <div>
                                        <div class="button">
                                            <span>All Pictures</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="image-grid-wrap">
                                <div class="image-grid">
                                <% int counter = 0; %>
                                <tag:forEach var="post" items="${allPosts}">
                                    <tag:if test="${post.isMedia() && !post.isVideo() && (post.getUserID() == pUser.getUserID() || post.getUserLikes().contains(pUser.getUserID()) || post.getUserSaves().contains(pUser.getUserID()))}">
	                        
	                                    <% if(counter == 0) { %>
	                                        <div class="image-row">
	                                    <% } %>
	                                    
                                       <div class="flex-1 has-background-image" data-background="${post.getPostPhoto()}" data-demo-background="${post.getPostPhoto()}">
                                           <div class="overlay"></div>
                                           <div class="image-owner">
                                               <img class="avatar" src="${post.user.getPhoto()}" alt="">
                                               <div class="name">${post.user.getfName()} ${post.user.getlName()}</div>
                                           </div>
                                           <div class="photo-time">${post.getTime()}</div>
                                       </div>
	                                    
                                    	<% counter += 1; %>
                                       
                                       <% if(counter == 3) { %>
	                                        </div>
	                                        <% counter = 0; %>
	                                    <% } %>
                                    </tag:if>
                                </tag:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>
        <% } %>
            

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
    <!-- profile js -->
    <script src="assets/js/profile.js"></script>
</body>
</html>