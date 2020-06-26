<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>
<spring:url var="common_shipment_js"
	value="/resources/marketplace/app/js/commonShipment.js" />
<script src="${common_shipment_js}" type="text/javascript"></script>
<spring:url var="shipment_gen_info_js"
	value="/resources/marketplace/app/js/shipmentGeneralInfo.js" />
<script src="${shipment_gen_info_js}" type="text/javascript"></script>

<script>
	var transportMode = "${shipmentBean.shipmentHeader.TMmstTransport.mmstTransCode}";
	
	var hasRequired = "false";//change to false after internationalization;
	var countryCd = "${principal.countryCd}";
	if('SG' == countryCd){
		hasRequired = "true";
	}
</script>
</head>

<body class="bg-LAAS-03">
	<form:form id="vccCOMarketPlaceForm" action="${shipment_submit_url}"
		name="vccCOMarketPlaceForm" modelAttribute="shipmentBean"
		method="post" enctype="multipart/form-data">
		<!-- header content -->
		<%@ include file="../marketplace/common/common_header.jspf"%>
		<!-- /header content -->


		<div class="bg-quotation">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="col-quote">
							<div class="row">
								<div class="col-xs-12">
									<div class="search-title">
										<span class="icon ion-network"></span>
										<c:choose>
											<c:when
												test="${shipmentBean.shipmentHeader.TMmstShpUnit.mmstShpunitCode =='BOX'}">
          										<spring:message code="marketplace.label.shipment.palletBoxCrates" />
       										</c:when>
											<c:when
												test="${shipmentBean.shipmentHeader.TMmstShpUnit.mmstShpunitCode =='CONTAINER'}">
          										<spring:message code="marketplace.label.shipment.containers" />
       										</c:when>
										</c:choose>
									</div>
								</div>
							</div>

							<!-- shipment part1 content -->
							<%@ include
								file="../shipment/common/common_shipment_multi_part1.jspf"%>
							<!-- /shipment part1 content -->

							<c:choose>
								<c:when
									test="${shipmentBean.shipmentHeader.TMmstShpUnit.mmstShpunitCode =='BOX'}">
									<%@ include
										file="../shipment/common/common_shipment_part2_box.jspf"%>
								</c:when>
								<c:when
									test="${shipmentBean.shipmentHeader.TMmstShpUnit.mmstShpunitCode =='CONTAINER'}">
									<%@ include
										file="../shipment/common/common_shipment_part2_container.jspf"%>
								</c:when>
							</c:choose>

							<!-- shipment part3 content -->
							<%@ include
								file="../shipment/common/common_shipment_multi_part3.jspf"%>
							<!-- /shipment part3 content -->
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
</body>

</html>