<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<%-- include common codes for html header --%>
        <%@ include file="../views/marketplace/common/common_source_home.jspf" %>
</head>
          
 <body>

<!-- particles.js container -->
<div id="particles-js">
	
	<div style="position:relative; width: 100%;">
	<div style="position: absolute; width: 100%;">
	
	<div class="container">
   
	   <div class="row">
	     <!-- Logo -->
         <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
         <div class="logo_vcc_portal">
         <img src="${image_logo_vcc }" alt=""/>
         </div>
         </div>
         <!-- End Logo -->
         
         <!-- Title Portal & Tagline Portal -->
         <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
         
         <!-- Title Portal -->
         <div class="title-portal">
         Marketplace
         </div>
         <!-- End Title Portal -->
         
         <!-- Tagline Portal -->
         <div class="portal-tagline">
         Tagline Here
         
         </div>
         <!-- End Tagline Portal -->
         
         </div>
         <!-- End Title Portal & Tagline Portal -->
         
	   <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
        
         <!-- Powered by : hidden-xs -->
         <div class="col-powered-by-top hidden-xs">Powered by</div>
		 <div class="logo-powered-by-top hidden-xs"><img src="${image_logo_camelONE}" width="432" height="169" alt=""/></div>
         <!-- End Powered by : hidden-xs -->
      
         <!-- Admin -->
			<div class="dropdown navbar-right btn-portal-top">
			  <button class="btn btn-white-top-portal dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
				<div class="fa fa-user"></div> ${principal.uid} <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" style="margin-right: 12px;">
				<li><a href="#"><span class="fa fa-key"></span> Change Password</a></li>
				<li><a href="${logout_url }"><span class="fa fa-sign-out"></span> Log Out</a></li>
				<!-- <li role="separator" class="divider"></li> -->
			  </ul>
		    </div>
         <!-- End admin -->
       
	   </div>
	   </div>
	   
	   <div class="row">
	   
	   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   
	   
	   
		<!-- Content : Portal -->
		<div class="grid">

		<c:if test="${principal.accnRole=='CUS' || principal.accnRole=='ADMIN'}">
         
         <!-- App 1 -->
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12"> 
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_air}"/>
						<figcaption>
							<a class="btn-link-portal" data-toggle="modal" data-target="#myModal_01"></a>
							<h2>Air</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_01">Launch Air</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_01">Launch Air</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 1 -->
         
         <!-- App 2 -->
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_ocean}"/>
						<figcaption>
							<a class="btn-link-portal" data-toggle="modal" data-target="#myModal_02"></a>
							<h2>Ocean</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_02">Launch Ocean</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_02">Launch Ocean</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 2 -->
         
         <!-- App 3 -->
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_truck}"/>
						<figcaption>
							<a class="btn-link-portal" data-toggle="modal" data-target="#myModal_03"></a>
							<h2>Road</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_03">Launch Truck</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" data-toggle="modal" data-target="#myModal_03">Launch Track</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 3 -->
         
         <!-- App 4 -->
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12"> 
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_insurance}"/>
						<figcaption>
						<a class="btn-link-portal" data-toggle="modal" href="/COMarketPlace/insurance/insuranceDataEntry"></a>
							<h2>Insurance</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" href="/COMarketPlace/insurance/insuranceDataEntry">Launch Insurance</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" href="02_Insurance.html">Launch Insurance</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 4 -->
		 </c:if>
         <c:if test="${principal.accnRole=='FWD' || principal.accnRole=='CUS' || principal.accnRole=='ADMIN'}">
         <!-- App 5 -->
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12"> 
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_shipmentList}"/>
						<figcaption>
						<a class="btn-link-portal" data-toggle="modal" href="/COMarketPlace/shipment/shipmentList"></a>
							<h2>Shipment List</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" href="/COMarketPlace/shipment/shipmentList">Launch Shipment List</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" href="02_Insurance.html">Launch Shipment List</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 5 -->
         </c:if>
         <!-- App 6 -->
         <c:if test="${principal.accnRole=='INS' || principal.accnRole=='CUS' || principal.accnRole=='ADMIN'}">
         <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12"> 
         <div class="col-portal-app">
         
         		<figure class="effect-sarah">
						<img src="${image_insuranceList}"/>
						<figcaption>
						<a class="btn-link-portal" data-toggle="modal" href="/COMarketPlace/shipment/shipmentList"></a>
							<h2>Insurance List</h2>
							
							<!-- hidden-sm (Hidden on Tablet Portrait) -->
							<p class="des-blog hidden-sm">Short description here.<br/><a class="btn-link-portal" href="/COMarketPlace/shipment/shipmentList">Launch Insurance List</a>
							</p>
							<!-- End hidden-sm (Hidden on Tablet Portrait) -->
							
							<!-- visible-sm (Visible on Tablet Portrait) -->
							<p class="des-blog visible-sm"><a class="btn-link-portal" href="02_Insurance.html">Launch Insurance List</a>
							</p>
							<!-- End visible-sm (Visible on Tablet Portrait) -->
							
						</figcaption>			
			    </figure>
        
         </div>
         </div>
         <!-- End App 6 -->
		</c:if>

		</div>
		
		
		<!-- Pop Up : Small 01 -->
		 <div class="modal fade bs-example-modal-sm" id="myModal_01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-sm" role="document">
			   <div class="modal-content">
				  <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <h4 class="modal-title" id="myModalLabel">Select type of shipping</h4>
				  </div>

				  <div class="modal-body">
				  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px; margin-top: -5px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/air/shipmentDataEntry/box'">Pallet / Box / Crates</button>
                  </div>

				  </div>

				  <div class="modal-footer">

				  </div>

			   </div>
			</div>
		 </div>

		 <!-- End Pop Up : Small 01 -->
		 
		 <!-- Pop Up : Small 02 -->
		 <div class="modal fade bs-example-modal-sm" id="myModal_02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-sm" role="document">
			   <div class="modal-content">
				  <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <h4 class="modal-title" id="myModalLabel">Select type of shipping</h4>
				  </div>

				  <div class="modal-body">
				  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px; margin-top: -5px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/sea/shipmentDataEntry/box'">Pallet / Box / Crates</button>
                  </div>
                  
                  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/sea/shipmentDataEntry/container'">Containers</button>
                  </div>
                  
				  </div>

				  <div class="modal-footer">

				  </div>

			   </div>
			</div>
		 </div>

		 <!-- End Pop Up : Small 02 -->
		 
		 <!-- Pop Up : Small 03 -->
		 <div class="modal fade bs-example-modal-sm" id="myModal_03" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-sm" role="document">
			   <div class="modal-content">
				  <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <h4 class="modal-title" id="myModalLabel">Select type of shipping</h4>
				  </div>

				  <div class="modal-body">
				  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px; margin-top: -5px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/road/shipmentDataEntry/box'">Pallet / Box / Crates</button>
                  </div>
                  
                  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/road/shipmentDataEntry/container'">Containers</button>
                  </div>
                  
                  <div class="btn-group space_text_input" role="group" style="width:100%; margin-bottom:0px;">
                  <button type="button" class="btn btn-vcc half_btn" onclick="window.location.href='/COMarketPlace/road/shipmentDataEntry/truck'">Trucks</button>
                  </div>
                  
				  </div>

				  <div class="modal-footer">

				  </div>

			   </div>
			</div>
		 </div>

		 <!-- End Pop Up : Small 03 -->
		
		<!-- End Content : Portal -->

	   
	   
	   </div>
	   

	   
	   </div>
	   
                  <!-- Footer -->
<div class="copyright-portal">
   <div class="container-fluid">
      <div class="row">
         <div class="col-xs-12">
           <div class="copyright">
Copyright © <SCRIPT LANGUAGE="JavaScript"> today=new Date(); y0=today.getFullYear();</SCRIPT>
			  by vCargo Cloud Pte Ltd. A Member of DeClout Group. All Rights Reserved.
           </div>
         </div>
      </div>
   </div>
</div>
<!-- End Footer -->
        
	   
	   
	</div>
	
		
	</div>
	</div>
	
</div>

<spring:url var="particles_js" value="/resources/marketplace/js/bg-login/particles.js" />
<script src="${particles_js}" type="text/javascript"></script>

<spring:url var="app_js" value="/resources/marketplace/js/bg-login/app.js" />
<script src="${app_js}" type="text/javascript"></script>

</body>
</html>