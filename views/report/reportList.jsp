<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>
<script type="text/javascript">
<!--
var sAjaxSourceUrl = "<spring:url value='/reportsAjax' />";
var accountRole = "${principal.accnRole}";

var accnid = '<spring:message  code="marketplace.label.reports.accnId" javaScriptEscape="true"/>';
var fromDt = '<spring:message  code="marketplace.label.reports.fromdate" javaScriptEscape="true"/>';
var	toDt = '<spring:message code="marketplace.label.reports.todate" javaScriptEscape="true"/>';
var fileM = '<spring:message code="marketplace.label.reports.reports" javaScriptEscape="true"/>';
var updatedDt = '<spring:message code="marketplace.label.reports.updateddt" javaScriptEscape="true"/>';
-->
</script>
<spring:url var="report_js" value="/resources/marketplace/app/js/report.js" />
<script src="${report_js}" type="text/javascript"></script>
</head>
<body>
	<!-- header content -->
	<%@ include file="../marketplace/common/common_header.jspf"%>
	<!-- /header content -->
	<div class="col-content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<!-- Column Content Fullwidth -->
					<div class="row">
						<div class="col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<div class="title-sub">
										<h2>Tax Invoice List
										<c:if test="${principal.accnRole =='ADMIN'}">
											<div style="float: right;">
											<select name="accnId" id="accnId" class="form-control">
											<option value="">ALL Accounts</option>
											<c:forEach var="opt" items="${accnList}" varStatus="i">
											<option value="${opt.accnId}">${opt.accnName}</option>
											</c:forEach>
											</select>
											</div>
										</c:if>
										</h2>
									</div>
									<div class="x_content">
										<div class="table-responsive">
											<table class="table-hover table-striped table-condensed" id="dataTable">
												<thead>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
													<tr>
														<th><input type="text" alt="0" id="search_0" name="search_0" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="1" id="search_1" name="search_1" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="2" id="search_2" name="search_2" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="3" id="search_3" name="search_3" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="4" id="search_4" name="search_4" value="" class="form-control input-xs search_init" /></th>
													</tr>
												</tfoot>
											</table>
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
	<!-- End Content -->
	<!-- footer content -->
	<%@ include file="../marketplace/common/common_footer.jspf"%>
	<!-- /footer content -->
</body>
</html>