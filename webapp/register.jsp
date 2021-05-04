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

    <title>Social Spark | Sign Up</title>
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <!-- Fonts -->
    <link href="assets/fonts.googleapis.com/csse409.css?family=Montserrat:600,700,800,900" rel="stylesheet">
    <link href="assets/fonts.googleapis.com/css0981.css?family=Roboto:400,500" rel="stylesheet">
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
    <div class="signup-wrapper">
        
        <div class="fake-nav">
            <a href="index.jsp" class="logo">
                <img src="assets/img/logo/friendkit.svg" width="112" height="28" alt="">
            </a>
        </div>
        
        <div class="process-bar-wrap">
            <div class="process-bar">
                <div class="progress-wrap">
                    <div class="track"></div>
                    <div class="bar"></div>
                    <div id="step-dot-1" class="dot is-first is-active is-current" data-step="0">
                        <i data-feather="user"></i>
                    </div>
                    <div id="step-dot-2" class="dot is-second" data-step="50">
                        <i data-feather="image"></i>
                    </div>
                    <div id="step-dot-3" class="dot is-third" data-step="75">
                        <i data-feather="lock"></i>
                    </div>
                    <div id="step-dot-4" class="dot is-fourth" data-step="100">
                        <i data-feather="flag"></i>
                    </div>
                </div>
            </div>
        </div>
        <form action="./Register" enctype="multipart/form-data" method="post" id="registerForm">
        <div class="outer-panel">
            <div class="outer-panel-inner">
                <div class="process-title">
                    <h2 id="step-title-1" class="step-title is-active">Welcome, Tell us about you.</h2>
                    <h2 id="step-title-2" class="step-title">Upload a profile picture.</h2>
                    <h2 id="step-title-3" class="step-title">Secure your account.</h2>
                    <h2 id="step-title-4" class="step-title">You're all set. Ready?</h2>
                </div>
                
                <div id="signup-panel-1" class="process-panel-wrap is-narrow is-active">
                    <div class="form-panel">
                        <div class="field">
                            <label>First Name</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Enter your first name" name="fName" id="fName">
                            </div>
                        </div>
                        <div class="field">
                            <label>Last Name</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Enter your last name" name="lName" id="lName">
                            </div>
                        </div>
                        <div class="field">
                            <label>Email</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Enter your email address" name="email" id="email">
                            </div>
                        </div>
                    </div>
                
                    <div class="buttons">
                        <!-- <a href="index.jsp" class="button is-rounded process-button">Login now</a> -->
                        <a onclick="validateForm(1)" class="button is-rounded process-button is-next">Next</a>
                    </div>

                    <a href="index.jsp" style="margin-left: 150px;">Already have a account? Login now</a>
                </div>
                
                <div id="signup-panel-2" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <div class="photo-upload">
                            <div class="preview">
                                <a id="uploadPic" class="upload-button">
                                    <i data-feather="plus"></i>
                                </a>
                                
                                <img id="upload-preview" src="assets/images/profilePic/default.jpg" alt="">
                                <!-- <form id="profile-pic-dz" class="dropzone is-hidden" action="https://localhost:8080/"></form> -->
                            </div>
                            <div class="limitation">
                                <small>Only images with a size lower than 3MB are accepted.</small>
                            </div>
                        </div>
                    </div>
                
                    <div class="buttons">
                        <a class="button is-rounded process-button" data-step="step-dot-1">Back</a>
                        <a class="button is-rounded process-button is-next" data-step="step-dot-3">Next</a>
                    </div>
                </div>
                
                <div id="signup-panel-3" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <div class="field">
                            <label>Password</label>
                            <div class="control">
                                <input type="password" class="input" placeholder="Choose a password" name="pass" id="pass">
                            </div>
                        </div>
                        <div class="field">
                            <label>Repeat Password</label>
                            <div class="control">
                                <input type="text" class="input" placeholder="Repeat your password" id="cpass">
                            </div>
                        </div>
                        <div class="field">
                            <label>Phone Number</label>
                            <div class="control">
                                <input type="number" minlength="10" maxlength="10" class="input" placeholder="Enter your phone number" name="phone" id="phone">
                            </div>
                        </div>
                    </div>
                
                    <div class="buttons">
                        <a class="button is-rounded process-button" data-step="step-dot-2">Back</a>
                        <a onclick="validateForm(3)" class="button is-rounded process-button is-next">Next</a>
                    </div>
                </div>

                <!-- Image Uploader :: java Iterator choose this as last value-->
                <input type="file" name="photoupload" id="picField" hidden=""/>

                <div id="signup-panel-4" class="process-panel-wrap is-narrow">
                    <div class="form-panel">
                        <img class="success-image" src="assets/img/illustrations/signup/type-3.svg" alt="">
                        <div class="success-text">
                            <h3>Congratz, you successfully created your account.</h3>
                            <p> Please login to your account.</p>
                            <a href="index.jsp" class="button is-fullwidth is-rounded">Let Me login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
        <!--Edit Credit card Modal-->
        <div id="crop-modal" class="modal mdl-modal is-small crop-modal is-animated">
            <div class="modal-background"></div>
            <div class="modal-content">
                <div class="modal-card">
                    <header class="modal-card-head">
                        <div class="modal-card-title">
                            <span>Crop your picture</span>
                        </div>
                        <button class="mdl-modal-close" aria-label="close">
                            <i data-feather="x"></i>
                        </button>
                    </header>
                    <div class="modal-card-body">
                        <div id="cropper-wrapper" class="cropper-wrapper">
        
                        </div>
                    </div>
                </div>
            </div>
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
    	var reg = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    	
        //Profile Photo Upload Code
        $('#uploadPic').click(function(){ $('#picField').trigger('click'); });
        document.getElementById('picField').onchange = function (evt) {
            var tgt = evt.target || window.event.srcElement, files = tgt.files;
            if (FileReader && files && files.length) {
                if((files[0].size / 1024 / 1024) < 3){
                    var fr = new FileReader();
                    fr.onload = function () {
                        document.getElementById("upload-preview").src = fr.result;
                    }
                    fr.readAsDataURL(files[0]);
                }else{
                    alert("Photo size should be less than 3 MB only.");
                }
            }
        }

    	function validateForm(step){
    		if(step == '1'){
    			var fName = document.getElementById("fName").value;
        		var lName = document.getElementById("lName").value;
        		var email = document.getElementById("email").value;
        		
        		if(fName == "" || lName == "" || email == ""){
        			alert("Please enter valid details");
        		}else if(!reg.test(email)){
        			alert("Please enter valid email address");
        		}else{
        			$('#step-dot-2').click();
        		}
    		}else if(step == '3'){
    			var pass = document.getElementById("pass").value;
        		var cpass = document.getElementById("cpass").value;
        		
        		if(pass == "" || cpass == ""){
        			alert("Please enter valid details");
        		}else if(pass != cpass){
        			alert("Password does not match, please try again");
        		}else{
                    $('#registerForm').submit();
        		}
    		}
    	}

        $( document ).ready(function() {
            var success = getUrlParameter('success');
            if(success != ""){
                if(success == "1"){
                    $('#step-dot-4').click();
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