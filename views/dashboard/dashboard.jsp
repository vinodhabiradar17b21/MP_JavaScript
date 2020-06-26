<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>
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
	<!-- seems like not used -->
	<input type="hidden" name="listType" id="listType" />
	<!-- seems like not used ^ -->
	
		<div class="col-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12">
								<div>
									<div class="x_content">
										  <!-- Dashboard Btn -->
										  <div class="row">
										  <div class="col-xs-12">
											 <div class="col-dashboard">  
													 <div class="btn-group input-xs" role="group" aria-label="...">
														<c:forEach var="rec" items="${principal.accnModules}">
															<div class="btn_module" id="${rec.id.TMmstModule.mmstModuleCode}"><div class="fa fa-dashboard" ></div>${rec.id.TMmstModule.mmstModuleDesc}</div>
														</c:forEach>
													 </div>
											 </div>   
										  </div> 
										  </div>
										  <!-- End Dashboard Btn -->
										<div class="row">
										<div id="dashboardtile" class="row-vcc"></div>
										<%--
										<div class="row-vcc">
											<div class="col-xs-4">
												 <div class="col-tile bg_tile_air">
													 <div class="tile_title_small">Quotations for the week</div>
													 <div class="tile_title_big">Air</div>
													 <div class="row-vcc">
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Total</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Responded</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Finalised</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Open</div>
													       <div class="tile_no">100000</div>
													     </div>
													 </div>
													 
												 </div>
											 </div>
											 
											<div class="col-xs-4">
												 	 <div class="col-tile bg_tile_road">
													 <div class="tile_title_small">Quotations for the week</div>
													 <div class="tile_title_big">Road</div>
													 <div class="row-vcc">
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Total</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Responded</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Finalised</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Open</div>
													       <div class="tile_no">100000</div>
													     </div>
													 </div>
													 
												 </div>
											 </div>
												 
											<div class="col-xs-4" >
												 	<div class="col-tile bg_tile_sea">
													 <div class="tile_title_small">Quotations for the week</div>
													 <div class="tile_title_big">Sea</div>
													 <div class="row-vcc">
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Total</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Responded</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Finalised</div>
													       <div class="tile_no">100000</div>
													     </div>
														 <div class="col-xs-vcc-3">
														   <div class="tile_title_no">Open</div>
													       <div class="tile_no">100000</div>
													     </div>
													 </div>
													 
												 </div>
											 </div>
										</div> --%>
									</div>
								</div>
							</div>
							<div class="row">
								<div>
									<div class="x_content">
										<div class="row-vcc">
											<div class="col-xs-12">
												<div class="dropdown-chart"
													style="margin-right: 15px; margin-bottom: 10px;">
													<input id="_monthlist" type="hidden"
														value="[January, February, March, April, May, June, July, August, September, October, November, December]" /> 
													<input id="_weeklist" type="hidden"
														value="[Week1, Week2, Week3, Week4, Week5, Week6, Week7, Week8, Week9, Week10, Week11, Week12, Week13, Week14, Week15, Week16, Week17, Week18, Week19, Week20, Week21, Week22, Week23, Week24, Week25, Week26, Week27, Week28, Week29, Week30, Week31, Week32, Week33, Week34, Week35, Week36, Week37, Week38, Week39, Week40, Week41, Week42, Week43, Week44, Week45, Week46, Week47, Week48, Week49, Week50, Week51, Week52]" /> 
													<select id="weekId" class="form-control input-xs">
														<c:forEach var="period" items="${periodList}" varStatus="loop">
															<option value="${period.perVal }" year="${period.year }"> ${period.perName }</option>
														</c:forEach>
													</select>
												</div>
												<div class="dropdown-chart"
													style="margin-right: 15px; margin-bottom: 10px;">
														<select id="yearId" class="form-control input-xs">
															<c:forEach var="year" items="${yearList}">
																<option value="${year }">${year }</option>
															</c:forEach>
														</select>
												</div>
												<div class="dropdown-chart"
													style="margin-right: 15px; margin-bottom: 10px;">
													<div class="label-chart">Period</div>													
												</div>
											</div>
											
											<div class="col-xs-12 changeModeToggle">
												<div class="row">
													<div class="col-xs-6">
														<div class="x_panel">
															<div class="x_title clearfix refreshChartTitle">
																<h2>${dashboardBean.graphs[0].graphCaption } <small></small></h2>
															</div>
															<div class="x_content">
																<div id="${dashboardBean.graphs[0].graphId }" style="min-height: 320px;"></div>
															</div>
														</div>
													</div>
													<div class="col-xs-6">
														<div class="x_panel">
															<div class="x_title clearfix refreshChartTitle">
																<h2>${dashboardBean.graphs[1].graphCaption} <small></small></h2>
															</div>
															<div class="x_content">
																<div id="${dashboardBean.graphs[1].graphId }" style="min-height: 320px;"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<c:if test="${principal.accnRole == 'CUS'}">
											<div class="col-xs-12">
												<div class="row">
													<div class="col-xs-12">
														<div class="x_panel">
															<div class="x_title clearfix refreshChartTitle">
																<h2>${dashboardBean.graphs[2].graphCaption} <small></small></h2>
															</div>
															<div class="x_content">
																<div id="${dashboardBean.graphs[2].graphId }" style="min-height: 320px;"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											</c:if>
											<c:if test="${principal.accnRole == 'SP'}">
											<div class="col-xs-12 changeModeToggle" style="display: none;">
												<div class="row">
													<div class="col-xs-12">
														<div class="x_panel">
															<div class="x_title clearfix refreshChartTitle">
																<h2>${dashboardBean.graphs[1].graphCaption} <small></small></h2>
															</div>
															<div class="x_content">
																<div id="${dashboardBean.graphs[1].graphId }-hidden" style="min-height: 320px;"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
											</c:if>
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->		
<%-- 		<spring:url var="revampedDashboard_js" value="/resources/marketplace/js/revampedDashboard.js"/> --%>
<%-- 		<script src="${revampedDashboard_js }" type ="text/javascript"></script> --%>

		<c:url var="dashboard_js" value="/resources/marketplace/js/dashboard.js" />
		<script src="${dashboard_js}" type="text/javascript"></script>
		<c:url var="loadTileURL" value="/dashboard/loadTiles"/>
		<c:url var="loadURL" value="/dashboard/loadCharts"/>
		<script type="text/javascript">
		function getCharts(charts, moduleCd, year, period) {
			$.ajax({
				url : "${loadURL}?year="+year+"&period="+period+"&moduleCd="+moduleCd+"&charts="+charts,
				method : "GET",
				success : function(result, status) {
					for(var i=0; i < result.length; i++){
						var JSONdata = JSON.parse(result[i]);
						console.log("JSONdata: " + JSONdata.data);
						drawChart(JSONdata.chartId, JSONdata.chartType, JSONdata.data,
								year, period, JSONdata.chartOptions);
					}						
				},
				error : function(jqXHR, Status, errorThrown) {
					console.log(chartId + ":Error(" + Status
							+ ") in AJAX: " + errorThrown);
				}
			});


		}

		function getTile(moduleCd) {
			$.ajax({
				url : "${loadTileURL}?moduleCd="+moduleCd,
				method : "GET",
				success : function(data, status) {
					if (status == 'success') {
						populateTiles(data);
					}
				},
				error : function() {
					console.log("error");
				}

			});
		}
		</script>
		<script type="text/javascript">
			var typeList;
			$(document).ready(
				function() {
					var year = $("#yearId").val();
					var period = $("#weekId").val();
					var month = $("#weekId").find(":selected").text();
				
					var array = defaultService.substring(1, defaultService.length-1).split('=');
					
					
				    $(".btn_module").on("click", function(evt) {
				    	var $this = $(this);
				    	setModule(this.id, $this.context.innerText);
					});

				    var moduleCd = typeList;
					var charts = "ALL";

					/*handle if default passed down is Multi mode instead of insurance*/
					if(typeList == "MULTI" || typeList == "RSTH"){
						changeModeToggle();
					}

					
					/* 
					this part is to link period and year together
					if today is 2018 June, period will only show until June when year 2018 is select
					*/
					$("#weekId option").each(function() {
						if ($(this).attr("year") != year) {
							$(this).hide();
						}
					});

					
					if(year != undefined && period != undefined){
	
						$("#yearId").on("change", function() {
							refreshChart();
							refreshOption();
						});
						$("#weekId").on("change", refreshChart);
						$(".refreshChartTitle h2").each(function() {
							$(this).find("small").text(month + " - " + year)
						});
						$(".refreshChartTitle2 h2").each(
							function() {
								$(this).find("small").text("before " + month + " - " + year)
							});
					}
					
					// getting tiles information
 					
					
					//getCharts(charts, moduleCd, year, period);
					//getTile(moduleCd);
					setModule(array[0], array[1]);
				});
		</script>
		<style type="text/css">
			div[onclick] {
				cursor: pointer;
			}
		</style>
		
</body>
</html>


