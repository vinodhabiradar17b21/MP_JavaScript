<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>
<script type="text/javascript">
<!--
	var ctx = "${pageContext.request.contextPath}";
	var sAjaxSourceUrl = "<spring:url value='/payment/paymentListAjax' />";
	var verifyUrl = "<spring:url value='/payment/paymentVerify/' />";
	
	var rfqRefNo = '<spring:message code="marketplace.label.payment.rftrefno" javaScriptEscape="true"/>'
	var invNo = '<spring:message code="marketplace.label.payment.invno" javaScriptEscape="true"/>'
	var svcPck = '<spring:message code="marketplace.label.payment.svcpck" javaScriptEscape="true"/>'
	var method = '<spring:message code="marketplace.label.payment.method" javaScriptEscape="true"/>'
	var payAccn = '<spring:message code="marketplace.label.payment.payAccn" javaScriptEscape="true"/>'
	var amt = '<spring:message code="marketplace.label.payment.amt" javaScriptEscape="true"/>'
	var ccy = '<spring:message code="marketplace.label.payment.ccy" javaScriptEscape="true"/>'
	var attach = '<spring:message code="marketplace.label.payment.attach" javaScriptEscape="true"/>'
	var status = '<spring:message code="marketplace.label.payment.status" javaScriptEscape="true"/>'
	var billDt = '<spring:message code="marketplace.label.payment.billdt" javaScriptEscape="true"/>'
	var verifyDt = '<spring:message code="marketplace.label.payment.verifydt" javaScriptEscape="true"/>'
-->
</script>
<spring:url var="payment_js" value="/resources/marketplace/app/js/paymentList.js" />
<script src="${payment_js}" type="text/javascript"></script>
</head>
<body>
	<!-- header content -->
	<%@ include file="../marketplace/common/common_header.jspf"%>
	<!-- /header content -->
	<div class="col-content">
		<div class="container-fluid">
			<!-- Content -->
			<div class="row">
				<div class="col-xs-12">
					<!-- Column Content Fullwidth -->
					<div class="row">
						<div class="col-xs-12">
							<div class="x_panel">
								<div class="x_content">
								<div class="col-xs-2">
									<div class="title-sub">
										<h2><spring:message code="marketplace.label.payment.status"/> </h2>
									</div>
									<div class="col-report">
										<ul class="fordtreeview list-group">
											<li class=""><span class="hasSub" style="display: none;"></span>
												<ul class="list-group expanded ul-accountStatus">
													<li class="list-group-item" value="ALL"><a><i class="fa fa-table"></i>All</a></li>
													<li class="list-group-item" value="PENDING"><a><i class="fa fa-table"></i>Pending</a></li>
													<li class="list-group-item" value="FAILED"><a><i class="fa fa-table"></i>Rejected</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-xs-10">
									<div class="title-sub">
										<h2><spring:message code="marketplace.label.top.paymentlist"/> : <label class="control-label" id="statusDisplay" ></label>
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
														<th><input type="text" alt="5" id="search_5" name="search_5" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="6" id="search_6" name="search_6" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="7" id="search_7" name="search_7" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="8" id="search_8" name="search_8" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="9" id="search_9" name="search_9" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="10" id="search_10" name="search_10" value="" class="form-control input-xs search_init" /></th>
														<th><input type="text" alt="11" id="search_11" name="search_11" value="" class="form-control input-xs search_init" /></th>
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
	</div>
	<!-- End Content -->

	<!-- footer content -->
	<%@ include file="../marketplace/common/common_footer.jspf"%>
	<form:form id="vccform" name="vccform" method="post">
		<input type="hidden" name="paymentid" id="paymentid" value="" />
		<input type="hidden" name="statuscodes" id="statuscodes" value="" />
	</form:form>
	<!-- /footer content -->
</body>
</html>