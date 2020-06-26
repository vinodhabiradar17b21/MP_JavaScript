<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- include common codes for html header --%>
<%@ include file="../../views/marketplace/common/common_source.jspf"%>

<spring:url var="c3_js" value="/resources/marketplace/plugins/chart3/c3.min.js" />
<script src="${c3_js}" type="text/javascript"></script>

<spring:url var="d3_v3_js" value="/resources/marketplace/plugins/chart3/d3.v3.min.js" />
<script src="${d3_v3_js}" type="text/javascript"></script>

<spring:url var="c3_css" value="/resources/marketplace/plugins/chart3/c3.css" />
<link href="${c3_css}" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	var defaultService = "${defaultService}";
</script>
</head>
<body>
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
	<!-- header content -->
	<%@ include file="../marketplace/common/common_header.jspf"%>
	<!-- /header content -->
	<input type="hidden" name="listType" id="listType" />

	<div class="col-content">
	<div class="container-fluid">
		<div class="row">
		
			  <!-- Dashboard Btn -->
			  <div class="col-xs-12">
				 <div class="col-dashboard">  
						 <div class="btn-group input-xs" role="group" aria-label="...">
							<c:forEach var="rec" items="${principal.accnModules}">
								<div class="btn_module" id="${rec.id.TMmstModule.mmstModuleCode}"><div class="fa fa-dashboard" ></div>${rec.id.TMmstModule.mmstModuleDesc}</div>
							</c:forEach>
						 </div>
				 </div>   
			  </div>
			  <!-- End Dashboard Btn -->
			
		
		
			<div class="col-xs-12">
				<!-- Column Content Fullwidth -->
				<div class="row">
					<div class="col-xs-12">
						<div class="x_panel">
							<div class="x_content">
								<!-- <div class="col-xs-2">
									<div>
										<div class="title-sub">
											<h2>Service </h2>
										</div>
										<div class="col-report">
											<ul class="fordtreeview list-group">
												<li class=""><span class="hasSub" style="display: none;"></span>
													<ul class="list-group expanded">
														<li class="list-group-item"><a
															href="javascript:setModule('F');"><i class="fa fa-table"></i>
																Freight</a></li>
														<li class="list-group-item"><a
															href="javascript:setModule('I');"><i class="fa fa-table"></i>
																Insurance</a></li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div> -->
								<div class="col-xs-12">
									<%-- <div class="row"><div class="title-sub">
										<h2 id="serviceheader"> Freight </h2>
										</div>
									</div> 
									--%>
									<div class="row">
										<%@ include file="dashboard_traffic.jspf"%>
									</div>
									
									<!-- graphs -->
									<div class="row">
										<div style="float: right;">
											<div class="row-vcc">
												<div class="col-xs-vcc-5">
												Year&nbsp;<select id="year" name="year" class="form-control input-xs" >
													<c:forEach var="y" items="${dashboardBean.yearList}">
														<option value="${y }">${y }</option>
													</c:forEach>
												</select>
												</div>
												<div class="col-xs-vcc-7">
												Month&nbsp;<select id="month" name="month" class="form-control input-xs" >
													<option value="1">January</option>
													<option value="2">February</option>
													<option value="3">March</option>
													<option value="4">April</option>
													<option value="5">May</option>
													<option value="6">June</option>
													<option value="7">July</option>
													<option value="8">August</option>
													<option value="9">September</option>
													<option value="10">October</option>
													<option value="11">November</option>
													<option value="12">December</option>
												</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
									<%@ include file="dashboard_graphs.jspf" %>
									</div>
								</div><!-- col-xs-10 -->
							</div><!-- x_content -->
						</div><!-- x_panel -->
					</div><!-- col-xs-12 -->
				</div><!-- row -->
			</div><!-- col-xs-12 -->
		</div><!-- row -->
		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->
	</div>
	</div>
</body>
</html>