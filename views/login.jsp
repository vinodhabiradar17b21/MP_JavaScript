<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>eCargo Marketplace</title>
<%-- include common codes for html header  --%>
    <%@ include file="../views/marketplace/common/common_source_login.jspf" %>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <%@ page session="true" %>
	<style>
	.rect1{ width: 100%; height: 160px;  padding: 15px 15px 15px 15px; border: 2px solid white; border-radius: 5px;}
	.rect1-title { float: left; padding: 0 5px; margin: -45px 0 0 0px; font-size: 20px; }
	</style>
	
	<%--internationalization --%>
	<spring:eval var="locale" expression="@localeResolver.resolveLocale(pageContext.request).getLanguage()" />
	<spring:url var="cookie_js" value="/resources/marketplace/js/js-cookie.min.js" />
	<script type="text/javascript" src="${cookie_js}"></script>
	<script>
	<!--
	var locale = Cookies.get('lang');
	if(locale) {
		bootbox.setLocale(locale);
	}
	//-->
	</script>
	<script>
 	function setLocale(lang)
 	{
 		Cookies.set("lang", lang);
 		document.location.reload();
 	}
	</script>
	<%--End internationalization --%>
	
 </head>
<body class="vertical-layout vertical-menu-modern 1-column  bg-full-screen-image menu-expanded blank-page blank-page"
data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
	<script>
		var promptMsg = '${promptMsg}';
		if (promptMsg != null && promptMsg != "") {
			bootbox.dialog({
				message : promptMsg,
				buttons : {
					confirm : {
						label : 'Yes',
						className : 'btn-success'
					}
				}
			});
			setTimeout(function() {
					bootbox.hideAll();
			}, 2500);
		}
	</script>
  	<!-- ////////////////////////////////////////////////////////////////////////////-->
  	<div class="app-content content">
    	<div class="content-wrapper">
      		<div class="content-header row">
      		</div>
      		<div class="content-body">
				<section class="flexbox-container_logo">
		          	<div class="col-12 d-flex">
					<div class="col-1 p-0">
					</div>
					<div class="col-10 p-0">
					<div class="logo_login">
					<img src="resources/marketplace/app-assets/images/logo/Logo_camelONE_marketplace.png" width="720" height="150" alt=""/>
					</div>
					</div>
					<div class="col-1 p-0">
					</div>
					</div>
				</section>
        		<section class="flexbox-container">
          			<div class="col-12 d-flex mt-5 mb-3">
					<div class="col-1 p-0">
					</div>
					<div id="announceList" class="col-6 p-0">
					<div id="welcome">
					<div class="title_login">Welcome to eCargo Marketplace</div>
					<div class="description_login">
VCC eCargo Marketplace is a one-stop solution for small enterprises to get quick, cost effective and seamless freight and cargo insurance quotes from reputable freight forwarders. The platform provides an end to end service to complete your entire cross border logistics requirements, ranging from quotations, cargo bookings, online payment and more. All transactions are stored in the platform and is available at your finger tips at any given time. <br/><br/>

What are you waiting for ? Sign up now and start saving valuable time and money on your cross border logistics needs. For further enquiries, pls reach us at <a href="mailto:enquiry@vcargocloud.com" style="color: #10e1e4;">enquiry@vcargocloud.com</a> .
			     	</div>
			     	</div>
					</div>
			  
            		<div class="col-4 box-shadow-2 p-0">
              		<div class="card_login border-grey border-lighten-3 px-1 py-1 m-0">
              		<div class="card-content">
              		
					<p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
					<span><spring:message code="marketplace.label.login.SelCtryLang" /></span>
					</p>

					<div class="card-body">
					  <div class="input-group">
						<div class="form-group position-relative has-icon-left w-50">
						<select class="form-control" id="selectCountry" aria-describedby="basic-addon2" onChange="javascript:setCountry(this.value)" style="padding-left: 15px;">
							<option value="">Select Country</option>
							<option value="CN">中国</option>
							<option value="ID">Indonesia</option>
							<option value="SG" selected>Singapore</option>
						</select>
						<!-- 
						<div class="form-control-position">
						  <i class="fa fa-globe"></i>
						</div>
						-->
						</div>
						<div class="input-group-append w-50">
						<div class="form-group position-relative has-icon-left w-100">
						<select class="form-control" id="selectLanguage" id="basic-addon2" onChange="javascript:setLocale(this.value)" style="padding-left: 15px;">
							<option value="en">Select Language</option>
							<option value="en" <c:choose><c:when test="${fn:startsWith(locale, 'en')}">Selected</c:when></c:choose>>English</option>
							<option value="in" <c:choose><c:when test="${fn:startsWith(locale, 'in')}">Selected</c:when></c:choose>>Bahasa Indonesia</option>
							<option value="zh" <c:choose><c:when test="${fn:startsWith(locale, 'zh')}">Selected</c:when></c:choose>><spring:message code="marketplace.label.top.chinese"/></option>
						</select>
						<!-- 
						<div class="form-control-position">
						  <i class="fa fa-language"></i>
						</div>
						 -->
						</div>
					  </div>
					</div>	              		
              		
                  	<p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
                    	<!--<span>Account Details</span>-->
                    	<span><spring:message code="marketplace.label.login.AccrDtls" /></span>
                  	</p>
                  	<div class="card-body">
					 
					<!-- Alerts-->
					<!--<div class="alert alert-primary mb-2" role="alert">
                      <strong>Good Morning!</strong> Start your day with some alerts.
                    </div>
                    <div class="alert alert-secondary mb-2" role="alert">
                      <strong>Hello!</strong> This is secondary alert - check it out.
                    </div>
                    <div class="alert alert-success mb-2" role="alert">
                      <strong>Well done!</strong> You successfully read this important alert message.
                    </div>
                    <div class="alert alert-danger mb-2" role="alert">
                      <strong>Oh snap!</strong> Change a few things up and submit again.
                    </div>
                    <div class="alert alert-warning mb-2" role="alert">
                      <strong>Warning!</strong> Your username and password is invalid.
                    </div>
                    <div class="alert alert-info mb-2" role="alert">
                      <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
                    </div>
                     <div class="alert alert-light mb-2" role="alert">
                      <strong>Hello!</strong> This is light alert - check it out.
                    </div>
                    <div class="alert alert-dark mb-2" role="alert">
                      <strong>Hello!</strong> This is dark alert - check it out.
                    </div> -->
					<!-- End Alerts-->
					<c:if test="${exist eq 'Y'}">
					<div class="alert alert-warning mb-2" role="alert" id="alert">
                      <strong></strong> The User ID has logged in from other computer, continue to login will cause the other session logged out and lost unsaved data.
                    </div>
                    </c:if>
                    <form class="form-horizontal" name="loginForm" action="authenticate" method="post">
                      	<fieldset class="form-group position-relative has-icon-left">
                        	<input type="text" class="form-control" name="usrUid" placeholder="User ID" maxlength="35" onblur="toUpper(this);" required="required">
                        	<div class="form-control-position"><i class="ft-user"></i></div>
                      	</fieldset>
                      	<fieldset class="form-group position-relative has-icon-left">
                        	<input type="password" class="form-control" name="usrPwd" placeholder="Password" required="required">
                        	<div class="form-control-position"><i class="fa fa-key"></i></div>
                      	</fieldset>
                      	<c:if test="${exist eq 'Y'}">
                      	<div class="form-group row">
                      		<div class="col-12 text-sm-left">
                        	<input type="checkbox" name="proceed">&nbsp;&nbsp;Yes, proceed to log out other session
                      		</div>
                      	</div>
                      	</c:if>
                      	<input type="hidden" name="loginParams" id="loginParams" value="${loginParams}">
                      	<div class="form-group row">
                        	<div class="col-6 text-center text-sm-left"></div>
                        	<div class="col-6 float-sm-left text-center text-sm-right">
                        	<a href="" data-toggle="modal" data-target="#myModal_forget_password"><spring:message code="marketplace.label.login.forgotPassword"/></a>
                        	<%-- <a href="01c_Forgot_Password.html" class="card-link">Forgot Password?</a>--%>
                        	</div>
                      	</div>
                      	<button type="submit" class="btn btn-primary btn-block"><i class="ft-unlock"></i> <spring:message code="marketplace.label.login.login"/></button>
                    </form>
                  	</div>
					
                  	<p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
                    	<!--<span>Do not have an account yet ?</span>-->
                    	<span><spring:message code="marketplace.label.login.dnhaay"/></span>
                  	</p>
                  	<div class="card-body">
						<button type="button" class="btn btn-secondary btn-block" data-toggle="modal" data-target="#modals_register" ><i class="ft-user"></i><!--Register--><spring:message code="marketplace.label.login.register"/></button>
                  	</div>
                	</div>
              		</div>
            		</div>
			  
					<div class="col-1 p-0">
					</div>
			
          			</div>
        		</section>
        		
        		<section class="container-fluid">
				   <div class="row">
					   
					<div class="col-1 mt-1 mb-1"></div>
					<div class="col-10 mt-1 mb-1">
					<div class="font-medium-4 white font-weight-bold"><!--Our Partners--><spring:message code="marketplace.label.login.ourPartners"/></div>
					</div>
					<div class="col-1 mt-1 mb-1"></div>
					   
			        </div>
					
					<div class="row">
		
				  <div class="col-1 mb-1"></div>
				  <div class="col-2 mb-1">
					  <div class="img_logo">
					  	<a href="https://www.rstradehouse.com/" target="_blank"> 
			            <img src="resources/marketplace/app-assets/images/partners/01_RS_Trade_House.jpg" width="440" height="200" alt=""/>
			            </a>
					  </div>
				  </div>
				  <div class="col-2 mb-1">
					<div class="img_logo">
						<a href="https://www.iata.org/pages/default.aspx" target="_blank"> 
					    <img src="resources/marketplace/app-assets/images/partners/02_IATA.jpg" width="440" height="200" alt=""/>
					    </a>
				    </div>
				  </div>
				  <div class="col-2 mb-1">
					 <div class="img_logo">
					 	<a href="https://fiata.com/home.html" target="_blank"> 
					    <img src="resources/marketplace/app-assets/images/partners/03_FIATA.jpg" width="440" height="200" alt=""/> 
					    </a>
					 </div>
				  </div>
				  <div class="col-2 mb-1">
					 <div class="img_logo">
					 	<a href="https://www.sbf.org.sg/" target="_blank"> 
					    <img src="resources/marketplace/app-assets/images/partners/04_SBF.jpg" width="440" height="200" alt=""/> 
					    </a>
					 </div>
				  </div>
				  <div class="col-2 mb-1">
				     <div class="img_logo">
		
					 </div>
				  </div>
					
				  <div class="col-1 mb-1"></div>
				   </div>
		        </section>
        
       			<input type="hidden" id="needAckTnc" name="needAckTnc" value="${needAckTnc }"/>
				<%@ include file="marketplace/common/common_user_TNC.jspf"%>
				<%@ include file="marketplace/common/common_forgot_password.jspf"%>
				<%@ include file="marketplace/common/common_register.jspf"%>
	  			<%-- <%@ include file="marketplace/common/common_privacy.jspf"%>
				<%@ include file="marketplace/common/common_contact_us.jspf"%> --%>
				<section class="footer">
          			<div class="col-12 d-flex">
			  			<div class="col-1 p-0">
			  			</div>
			  			<div class="col-10 p-0">
				  		<div class="col-footer">
      					<span class="float-md-left d-block d-md-inline-block">&copy; <SCRIPT LANGUAGE="JavaScript">
    					today=new Date();
    					y0=today.getFullYear();
						</SCRIPT>
						<SCRIPT LANGUAGE="JavaScript">
						</SCRIPT> 
						<a class="text-bold-800 grey darken-2" href="https://www.vcargocloud.com/" target="_blank">vCargo Cloud Pte Ltd</a>. <spring:message code="marketplace.label.footer.portfolioComp"/></span>
      <%--<span class="float-md-right d-block d-md-inline-block d-none d-lg-block">
      <a href="#Link" class="footer_link"><i class="fa fa-book"></i> Privacy Statement</a> <a href="#Link" class="footer_link"><i class="fa fa-phone"></i> Contact</a></span>--%>
				  		</div>
			  			</div>
			  			<div class="col-1 p-0">
			  			</div>
		  			</div>
				</section>
      		</div>
    	</div>
  	</div>
  	<!-- ////////////////////////////////////////////////////////////////////////////-->
</body>
 <%--
<spring:url var="dataTable_css" value="/resources/marketplace/css/jquery.dataTables.min.css" />
<link href="${dataTable_css}" rel="stylesheet" type="text/css" />

<spring:url var="dataTable_bs_css" value="/resources/marketplace/css/dataTables.bootstrap.min.css" />

<spring:url var="datatable_js" value="/resources/marketplace/js/jquery.dataTables.min.js" />
<script src="${datatable_js }"></script>
--%>
</html>