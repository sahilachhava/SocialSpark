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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Messages :: Social Spark </title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <link href="../fonts.googleapis.com/css0981.css?family=Roboto:400,500" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/core.css">
</head>
<body>
    <!-- Pageloader -->
    <div class="pageloader"></div>
    <div class="infraloader is-active"></div>

    <div class="chat-wrapper is-standalone">
        <div class="chat-inner">

            <div class="chat-nav">
                <div class="nav-start">
                    <div class="recipient-block">
                        <div class="avatar-container">
                            <img class="user-avatar" src="${mUser.getPhoto()}" alt="">
                        </div>
                        <div class="username">
                            <span>${mUser.getfName()} ${mUser.getlName()}</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chat sidebar -->
            <div id="chat-sidebar" class="users-sidebar">
                <a href="feed.jsp" class="header-item">
                    <img src="assets/img/logo/friendkit-bold.svg" alt="">
                </a>
                <div class="footer-item">
                    <a href="./Messages?actionType=get&friendID=${mUser.getUserID()}">
                        <div class="add-button">
                            <i data-feather="refresh-cw"></i>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Chat body -->
            <div id="chat-body" class="chat-body is-opened">
                
                <div class="chat-body-inner has-slimscroll">
                
                	<tag:if test="${messages.size() < 1}">
                		<div class="page-placeholder">
	                    <div class="placeholder-content">
	                        <img class="light-image" src="assets/img/1.svg" alt="" />
	                        <img class="dark-image" src="assets/img/1.svg" alt="" />
		                        <h3>You don't have any messages yet.</h3>
		                        <p class="is-large">Start conversation with ${mUser.getfName()} now.</p>
	                    </div>
	                	</div>
                	</tag:if>
                    
                   <tag:forEach var="message" items="${messages}">
                    
                    <tag:if test="${message.getSenderID() == mUser.getUserID()}">
	                    <div class="chat-message is-received">
	                        <img src="${mUser.getPhoto()}" alt="">
	                        <div class="message-block">
	                            <span>${message.getTime()}</span>
	                            <div class="message-text">${message.getMsgText()}</div>
	                        </div>
	                    </div>
                    </tag:if>
                    
					<tag:if test="${message.getSenderID() != mUser.getUserID()}">
	                    <div class="chat-message is-sent">
	                        <img src="${user.getPhoto()}" alt="">
	                        <div class="message-block">
	                            <span>${message.getTime()}</span>
	                            <div class="message-text">${message.getMsgText()}</div>
	                        </div>
	                    </div>
                    </tag:if>
                    
                   </tag:forEach>

                </div>

                <!-- Compose message area -->
                <div class="chat-action">
                    <div class="chat-action-inner">
                        <div class="control">
                            <form action="./Messages" method="post" id="msgForm">
                                <textarea style="resize: none;" onkeypress="sendMessage();" class="textarea comment-textarea" id="messageText" name="messageText" rows="1" placeholder="type a message..."></textarea>
                                <div class="dropdown compose-dropdown is-spaced is-accent is-up dropdown-trigger">
                                    <div>
                                        <div class="add-button">
                                            <div class="button-inner">
                                                <i data-feather="type"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="text" name="actionType" value="send" hidden="" />
                                <input type="text" name="friendID" value="${mUser.getUserID()}" hidden="" />
                                <div style="margin-left: 95%;" class="dropdown compose-dropdown is-spaced is-accent is-up dropdown-trigger">
                                    <div>
                                        <div class="add-button submit-btn">
                                            <div class="button-inner">
                                                <i data-feather="send"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div id="chat-panel" class="chat-panel is-opened">
                <div class="panel-inner">
                    <div class="panel-header">
                        <h3>Details</h3>
                        <div class="panel-close">
                            <i data-feather="x"></i>
                        </div>
                    </div>

                    <div class="panel-body is-user-details">
                        <div class="panel-body-inner">

                            <div class="subheader">
                                <div class="dropdown details-dropdown is-spaced is-neutral is-right dropdown-trigger ml-auto">
                                    <div>
                                        <div class="action-icon">
                                            <i class="mdi mdi-dots-vertical"></i>
                                        </div>
                                    </div>
                                    <div class="dropdown-menu" role="menu">
                                        <div class="dropdown-content">
                                            <a href="./UserProfile?userID=${mUser.getUserID()}" class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="user"></i>
                                                    <div class="media-content">
                                                        <h3>View profile</h3>
                                                        <small>View this user's profile.</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <hr class="dropdown-divider">
                                            <a href="./Messages?actionType=delete&friendID=${mUser.getUserID()}" class="dropdown-item">
                                                <div class="media">
                                                    <i data-feather="trash-2"></i>
                                                    <div class="media-content">
                                                        <h3>Delete</h3>
                                                        <small>Delete this conversation.</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="details-avatar">
                                <img src="${mUser.getPhoto()}" alt="">
                                <div class="call-me">
                                    <i class="mdi mdi-facebook-messenger"></i>
                                </div>
                            </div>

                            <div class="user-meta has-text-centered">
                                <h3>${mUser.getfName()} ${mUser.getlName()}</h3>
                                <h4>${mUser.getBio()}</h4>
                            </div>
                            <div class="user-about">
                                <label>About Me</label>
                                <div class="about-block">
                                    <i class="mdi mdi-email"></i>
                                    <div class="about-text">
                                        <span>Email</span>
                                        <span><a class="is-inverted" href="#">${mUser.getEmail()}</a></span>
                                    </div>
                                </div>
                                <div class="about-block">
                                    <i class="mdi mdi-phone"></i>
                                    <div class="about-text">
                                        <span>Contact</span>
                                        <span><a class="is-inverted" href="#">${mUser.getPhone()}</a></span>
                                    </div>
                                </div>
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
    <script>
        function sendMessage() {
            var key = window.event.keyCode;
            // If the user has pressed enter
            if (key === 13) {
                $(".submit-btn").click();
                return false;
            }
        }
        
        $(".submit-btn").on('click', function(){
        	if($("#messageText").val() == ""){
        		alert("Please enter some text");
        		return;
        	}else{
        		$("#msgForm").submit();
        	}
        });
    </script>
</body>
</html>