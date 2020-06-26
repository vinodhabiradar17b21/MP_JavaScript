<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>



<spring:url var="insurance_js" value="/resources/marketplace/app/js/insurance.js" />
<script src="${insurance_js}" type="text/javascript"></script>

<spring:url var="attachment_js" value="/resources/marketplace/app/js/attachment.js" />
<script src="${attachment_js}" type="text/javascript"></script>

<spring:url var="attribute_js" value="/resources/marketplace/app/js/attribute.js" />
<script src="${attribute_js}" type="text/javascript"></script>
<script type="text/javascript">	
	var sAjaxSourceUrl4 = "<spring:url value='/shipment/datatable/lookup'/>";
	var optionsDocumentType = "";
	<c:forEach var="rec" items="${shipmentBean.fileCatList}">
	optionsDocumentType += "<option value='${rec.mmstFilecatCode}'>${rec.mmstFilecatDesc}</option>";
	</c:forEach>
	
	var ccyNoteMap = new Map();
	<c:forEach var="rec" items="${shipmentBean.currencyList}">
	ccyNoteMap.set('${rec.mmstCurrCode}','${rec.mmstCurrNote}');
	</c:forEach>
</script>
</head>

<body>
<div class="bg-LAAS-04">
	<form:form id="vccCOMarketPlaceForm" action="${insurance_submit_url}" name="vccCOMarketPlaceForm" modelAttribute="shipmentBean" method="post" enctype="multipart/form-data">

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
										<span class="fa fa-file-text-o"></span>
										<spring:message code="marketplace.label.shipment.insurance" />
									</div>
								</div>
							</div>

							<!-- Well 01 -->
							<div class="well">

								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.insuranceInfo" />
											</h2>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.goodsType" />
												</div>

												<form:select class="form-control input-xs space-input required" path="shipmentHeader.TMmstGoods.mmstGoodsCode">
													<c:forEach var="rec" items="${shipmentBean.goodsList }">
														<form:option value="${rec.mmstGoodsCode}">${rec.mmstGoodsDesc}</form:option>
													</c:forEach>
												</form:select>

												<%-- 
												<form:select class="form-control input-xs space-input" path="shipmentHeader.TMmstTransport.mmstTransCode">
													<c:forEach var="rec" items="${shipmentBean.transportModeList }">
														<form:option value="${rec.mmstTransCode}">${rec.mmstTransDesc}</form:option>
													</c:forEach>
												</form:select>--%>


												<div class="label-input">
													<spring:message code="marketplace.label.shipment.transport" />
												</div>
												<form:select class="form-control input-xs space-input" id="transportMode" path="shipmentHeader.TMmstTransport.mmstTransCode" onchange="transportModeChange()">
													<c:forEach var="rec" items="${shipmentBean.transportModeList }">
														<form:option value="${rec.mmstTransCode}">${rec.mmstTransDesc}</form:option>
													</c:forEach>
												</form:select>

											</div>
											<div class="col-xs-6">
												<div class="row-vcc">
													<div class="col-xs-vcc-12">
														<div class="label-input">
															<spring:message code="marketplace.label.shipment.goodsValue" />
														</div>
													</div>

													<div class="col-xs-vcc-6">
														<input type="text" class="form-control input-xs space-input money required" placeholder="Amount" id="goodsValue" onchange="updateSumInsuredValue()" />
														<form:input type="hidden" id="mshpGoodsValue" path="shipmentHeader.mshpGoodsValue" />
													</div>

													<div class="col-xs-vcc-6">
														<a data-toggle="popover" data-placement="top" data-content=""></a>
														<form:select class="form-control input-xs space-input required" id="goodsCurrency" path="shipmentHeader.TMmstCurrency.mmstCurrCode" onchange="updateGoodsCurrency()">
															<c:forEach var="currency" items="${shipmentBean.currencyList }">
																<form:option selected="${currency.mmstCurrLocalCcy}" value="${currency.mmstCurrDesc}">${currency.mmstCurrDesc}</form:option>
															</c:forEach>
														</form:select>
													</div>
												</div>
											</div>
												<div class="col-xs-6">
													<div class="row">
														<div class="col-xs-6">
															<div class="label-input">
																<spring:message code="marketplace.label.shipment.shipmentDate" />
															</div>
															</div>
															<div class = "col-xs-12">
															<div class="label-input">
																<div class="form-group has-feedback">
																	<form:input type="text" id="shipmentDepartureDate" class="form-control input-xs input-calendar" path="shipmentHeader.mshpDepartureDate" aria-describedby="inputSuccess2Status" />
																	<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
																</div></div>
														</div>
													</div>
												</div>
											</div>
									</div>
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">

												<div class="label-input"> <spring:message code="marketplace.label.shipment.sumInsuredPercentage" /> </div>
												<form:select class="form-control input-xs space-input required" id="mshpSumInsuredPercentage" path="shipmentHeader.mshpSumInsuredPercentage" onchange="updateSumInsuredValue()">
													<form:option value="110">110</form:option>
													<form:option value="100">100</form:option>
												</form:select>
														
														
												<%-- <form:input type="text" class="form-control input-xs space-input required" id="mshpSumInsuredPercentage" path="shipmentHeader.mshpSumInsuredPercentage" value="110" onchange="updateSumInsuredValue()"/>
												--%>
												


											</div>
											<div class="col-xs-6">
											<div class="row-vcc">

													<div class="col-xs-vcc-12">
														<div class="label-input"> <spring:message code="marketplace.label.shipment.sumInsured" /> </div>
													</div>

													<div class="col-xs-vcc-6">
														<input type="text" class="form-control input-xs input-disable money" placeholder="Amount" id="sumInsuredValue" readOnly="true" />
														<form:input type="hidden" id="mshpSumInsuredValue" path="shipmentHeader.mshpSumInsuredValue" />
													</div>

													<div class="col-xs-vcc-6">
														<form:input type="text" class="form-control input-xs input-disable" id="sumInsuredCurrency" path="shipmentHeader.mshpSumInsuredCurrencyCd" readOnly="true" />
													</div>
												</div>
												<!-- Date Picker 
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.departureDate" />
												</div>

												<div class="form-group has-feedback">
													<form:input type="text" id="shipmentDepartureDate" class="form-control input-xs input-calendar" path="shipmentHeader.mshpDepartureDate" aria-describedby="inputSuccess2Status" />
													<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
												</div>
												Date Picker -->
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-6">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.pickUpGoodsFrom" />
											</h2>
										</div>
									</div>

									<div class="col-xs-6">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.deliverGoodsTo" />
											</h2>
										</div>
									</div>
								</div>


								<div class="row">

									<!-- col-left -->
									<div class="col-xs-6">
										<div class="row">

											<div class="col-xs-6">

												<!-- Select -->
												<div id="countryCodeFromDiv" class="label-input">
													<spring:message code="marketplace.label.shipment.country" />
													<a href="#countryCodeFrom" role="button" data-toggle="modal">
													<span class="fa fa-search"></span>
													</a>
												</div>
												
												<form:select name="TMmstCountryByMshpCountryFromCd" path="shipmentHeader.TMmstCountryByMshpCountryFromCd.mmstCountryCode" id="TMmstCountryByMshpCountryFromCd" class="form-control input-xs space-input required" onchange="countryFromChange()">
													<form:option value="">--select--</form:option>
													<c:forEach var="rec" items="${shipmentBean.countryList }" >
														<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
													</c:forEach>
												</form:select>
												<%-- 
												<form:input type="text" class="form-control input-xs space-input-pointer required" id="TMmstCountryByMshpCountryFromDesc"
													path="shipmentHeader.TMmstCountryByMshpCountryFromCd.mmstCountryDesc" onclick="onPickListClick(\'countryCodeFrom\')" />
												<form:input type="hidden" id="TMmstCountryByMshpCountryFromCd" path="shipmentHeader.TMmstCountryByMshpCountryFromCd.mmstCountryCode" />
												--%>
												<div id="postalCodeFrom">
													<!-- Text Field -->
													<div class="label-input">
														<spring:message code="marketplace.label.shipment.postCode" />
													</div>
													<form:input type="text" class="form-control input-xs space-input" placeholder="Postal Code" path="shipmentHeader.mshpPostcodeFrom" />
													<!-- End Text Field -->
												</div>
											</div>

											<div class="col-xs-6">

												<!-- Text Field -->
												<div id="portCodeFromDiv" class="label-input">
													<spring:message code="marketplace.label.shipment.portcode" />
													<a href="#portCodeFrom" role="button" data-toggle="modal">
													<span class="fa fa-search"></span>
													</a>
												</div>

												<form:input type="text" class="form-control input-xs space-input-pointer" id="TMmstPortByMshpPortFromDesc"
													path="shipmentHeader.TMmstPortByMshpPortFromCd.mmstPortDesc" />
													<!-- onclick="onPickListClick(\'portCodeFrom\')" /> -->
												<form:input type="hidden" id="TMmstPortByMshpPortFromCd" path="shipmentHeader.TMmstPortByMshpPortFromCd.mmstPortCode" />


											</div>

										</div>
									</div>
									<!-- End col-left -->

									<!-- col-right-->
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<!-- Select -->
												<div id="countryCodeToDiv" class="label-input">
													<spring:message code="marketplace.label.shipment.country" />
													<a href="#countryCodeTo" role="button" data-toggle="modal">
														<span class="fa fa-search"></span>
													</a>
												</div>
												
												<form:select name="TMmstCountryByMshpCountryToCd" path="shipmentHeader.TMmstCountryByMshpCountryToCd.mmstCountryCode" id="TMmstCountryByMshpCountryToCd" class="form-control input-xs space-input required" onchange="countryToChange()">
													<form:option value="">--select--</form:option>
													<c:forEach var="rec" items="${shipmentBean.countryList }" >
														<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
													</c:forEach>
												</form:select>
												<%-- 
												<form:input type="text" class="form-control input-xs space-input-pointer required" id="TMmstCountryByMshpCountryToDesc"
													path="shipmentHeader.TMmstCountryByMshpCountryToCd.mmstCountryDesc" />
													<!-- onclick="onPickListClick(\'countryCodeTo\')" />  -->

												<form:input type="hidden" id="TMmstCountryByMshpCountryToCd" path="shipmentHeader.TMmstCountryByMshpCountryToCd.mmstCountryCode" />
												--%>
												<!-- End Select -->

												<!-- Text Field -->
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.postCode" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Postal Code" path="shipmentHeader.mshpPostcodeTo" />
												<!-- End Text Field -->
											</div>

											<div class="col-xs-6">
												<!-- Text Field -->
												<div id="portCodeToDiv" class="label-input">
													<spring:message code="marketplace.label.shipment.portcode" />
													<a href="#portCodeTo" role="button" data-toggle="modal">
														<span class="fa fa-search"></span>
													</a>
												</div>

												<form:input type="text" class="form-control input-xs space-input-pointer" id="TMmstPortByMshpPortToDesc"
													path="shipmentHeader.TMmstPortByMshpPortToCd.mmstPortDesc" />
													<!-- onclick="onPickListClick(\'portCodeTo\')" /> -->
												<form:input type="hidden" id="TMmstPortByMshpPortToCd" path="shipmentHeader.TMmstPortByMshpPortToCd.mmstPortCode" />
												<!-- End Text Field -->


											</div>

										</div>
									</div>
									<!-- End col-right -->

								</div>
				</div>
				<div class="well">
								<%--
								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.transportDetails" />
											</h2>
										</div>
									</div>
								</div>

								<div class="row" id="SEA_DIV">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.voyageName" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Name" path="transportDetails.mstransVoyageName" />
											</div>
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.voyageAge" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Age" path="transportDetails.mstransVoyageAge" />
											</div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.voyageFlag" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Flag" path="transportDetails.mstransVoyageFlag" />
											</div>
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.voyageClass" />
												</div>

												<form:input type="text" class="form-control input-xs space-input" placeholder="Classification" path="transportDetails.mstransVoyageClass" />
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="AIR_DIV">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.flightNo" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Flight Number" path="transportDetails.mstransFlightNo" />
											</div>
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.masterAirWayBill" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Master Air Waybill" path="transportDetails.mstransMasterAwb" />
											</div>
										</div>
									</div>
								</div>

								<div class="row" id="ROAD_DIV">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.convRefno" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Conveyance" path="transportDetails.mstransConvRefNo" />
											</div>
											<div class="col-xs-6">
												<div class="label-input">
													<spring:message code="marketplace.label.shipment.transportId" />
												</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Transport ID" path="transportDetails.mstransTransId" />
											</div>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.transhipmentDetails" />
											</h2>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<form:textarea class="form-control input-xs space-input" rows="2" path="shipmentHeader.mshpTranshipmentDetails" />
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.inlandTransitDetails" />
											</h2>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<form:textarea class="form-control input-xs space-input" rows="2" path="shipmentHeader.mshpInlandTransitDetails" />
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.pastClaimsDetails" />
											</h2>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<form:textarea class="form-control input-xs space-input" rows="2" path="shipmentHeader.mshpPastClaimDetails" />
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.specificDetails" />
											</h2>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<form:textarea class="form-control input-xs space-input" rows="2" path="shipmentHeader.mshpSpecificDetails" />
									</div>
								</div>--%>

				<div class="row">
						<div class="col-xs-12">
							<div class="title-sub">
								<h2><spring:message code="marketplace.label.shipment.addInfo"/></h2>
							</div>
						</div>
					</div>

					<!-- Row 1 -->
						<div class="row">	
						<c:if test="${fn:length(shipmentBean.attributeList) gt 0}">
						
						<div class="col-xs-6">
						<div class="row">	
						 <c:set var="count" value="0" scope="page" />
	<c:forEach var="attr" items="${shipmentBean.attributeList }" varStatus="attribute" >
		 <c:choose>
		  <c:when test="${attr.mshipAttributeType eq 'D'}">
		   <div class="col-xs-6">
		   
		  
            <c:set var="count" value="${count + 1}" scope="page"/>
         
		 	<div class="label-input"><spring:message code="${attr.mshipAttributelabel}"/></div>

					<div class="form-group has-feedback">
						<form:input type="text" id="attributeDate${count}" class="form-control input-xs input-calendar" path="attributeList[${attribute.index }].mshipAttributeVal" aria-describedby="inputSuccess2Status"/> 
						<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
					</div>
					</div>
	
		  </c:when>
		  <c:when test="${attr.mshipAttributeType eq 'L'}">
		  <div class="col-xs-6">
		   
		 <div class="label-input">	
		  <c:set var="count" value="${count + 1}" scope="page"/>	  
		  <div id="${attr.mshipLookupName}" class="label-input" onclick="lookupValue(this);"  value="${attr.mshipAttributelabel}"> 
				<spring:message code="${attr.mshipAttributelabel}"/>
							<a id="${attr.mshipLookupName}" onclick="lookupValue(this);" role="button" data-toggle="modal">
							<span class="fa fa-search"></span></a>				
				<form:input type="text" id="attributeLookup${count}"  class="form-control input-xs space-input-pointer" path="attributeList[${attribute.index }].mshipAttributeVal" />
			
				</div>
						
			</div>
					
						
		</div>
	
		  </c:when>
	
		  <c:otherwise>
		  <div class="col-xs-6">				    
					<div class="label-input"><spring:message code="${attr.mshipAttributelabel}"/></div>					
					<form:input type="text" class="form-control input-xs space-input ${attr.mshipAttributeflag}"  placeholder="${attr.mshipAttributetipnote}"  path="attributeList[${attribute.index }].mshipAttributeVal" /> 
		 </div>
		
		  </c:otherwise>
		 </c:choose>
		 								
	</c:forEach>
					</div>
					   </div>
					    </c:if>
						</div>
						<div class="row">
						   <div class="col-xs-12">
							
								<!-- Textarea -->
								<div class="label-input"><spring:message code="marketplace.label.shipment.addInfo.content"/></div>
								<form:textarea class="form-control input-xs space-input" id="shipmentRemark" path="shipmentHeader.mshpRemark" />
								<!-- End Textarea -->
							</div>
						</div>
							

								<div class="row">

									<!-- Table Condition -->
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>
												<spring:message code="marketplace.label.shipment.suppDoc" />
												<button type="button" class="btn btn-blue-green02 input-xs" onclick="addRowForSupportingDoc()">
													<span class="fa fa-plus-circle"></span>
													<spring:message code="marketplace.label.action.add" />
												</button>
											</h2>
										</div>
									</div>

									<input type="hidden" name="totalNoAttachs" id="totalNoAttachs" value="${fn:length(shipmentBean.tMshipAttaches)}" />

									<div class="col-xs-12">
										<!-- Table Listing -->
										<div class="table-responsive">
											<table class="table table-striped jambo_table bulk_action"
												id="supportDocs">
												<thead>
													<tr class="headings">
														<th class="column-title col-xs-2"><spring:message code="marketplace.label.shipment.documentType" /></th>
														<th class="column-title col-xs-3"><spring:message code="marketplace.label.shipment.attach" /></th>
														<th class="column-title col-xs-4"><spring:message code="marketplace.label.shipment.remarks" /></th>
														<th class="column-title col-xs-1"><spring:message code="marketplace.label.action" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="rec" items="${shipmentBean.tMshipAttaches}" varStatus="i">
														<tr>
															<td><form:select class="form-control input-xs space-input required" path="tMshipAttaches[${i.index}].TMmstFileCategory.mmstFilecatCode">
																	<c:forEach var="rec" items="${shipmentBean.fileCatList }">
																		<form:option value="${rec.mmstFilecatCode}">${rec.mmstFilecatDesc}</form:option>
																	</c:forEach>
																</form:select></td>
															<td><a href='${fileview_url}?docType=${shipmentBean.tMshipAttaches[i.index].msattDoctype}&fileId=${shipmentBean.tMshipAttaches[i.index].msattId}&fileName=${shipmentBean.tMshipAttaches[i.index].msattName}'
																target='_blank'>${shipmentBean.tMshipAttaches[i.index].msattName}</a>
															</td>
															<td><form:input type="text" class="form-control input-xs space-input required" path="tMshipAttaches[${i.index}].msattRemark" /></td>
															<td><a class="editor_remove" role="button"><i class="fa fa-trash fa-2x"></i></a> 
															<form:input type="hidden" id="attachAliveFlag${i.index}" path="tMshipAttaches[${i.index}].msattAliveFlag" />
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- End Table Listing -->
									</div>
									<!-- End Table Condition-->

								</div>
								<!-- End x content -->



								<!-- Btn Submit -->
								<div class="row">
									<div class="col-xs-12">
										<div class="col-search-btn-LAAS">

											<div class="btn-group input-xs" role="group" aria-label="...">
												<form:button name="action" id="CUS_SUBMIT_QUOT" value="CUS_SUBMIT_QUOT" class="btn btn-action-footer">
													<div class="fa fa-check-square-o"></div>
													<spring:message code="marketplace.label.shipment.action.submitQuot" />
												</form:button>
											</div>

										</div>
									</div>


								</div>
								<!-- End Btn Submit -->

							</div>

							<!-- End Well 01 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Static Banner -->
		<%@ include file="../shipment/common/common_shipment_pickList.jspf"%>
		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->
	</form:form>
</div>
</body>
</html>