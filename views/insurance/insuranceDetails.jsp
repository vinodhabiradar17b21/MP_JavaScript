<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>
<%@ include file="../shipment/common/common_shipment_detail_source.jspf"%>

<spring:url var="insuranceDetails_js" value="/resources/marketplace/app/js/insuranceDetails.js" />
<script src="${insuranceDetails_js}" type="text/javascript"></script>

<spring:url var="bidder_js" value="/resources/marketplace/app/js/bidder.js" />
<script src="${bidder_js}" type="text/javascript"></script>

<spring:url var="shipment_det_submit_url" value="/insuranceDetails/insuranceSubmit" />

</head>

<body>
<div class="bg-LAAS-04">
	<form:form id="vccCOMarketPlaceForm" action="${insurance_det_submit_url}" name="vccCOMarketPlaceForm" modelAttribute="shipmentBean" method="post" enctype="multipart/form-data">
		<!-- header content -->
		<%@ include file="../marketplace/common/common_header.jspf"%>
		<!-- /header content -->

		<div class="bg-quotation">
			<div class="container">

				<div class="row">

					<div class="col-xs-12">

						<div class="col-quote">

							<div class="well">
								<!-- Tabs -->
								<div class="row">
									<div class="col-xs-12">
										

											<div class="row">

												<div class="col-xs-6">
													<div class="text_ref">
														<strong>
														<spring:message code="marketplace.label.shipment.bookingRefNo" arguments="${shipmentBean.shipmentHeader.mshpRefNo}"/>
														</strong> 
														<input type="hidden" name="shpRefNo" id="shpRefNo" value="${shipmentBean.shipmentHeader.mshpRefNo}" /> 
													</div>
												</div>

											</div>

											<%@ include file="../shipment/common/common_shipment_stage.jspf"%>
											<ul class="nav nav-tabs" role="tablist">
	
											<c:forEach var="rec" items="${shipmentBean.tabSettings }">
												<li role="presentation" class="${rec.mmstWftabcfgTabActive}"><a href="${rec.mmstWftabcfgTabHref}" aria-controls="${rec.mmstWftabcfgTabAriaCtrl}" role="tab" data-toggle="tab"><spring:message code="${rec.mmstWftabcfgTabDispName}"/></a></li>
											</c:forEach>
											
										</ul>
									</div>
								</div>
								<!-- End Tabs -->
							</div>

							<div class="tab-content">

								<div role="tabpanel" class="tab-pane" id="tabQuotation">
									<%@ include file="../shipment/common/common_quotation.jspf"%>
								</div>

								<div role="tabpanel" class="tab-pane" id="tabShipment">
									<c:choose>
										<c:when test="${((principal.accnRole =='SP')) && (shipmentBean.shipmentHeader.TMmstWorkflow.mmstWorkflowCode =='INS_NEW')}">
											<%@ include file="../service/bidDataEntry.jsp"%>
										</c:when>
										<c:when test="${((principal.accnRole =='SP')) && (shipmentBean.shipmentHeader.TMmstWorkflow.mmstWorkflowCode !='INS_NEW')}">
											<%@ include file="../service/bidDetails.jsp"%>
										</c:when>
										<c:when test="${(principal.accnRole =='CUS' || principal.accnRole =='ADMIN') && (shipmentBean.shipmentHeader.TMmstWorkflow.mmstWorkflowCode !='INS_NEW')}">
											<%@ include file="../customer/customerBidDetails.jsp"%>
										</c:when>
									</c:choose>
									<%@ include file="../shipment/common/common_insurance_details.jspf"%>
								</div>
				
								<div role="tabpanel" class="tab-pane" id="tabDocs">
									<%@ include file="../shipment/common/common_quotation_docs.jspf"%>
								</div>
								
								<div role="tabpanel" class="tab-pane" id="tabMessage">
									<%@ include file="../shipment/common/common_shipment_messenger.jspf"%>
								</div>
								
								<div role="tabpanel" class="tab-pane" id="tabAudit">
									<%@ include file="../shipment/common/common_quotation_audit.jspf"%>
								</div>
								
								<div role="tabpanel" class="tab-pane" id="tabPayment">
									<%@ include file="../shipment/common/common_quotation_payment_details.jspf"%>
								</div>
								
								

							</div>


							<!-- End Well 01 -->

						</div>

					</div>
				</div>

			</div>
		</div>
		<!-- End Static Banner -->

		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->
	</form:form>
	<%@ include file="../shipment/common/common_quotation_terminate.jspf"%>
	<%@ include file="../shipment/common/common_quotation_fileupload.jspf"%>
	<%@ include file="../shipment/common/common_quotation_accept.jspf"%>
	<%@ include file="../shipment/common/common_quotation_payment.jspf"%>
	<%@ include file="../shipment/common/common_quotation_acknowledge.jspf"%>
	<%@ include file="../shipment/common/common_quotation_complete.jspf"%>
	<%@ include file="../shipment/common/common_quotation_docs_printing.jspf"%>
	</div>
</body>
</html>