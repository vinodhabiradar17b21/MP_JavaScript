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
										<spring:message code="marketplace.label.shipment.insurancelch" />
									</div>
								</div>
							</div>
							
							<c:choose>
								<c:when test="${shipmentBean.amendment != null && shipmentBean.amendment =='Y'}">
									<div class="well">
										<div class="row">
											<div class="col-xs-12">
												<ul class="nav nav-tabs" role="tablist">
													<div class="text_ref">
														<strong><spring:message code="marketplace.label.shipment.sourceRefNo" arguments="${shipmentBean.shipmentHeader.mshpSourceRefNo}" /></strong>
														<input type="hidden" name="amendment" id="amendment" value="${shipmentBean.amendment}" />
													</div>
												</ul>
											</div>
										</div>
									</div>
								</c:when>
								<c:when test="${shipmentBean.shipmentHeader.mshpRefNo != null}">
									<div class="well">
										<div class="row">
											<div class="col-xs-12">
												<ul class="nav nav-tabs" role="tablist">
													<div class="text_ref">
														<strong> <spring:message code="marketplace.label.shipment.bookingRefNo" arguments="${shipmentBean.shipmentHeader.mshpRefNo}" />
														</strong> <input type="hidden" name="shipmentRefNo" id="shipmentRefNo" value="${shipmentBean.shipmentHeader.mshpRefNo}" />
													</div>
												</ul>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>

							<!-- Well 01 -->
							<div class="well">

								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2><spring:message code="marketplace.label.shipment.insuranceInfo" /></h2>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input"><spring:message code="marketplace.label.shipment.goodsType" /></div>
												<form:select class="form-control input-xs space-input required" id="goodsTypeLCH" path="shipmentHeader.TMmstGoods.mmstGoodsCode">
													<c:forEach var="rec" items="${shipmentBean.goodsList }">
														<form:option value="${rec.mmstGoodsCode}">${rec.mmstGoodsDesc}</form:option>
													</c:forEach>
												</form:select>

												<div class="label-input"> Incoterms for Purchase </div>
												<form:select class="form-control input-xs space-input required" id="mshpIncoterm" path="shipmentHeader.mshpIncoterm">
													<form:option value="">--select--</form:option>
													<c:forEach var="rec" items="${shipmentBean.incotermList }" >
														<form:option value="${rec.incotermCode}">${rec.incotermDesc}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="col-xs-6">
												<div class="row-vcc">
													<div class="col-xs-vcc-12">
														<div class="label-input"><spring:message code="marketplace.label.shipment.totalsuminsured" /></div>
													</div>

													<div class="col-xs-vcc-6">
														<input type="text" class="form-control input-xs space-input money required" placeholder="Amount" id="goodsValue" onchange="updateSumInsuredValue()" />
														<form:input type="hidden" id="mshpGoodsValue" path="shipmentHeader.mshpGoodsValue" />
													</div>

													<div class="col-xs-vcc-6">
														<a data-toggle="popover" data-placement="top" data-content=""></a>
														<form:select class="form-control input-xs space-input required" id="goodsCurrency" path="shipmentHeader.TMmstCurrency.mmstCurrCode" onchange="updateGoodsCurrency()">
															<c:forEach var="currency" items="${shipmentBean.currencyList }">
																<form:option value="${currency.mmstCurrDesc}">${currency.mmstCurrDesc}</form:option>
															</c:forEach>
														</form:select>
													</div>
												</div>
											</div>
											<div class="col-xs-6">
												<div class="label-input"> Incoterms for Sales (if applicable) </div>
												<form:input type="text" class="form-control input-xs input-disable" id="mshpIncotermSales" onblur="toUpper(this);" path="shipmentHeader.mshpIncotermSales" />
											</div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input"> <spring:message code="marketplace.label.shipment.sumInsuredPercentage" /> </div>
												<form:select class="form-control input-xs space-input required" id="mshpSumInsuredPercentage" path="shipmentHeader.mshpSumInsuredPercentage" onchange="updateSumInsuredValue()">
													<form:option value="110">110</form:option>
												</form:select>
												
												
											</div>
											<div class="col-xs-6">
												<div class="row-vcc">
													<div class="col-xs-vcc-12"><div class="label-input"> <spring:message code="marketplace.label.shipment.sumInsured" /> </div></div>
													<div class="col-xs-vcc-6">
														<input type="text" class="form-control input-xs input-disable money" placeholder="Amount" id="sumInsuredValue" readOnly="true" />
														<form:input type="hidden" id="mshpSumInsuredValue" path="shipmentHeader.mshpSumInsuredValue" />
													</div>
													<div class="col-xs-vcc-6">
														<form:input type="text" class="form-control input-xs input-disable" id="sumInsuredCurrency" path="shipmentHeader.mshpSumInsuredCurrencyCd" readOnly="true" />
													</div>
												</div>
												
												
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-6">
										<div class="title-sub">
											<h2><spring:message code="marketplace.label.shipment.insact"/></h2>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="title-sub">
											<h2>Forwarders (If applicable)</h2>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-6">
										<div class="row-vcc">
											<div class="col-xs-vcc-6">
												<div class="label-input"><spring:message code="marketplace.label.shipment.insact.name"/></div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="Name" onblur="toUpper(this);" path="shipmentHeader.mshpInsActname" id="mshpInsActname" maxLength = "100"/>
											</div>
											<div class="col-xs-vcc-6">
												<div class="label-input"><spring:message code="marketplace.label.shipment.insact.uen"/></div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="UEN" path="shipmentHeader.mshpInsActuen" id="mshpInsActuen" maxLength = "50"/>
											</div>
											
										</div>
										<div class="row-vcc">
											<div class="col-xs-vcc-6">
												<div class="label-input">Contact</div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="Contact" path="shipmentHeader.mshpInsActctc" id="mshpInsActctc" maxLength = "50"/>
											</div>
										</div>
										<div class="row-vcc">
											<div class="col-xs-vcc-12">
												<div class="label-input">Address</div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="Address" path="shipmentHeader.mshpInsActaddr" id="mshpInsActaddr" maxLength = "200"/>
											</div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="row-vcc">
											<div class="col-xs-vcc-6">
												<div class="label-input">Company Name</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Name" onblur="toUpper(this);" path="shipmentHeader.mshpInsFwdname" id="mshpInsFwdname" maxLength = "100"/>
											</div>
											<div class="col-xs-vcc-6">
												<div class="label-input">Contact</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Contact" path="shipmentHeader.mshpInsFwdctc" id="mshpInsFwdctc" maxLength = "50"/>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Well 01 -->
							
							<!-- Well 02 -->
							<div class="well">	
								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>Voyage</h2>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input"><spring:message code="marketplace.label.shipment.transport" /></div>
												<form:select class="form-control input-xs space-input" id="transportMode" path="shipmentHeader.TMmstTransport.mmstTransCode" onchange="transportModeChange()">
													<c:forEach var="rec" items="${shipmentBean.transportModeList }">
														<form:option value="${rec.mmstTransCode}">${rec.mmstTransDesc}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="col-xs-6">
												<div class="row">
													<div class="col-xs-6">
														<div class="label-input"><spring:message code="marketplace.label.shipment.shipmentDate" /></div>
													</div>
													<div class = "col-xs-12">
														<div class="label-input">
															<div class="form-group has-feedback">
																<form:input type="text" id="shipmentDepartureDate" class="form-control input-xs input-calendar" path="shipmentHeader.mshpDepartureDate" aria-describedby="inputSuccess2Status" />
																<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6 voyage">
												<div class="label-input"><spring:message code="marketplace.label.shipment.voyageName" /></div>
												<form:input type="text" class="form-control input-xs space-input" onblur="toUpper(this);" path="transportDetails[0].mstransVoyageName" id="mstransVoyageName" />
											</div>
											<div class="col-xs-6 flight">
												<div class="label-input"><spring:message code="marketplace.label.shipment.flightNo" /></div>
												<form:input type="text" class="form-control input-xs space-input" onblur="toUpper(this);" path="transportDetails[0].mstransFlightNo" id="mstransFlightNo" />
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-6">
										<div class="title-sub">
											<h2><spring:message code="marketplace.label.shipment.pickUpGoodsFrom" /></h2>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="title-sub">
											<h2><spring:message code="marketplace.label.shipment.deliverGoodsTo" /></h2>
										</div>
									</div>
								</div>

								<div class="row">
									<!-- col-left -->
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div id="countryCodeFromDiv" class="label-input"><spring:message code="marketplace.label.shipment.country" />
													<a href="#countryCodeFrom" role="button" data-toggle="modal"><span class="fa fa-search"></span></a>
												</div>
												<form:select path="shipmentHeader.TMmstCountryByMshpCountryFromCd.mmstCountryCode" id="TMmstCountryByMshpCountryFromCd" class="form-control input-xs space-input required" >
													<form:option value="">--select--</form:option>
													<c:forEach var="rec" items="${shipmentBean.countryList }" >
														<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
													</c:forEach>
												</form:select>
												
												<div class="label-input"><spring:message code="marketplace.label.shipment.address"/></div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="Address Line 1" onblur="toUpper(this);" path="shipmentHeader.mshpAddr1From" id="mshpAddr1From" maxLength = "35"/>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Address Line 2" onblur="toUpper(this);" path="shipmentHeader.mshpAddr2From" id="mshpAddr2From" maxLength = "35"/>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Address Line 3" onblur="toUpper(this);" path="shipmentHeader.mshpAddr3From" id="mshpAddr3From" maxLength = "35"/>
											</div>

											<div class="col-xs-6">
												<div id="portCodeFromDiv" class="label-input"><spring:message code="marketplace.label.shipment.portcode" />
													<a href="#portCodeFrom" role="button" data-toggle="modal"><span class="fa fa-search"></span></a>
												</div>
												<form:input type="text" class="form-control input-xs space-input-pointer" id="TMmstPortByMshpPortFromDesc" path="shipmentHeader.TMmstPortByMshpPortFromCd.mmstPortDesc" />
												<form:input type="hidden" id="TMmstPortByMshpPortFromCd" path="shipmentHeader.TMmstPortByMshpPortFromCd.mmstPortCode" />
												
												<div id="postalCodeFrom">
													<div class="label-input"><spring:message code="marketplace.label.shipment.postCode" /></div>
													<form:input type="text" class="form-control input-xs space-input" placeholder="Postal Code" path="shipmentHeader.mshpPostcodeFrom" id="mshpPostcodeFrom"/>
												</div>
												
												<div class="label-input">Place of Origin</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Place of Origin" onblur="toUpper(this);" path="shipmentHeader.mshpPlaceOfOrigin" id="mshpPlaceOfOrigin" />
											</div>
										</div>
									</div>
									<!-- End col-left -->

									<!-- col-right-->
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div id="countryCodeToDiv" class="label-input"><spring:message code="marketplace.label.shipment.country" />
													<a href="#countryCodeTo" role="button" data-toggle="modal"><span class="fa fa-search"></span></a>
												</div>
												<form:select name="TMmstCountryByMshpCountryToCd" path="shipmentHeader.TMmstCountryByMshpCountryToCd.mmstCountryCode" id="TMmstCountryByMshpCountryToCd" class="form-control input-xs space-input required">
													<form:option value="">--select--</form:option>
													<c:forEach var="rec" items="${shipmentBean.countryList }" >
														<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
													</c:forEach>
												</form:select>
												
												<div class="label-input">Final Destination Address</div>
												<form:input type="text" class="form-control input-xs space-input required" placeholder="Address Line 1" onblur="toUpper(this);" path="shipmentHeader.mshpAddr1To" id="mshpAddr1To" maxLength = "35"/>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Address Line 2" onblur="toUpper(this);" path="shipmentHeader.mshpAddr2To" id="mshpAddr2To" maxLength = "35"/>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Address Line 3" onblur="toUpper(this);" path="shipmentHeader.mshpAddr3To" id="mshpAddr3To" maxLength = "35"/>
											</div>

											<div class="col-xs-6">
												<!-- Text Field -->
												<div id="portCodeToDiv" class="label-input"><spring:message code="marketplace.label.shipment.portcode" />
													<a href="#portCodeTo" role="button" data-toggle="modal"><span class="fa fa-search"></span></a>
												</div>
												<form:input type="text" class="form-control input-xs space-input-pointer" id="TMmstPortByMshpPortToDesc" path="shipmentHeader.TMmstPortByMshpPortToCd.mmstPortDesc" />
												<form:input type="hidden" id="TMmstPortByMshpPortToCd" path="shipmentHeader.TMmstPortByMshpPortToCd.mmstPortCode" />
												
												<div class="label-input"><spring:message code="marketplace.label.shipment.postCode" /></div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Postal Code" path="shipmentHeader.mshpPostcodeTo" id="mshpPostcodeTo"/>
											</div>
										</div>
									</div>
									<!-- End col-right -->
								</div>
								
								<div class="row">
									<div class="col-xs-6">
										<div class="row">
											<div class="col-xs-6">
												<div class="label-input">Any Transhipment?</div>
												<form:select class="form-control input-xs space-input" id="transhipmentInd" path="shipmentHeader.mshpTranshipmentInd" onchange="transhipmentChange()">
													<form:option value="Y">Yes</form:option>
													<form:option value="N">No</form:option>
												</form:select>
											</div>
											<div class="col-xs-6 transhipment">
												<div class="label-input">Transhipment No</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="No. of transhipment" path="shipmentHeader.mshpTranshipmentNo" id="mshpTranshipmentNo"/>
											</div>
										</div>
									</div>
									<div class="col-xs-6 transhipment">
										<div class="row">
											<div class="col-xs-12">
												<div class="label-input">Transhipment Details</div>
												<form:input type="text" class="form-control input-xs space-input" placeholder="Details of transhipment" onblur="toUpper(this);" path="shipmentHeader.mshpInlandTransitDetails" id="mshpInlandTransitDetails"/>
											</div>
										</div>
									</div>
								</div>
								
							</div>
							<!-- End Well 02 -->
							
							<!-- Well 03 -->
							<input type="hidden" name="totalNoUnit" id="totalNoUnit" value="${fn:length(shipmentBean.tMshipItems)}" />
							<div class="well">
								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub">
											<h2>Goods Details
												<button type="button" class="btn btn-blue-green02 input-xs" onclick="addRowForGoods()">
													<span class="fa fa-plus-circle"></span>
													<spring:message code="marketplace.label.action.add" />
												</button>
											</h2>
										</div>
									</div>
								</div>

								<div class="row">
						   			<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-striped jambo_table bulk_action" id="goodsDtls">
												<thead>
													<tr class="headings">
														<th class="column-title col-xs-3">Description of Goods</th>
														<th class="column-title col-xs-2">Conditions of Goods</th>
														<th class="column-title col-xs-2">Packaging Types</th>
														<th class="column-title col-xs-1">Quantity</th>
														<th class="column-title col-xs-3">Additional Information (Size, FCL/LCL etc)</th>
														<th class="column-title col-xs-1">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="rec" items="${shipmentBean.tMshipItems}" varStatus="i">
													<tr>
														<td>
															<form:input type="text" class="form-control input-xs space-input required" path="tMshipItems[${i.index}].msitmDesc" id="itemDesc_${i.index}"/>
														</td>
														<td>
															<form:select class="form-control input-xs space-input required" path="tMshipItems[${i.index}].msitmCondition" id="itemCondition_${i.index}">
																<form:option value="New">New</form:option>
																<form:option value="Reconditioned">Reconditioned</form:option>
																<form:option value="Damaged">Damaged</form:option>
															</form:select>
														</td>
														<td>
															<form:select class="form-control input-xs space-input required" path="tMshipItems[${i.index}].msitmPackaging" id="itemPackaging_${i.index}">
																<form:option value="Break Buld">Break Bulk</form:option>
																<form:option value="Palletized">Palletized</form:option>
															</form:select>
														</td>
														<td>
															<form:input type="text" class="form-control input-xs space-input required" path="tMshipItems[${i.index}].msitmNoUnit" id="itemUnit${i.index}"/>
														</td>
														<td>
															<form:input type="text" class="form-control input-xs space-input required" path="tMshipItems[${i.index}].msitmAddRmk" id="itemRmk_${i.index}"/>
														</td>
														<td>
															<a class="editor_remove" role="button"><i class="fa fa-trash fa-2x"></i></a> 
															<form:input type="hidden" id="attachAliveFlag${i.index}" path="tMshipItems[${i.index}].msitmAliveFlag" />
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							

								<div class="row">
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
										<div class="table-responsive">
											<table class="table table-striped jambo_table bulk_action" id="supportDocs">
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
														<td>
															<form:select class="form-control input-xs space-input required" path="tMshipAttaches[${i.index}].TMmstFileCategory.mmstFilecatCode" >
																<c:forEach var="rec" items="${shipmentBean.fileCatList }">
																	<form:option value="${rec.mmstFilecatCode}">${rec.mmstFilecatDesc}</form:option>
																</c:forEach>
															</form:select>
														</td>
														<td>
															<c:choose>
															<c:when test="${not empty shipmentBean.tMshipAttaches[i.index].msattName }">
															<a href='${fileview_url}?docType=${shipmentBean.tMshipAttaches[i.index].msattDoctype}&fileId=${shipmentBean.tMshipAttaches[i.index].msattId}&fileName=${shipmentBean.tMshipAttaches[i.index].msattName}'
															target='_blank'>${shipmentBean.tMshipAttaches[i.index].msattName}</a>
															</c:when>
															<c:otherwise>
										                 		<form:input type="file" path="tMshipAttaches[${i.index}].msattFileData" class="form-control input-xs space-input required"/>
										                 	</c:otherwise>
										                 	</c:choose>
														</td>
														<td>
															<form:input type="text" class="form-control input-xs space-input" path="tMshipAttaches[${i.index}].msattRemark" />
														</td>
														<td>
															<%-- <a class="editor_remove" role="button"><i class="fa fa-trash fa-2x"></i></a> --%>
															<form:input type="hidden" id="attachAliveFlag${i.index}" path="tMshipAttaches[${i.index}].msattAliveFlag" /> 
														</td>
													</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<!-- Btn Submit -->
								<div class="row">
									<div class="col-xs-12">
										<div class="col-search-btn-LAAS">
											<div class="btn-group input-xs" role="group" aria-label="...">
												<button type="button" class="btn btn-action-footer" data-toggle="modal" data-target="#inspreview">
													<spring:message code="marketplace.label.shipment.action.preview" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<!-- End Btn Submit -->
							</div>
							<!-- End Well 02 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Preview -->
		<%@ include file="insuranceDataEntryLCHPreview.jspf"%>
		<!-- End Static Banner -->
		<%@ include file="../shipment/common/common_shipment_pickList.jspf"%>
		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->
	</form:form>
</div>
</body>
</html>