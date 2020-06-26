<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%-- include common codes for html header --%>
        <%@ include file="../views/marketplace/common/common_source_home.jspf" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
      <%@ page session="true" %>
		<spring:url var="login_style_css" value="/resources/marketplace/css/login-style.css" />
		<link href="${login_style_css}" rel="stylesheet" type="text/css" />
		<spring:url var="error_pic_403" value="/resources/marketplace/images/Error_403.png"/>
   </head>
 <body>



<!-- particles.js container -->
<div>
	
	<div style="position:relative; width: 100%;">
	<div style="position: absolute; width: 100%;">
	
	<div class="container">
   
	   
	   <div class="row">
	   
	   <div class="col-lg-3 col-md-3 col-sm-2 col-xs-12">
	   </div>
	   
	   <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
	   
       <!-- Error -->
       <div class="error-pic">
       <img src="${error_pic_403}" width="430" height="430" alt=""/>
       </div>
       
       <div class="error-title">Session Timeout</div>
       <div class="error-des">Either your session has expired or you had been logged out from another session with the same ID.</div>
       <div class="error-btn">
       <button class="btn btn-orange input-xs" type="button" onclick="location.href='${home_url}';">Go To Login Page</button></div>
       <!-- End Error -->
	   
	   </div>
	   
	   <div class="col-lg-3 col-md-3 col-sm-2 col-xs-12">
	   </div>
	   </div>
	   
	   
	</div>
		
	</div>
	</div>
	
</div>

<!-- scripts -->
<%--  <spring:url var="particles_js" value="/resources/marketplace/js/bg-login/particles.js" /> --%>
<%-- <script src="${particles_js}" type="text/javascript"></script> --%>

<spring:url var="app_js" value="/resources/marketplace/js/bg-login/app.js" />
<script src="${app_js}" type="text/javascript"></script>

</body>
</html>


