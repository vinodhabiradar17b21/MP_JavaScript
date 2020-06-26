<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../views/marketplace/common/common_source_home.jspf"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<spring:url var="login_style_css" value="/resources/marketplace/css/login-style.css" />
<link href="${login_style_css}" rel="stylesheet" type="text/css" />
<spring:url var="error_pic_500" value="/resources/marketplace/images/Error_500.png" />
</head>
<body>
	<!-- particles.js container -->
	<div>

		<div style="position: relative; width: 100%;">
			<div style="position: absolute; width: 100%;">

				<div class="container">


					<div class="row">

						<div class="col-lg-3 col-md-3 col-sm-2 col-xs-12"></div>

						<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">

							<!-- Error -->
							<div class="error-pic">
								<img src="${error_pic_500}" width="430" height="430" alt="" />
							</div>

							<div class="error-title">INTERNAL SERVER ERROR</div>
							<div class="error-des">
								<div style="text-align: center; margin-bottom: 15px;">An error was encountered in processing your request. Please contact the Help Desk with the following details:</div>
								<div class="row">
									<div class="col-xs-3"><label class="control-label">Token ID</label></div>
									<div class="col-xs-9"><label>${exception.tokenId}</label></div>
								</div>
								<div class="row">
									<div class="col-xs-3"><label class="control-label">Error Code</label></div>
									<div class="col-xs-9"><label>${exception.errorCode}</label></div>
								</div>
								<div class="row">
									<div class="col-xs-3"><label class="control-label">Error Message</label></div>
									<div class="col-xs-9"><label>${exception.message}</label></div>
								</div>
							</div>
							<div class="error-btn">
								<c:choose>
									<c:when test="${exception.errorCode =='LOG-01000'}">
										<button class="btn btn-orange input-xs" type="button" onclick="location.href='${home_url}';">Go To Login Page</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-orange input-xs" type="button" onclick="goBack()">Back</button>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- End Error -->

						</div>

						<div class="col-lg-3 col-md-3 col-sm-2 col-xs-12"></div>
					</div>


				</div>

			</div>
		</div>

	</div>

	<!-- scripts -->
	<script>
	/* go back previous page */
	function goBack(){	window.history.back();}
	/* initialization */
	$(document).ready(function() {	$("#pageloadImageDiv").hide();});
	</script>

</body>
</html>
