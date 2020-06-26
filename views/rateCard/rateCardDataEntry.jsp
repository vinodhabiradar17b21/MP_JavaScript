<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>

<spring:url var="rate_card_js" value="/resources/marketplace/app/js/rateCard.js" />
<script src="${rate_card_js}" type="text/javascript"></script>
<script>
	var transportMode = "";
</script>
</head>
<body>
	<form:form id="rateCardForm" action="${ratecard_submit_url}" name="rateCardForm" modelAttribute="rateCardBean" method="post">
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
														<!-- Action Button -->
			<div class="col-xs-12">
				<div class="col-action-btn">
					<div class="btn-group input-xs" role="group" aria-label="...">
					<c:choose>
						<c:when test="${view}">
							<form:button name="action" id="UPDATE" value="UPDATE" class="btn btn-action">
								<div class="fa fa-floppy-o"></div> Update
							</form:button>

						</c:when>
						<c:otherwise>
							<form:button name="action" id="CREATE" value="CREATE" class="btn btn-action">
								<div class="fa fa-check-square-o"></div> Submit
							</form:button>
						</c:otherwise>
						</c:choose>


					</div>
				</div>
			</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="title-sub"><h2>Rate Card</h2></div>
											<form:input type="hidden" path="rateCard.mrcId"/>
											<input type="hidden" name="totalNoUnit" id="totalNoUnit" value="${fn:length(rateCardBean.rateCardScList)}" />
											<input type="hidden" name="totalNoUnitCntr" id="totalNoUnitCntr" value="${fn:length(rateCardBean.rateCardScCntrList)}" />
											<input type="hidden" name="totalNoSubUnit" id="totalNoSubUnit" value="${fn:length(rateCardBean.rateCardScDetList)}" />
											<input type="hidden" name="totalNoUnitAspTrk" id="totalNoUnitAspTrk" value="${fn:length(rateCardBean.rateCardScAspTruckList)}" />
											<c:set var="count" value="0" scope="page" />
									</div>	
								</div>
						        <div class="row">
									<div class="col-xs-3">
										<div class="label-input">Rate Card Description</div>
										<form:input type="text" class="form-control input-xs space-input required" placeholder="Description" path="rateCard.mrcDesc" maxLength = "512" />
									</div>
									<div class="col-xs-3">
										<div class="label-input">Carrier</div>
										<form:input type="text" class="form-control input-xs space-input" placeholder="Carrier" path="rateCard.mrcCarrier"  maxLength = "45"/>
									</div>
									<div class="col-xs-3">
										<div class="label-input">Effective Date From</div>
									    <div class="form-group has-feedback">
								          	<form:input type="text" id="mrcValidFrDt" class="form-control input-xs input-calendar required" path="rateCard.mrcValidFrDt" aria-describedby="inputSuccess2Status" />
								           	<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
								         </div>
									</div>
									<div class="col-xs-3">					               
					                	<div class="label-input">Effective Date To</div>
				                 		<div class="form-group has-feedback">
					               			<form:input type="text" id="mrcValidToDt" class="form-control input-xs input-calendar required" path="rateCard.mrcValidToDt" aria-describedby="inputSuccess2Status" />
					               			<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
				                  		</div> 
								    </div>
								</div>
								 <div class="row">
									<div class="col-xs-3">
										<div class="label-input">Transport</div>
										<form:select class="form-control input-xs space-input required" id="rateCardTransMode" path="rateCard.mrcTransMode" onchange="fullloosechange()">
									        <form:option value="">--select--</form:option>
											<form:option value="ALL">ALL</form:option>
											<form:option value="AIR">AIR</form:option>
											<form:option value="SEA">SEA</form:option>
											<form:option value="ROAD">ROAD</form:option>
										</form:select>
									</div>
									<div class="col-xs-3">
										<div class="label-input">Ship Unit</div>
										<form:select class="form-control input-xs space-input required" id="rateCardEntryCode" path="rateCard.entryType" onchange="fullloosechange()">
											 <form:option value="">--select--</form:option>
											 <form:option value="BOX">Pallet/Box/Crates</form:option>
											<form:option value="CONTAINER">Container</form:option>
											<form:option value="TRUCK">Full Truck Load</form:option>
										</form:select>
									</div>
									<div class="col-xs-3">
										<div id="countryCodeFromDiv" class="label-input"> 
											Country From
											<a href="#countryCodeFrom" role="button" data-toggle="modal">
											<span class="fa fa-search"></span></a>
										</div>
										<form:select path="rateCard.mrcCtryFr" id="TMmstCountryByMshpCountryFromCd" class="form-control input-xs space-input" onchange="countryFromChange()">
											<form:option value="">--select--</form:option>
											<c:forEach var="rec" items="${countryList}" >
												<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<div class="col-xs-3">
										<div id="countryCodeToDiv" class="label-input"> 
											Country To
											<a href="#countryCodeTo" role="button" data-toggle="modal">
											<span class="fa fa-search"></span></a>
										</div>
										<form:select path="rateCard.mrcCtryTo" id="TMmstCountryByMshpCountryToCd" class="form-control input-xs space-input" onchange="countryToChange()">
											<form:option value="">--select--</form:option>
											<c:forEach var="rec" items="${countryList}" >
												<form:option value="${rec.mmstCountryCode}">${rec.mmstCountryDesc}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-3">
										<div class="label-input">Currency</div>
										<input type="hidden" name="rateCardCCY" id="rateCardCCY" value="${rateCardBean.rateCard.mrcChgCur}"/>
										<form:select class="form-control input-xs space-input required" path="rateCard.mrcChgCur" id="Currency">
											 <form:option value="">--select--</form:option>
											<c:forEach var="currency" items="${currencyList }">														   
												<form:option selected="${currency.mmstCurrLocalCcy}" value="${currency.mmstCurrDesc}">${currency.mmstCurrDesc}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<div class="col-xs-3">
										<div class="label-input">Service Type</div>
										<form:select class="form-control input-xs space-input required" id="rateCardServiceCd" path="rateCard.mrcServiceCd" onchange="shipunitchange()">
									        <form:option value="">--select--</form:option>
											<form:option value="FREIGHT">FREIGHT</form:option>
											<form:option value="INS">INSURANCE</form:option>
											<form:option value="INSLCH">LCH INSURANCE</form:option>	
											<form:option value="ASPERINDO">ASPERINDO</form:option>											
										</form:select>
									</div>
									<div class="col-xs-3">
										<div class="label-input">Port From
										</div>
										<form:input type="text" id="TMmstPortByMshpPortFromDesc" class="form-control input-xs space-input-pointer" path="locationFrom" />
										<form:input type="hidden" id="TMmstPortByMshpPortFromCd" path="rateCard.mrcLocFr" />
									</div>
									<div class="col-xs-3">
										<div class="label-input">Port To
										</div>
										<form:input type="text" id="TMmstPortByMshpPortToDesc" class="form-control input-xs space-input-pointer" path="locationTo" />
										<form:input type="hidden" id="TMmstPortByMshpPortToCd" path="rateCard.mrcLocTo" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-3">
										<div class="label-input">Min Weight (KG)
										</div>
										<form:input type="text" id="mrcChgMinKg" class="form-control input-xs space-input-pointer" path="rateCard.mrcChgMinKg" />
									</div>
									
								</div>
									
								
								
	<div class="row">
		<div class="col-xs-12">
			<div class="title-sub">
				<h2>Sub Service</h2>
				<div id="addButtonDisplay">
					<button type="button" id="pallet" class="btn btn-blue-green02 input-xs" onclick="addRowForRateCard()">
						<span class="fa fa-plus-circle"></span> Add Sub Service
						
					</button>
					<button type="button" id="containter" class="btn btn-blue-green02 input-xs" onclick="addRowForRateCardCntr()">
						<span class="fa fa-plus-circle"></span> Add Sub Service
						
					</button>
					<button type="button" id="aspFTL" class="btn btn-blue-green02 input-xs" onclick="addRowForRateCardAspFTL()">
						<span class="fa fa-plus-circle"></span> Add Sub Service
						
					</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		var optionsSubChargeDropList = "";
		<c:forEach var="rec" items="${subChargeTypeDropList}">optionsSubChargeDropList += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>
		
		var optionsSubChargeDropListCntr = "";
		<c:forEach var="rec" items="${subChargeTypeDropListCntr}">optionsSubChargeDropListCntr += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>

		var optionsSubChargeMethodDropList = "";
		<c:forEach var="rec" items="${subChargeMethodDropList}">optionsSubChargeMethodDropList += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>

		var optionsSubChargeUnitDropList = "";
		<c:forEach var="rec" items="${subChargeUnitDropList}">optionsSubChargeUnitDropList += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>
		var subChargeUnitDropListCntr = "";
		<c:forEach var="rec" items="${subChargeUnitDropListCntr}">subChargeUnitDropListCntr += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>
		
		var subChargeUnitAspTruckTypeList = "";
		<c:forEach var="rec" items="${subChargeUnitAspTruckTypeList}">subChargeUnitAspTruckTypeList += "<option value='${rec.key}'>${rec.value}</option>";
		</c:forEach>
	</script>
	<!-- Select Units -->
	<!-- Row 1 -->
	<div class="row">

			<!-- Row 2 -->
			<div class="col-xs-12 ">
				<!-- Table Listing -->
				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action" id="subChargeTable">
						<thead>
							<tr class="headings">
								<th class="column-title col-xs-3">Sub Service Type</th>
								<th class="column-title col-xs-3">Charge Method</th>
								<th class="column-title col-xs-3">Charge Unit</th>
								<th class="column-title col-xs-2">Min. Charge Amount</th>
								<th class="column-title col-xs-1">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${fn:length(rateCardBean.rateCardScList) > 0 }">
								<c:forEach var="rec" items="${rateCardBean.rateCardScList}" varStatus="loop">
								
									<tr>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[${loop.index}].mrcsSubchargeTypeCd">
												<c:forEach var="recdl" items="${subChargeTypeDropList}">
													<form:option value="${recdl.key}">${recdl.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[${loop.index}].mrcsChgMethod">
												<c:forEach var="recdl" items="${subChargeMethodDropList}">
													<form:option value="${recdl.key}">${recdl.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[${loop.index}].mrcsChgUnit">
												<c:forEach var="recdl" items="${subChargeUnitDropList}">
													<form:option value="${recdl.key}">${recdl.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number" path="rateCardScList[${loop.index}].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScList[${loop.index}].reference' value="${loop.index}"/>
											<c:if test="${loop.index > 0 }">
											 	<a class='editor_remove' role='button'><i class='fa fa-trash fa-2x'></i></a>
											</c:if>
										</td>
									</tr>
									
									<c:if test="${fn:length(rec.TMpRatecardScDets) > 0 }">
										<tr class="subjspGeneratedwithData">
											<td>
											<div class="subSubService">
												<div class="col-xs-1">
												</div>
												<div class="col-xs-11">
													<div class="title-sub">
														<h2>Tier Sub Service</h2>
														<div id="addButtonDisplay">
															<button type="button" class="btn btn-blue-green02 input-xs" onclick="addRowForRateCardDet(${loop.index})">
																<span class="fa fa-plus-circle"></span> Add
															</button>
														</div>
													</div>
													<table id="subChargeDetailTable${loop.index}" class="table table-striped jambo_table bulk_action dataTable no-footer">
													    <thead>
															<tr class="headings">
																<th class="column-title col-xs-4">Charge From</th>
																<th class="column-title col-xs-4">Charge To</th>
																<th class="column-title col-xs-3">Charge Unit Amount</th>
																<th class="column-title col-xs-1">Action</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="recChild" items="${rec.TMpRatecardScDets}" varStatus="loopChild">
																<tr>
																	<td><form:input type="text" class="form-control input-xs space-input number" path="rateCardScDetList[${count}].mrscdChgUnitQtyFr" value="${recChild.mrscdChgUnitQtyFr}"/></td>
																	<td><form:input type="text" class="form-control input-xs space-input number" path="rateCardScDetList[${count}].mrscdChgUnitQtyTo" value="${recChild.mrscdChgUnitQtyTo}"/></td>
																	<td><form:input type="text" class="form-control input-xs space-input number" path="rateCardScDetList[${count}].mrscdChgUnitAmt" value="${recChild.mrscdChgUnitAmt}"/></td>
																	<td>
																		<form:input type='hidden' path='rateCardScDetList[${count}].reference' value="${loop.index}"/>
																		<c:if test="${loopChild.index > 0 }">
																		 	<a class='editor_remove' role='button'><i class='fa fa-trash fa-2x'></i></a>
																		</c:if>
																	</td>
																</tr>
																<c:set var="count" value="${count + 1}" scope="page"/>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="jspGenerated">
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[0].mrcsSubchargeTypeCd">
												<c:forEach var="rec" items="${subChargeTypeDropList}">
													<form:option value="${rec.key}">${rec.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[0].mrcsChgMethod">
												<c:forEach var="rec" items="${subChargeMethodDropList}">
													<form:option value="${rec.key}">${rec.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScList[0].mrcsChgUnit">
												<c:forEach var="rec" items="${subChargeUnitDropList}">
													<form:option value="${rec.key}">${rec.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number" path="rateCardScList[0].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScList[0].reference' value="0"/>
										</td>
								</tr>
								<tr class="subjspGenerated">
										<td>
											NULL
										</td>
										<td>
											NULL
										</td>
										<td>
											NULL
										</td>
										<td>
											NULL
										</td>
										<td>
											NULL
										</td>
								</tr>				
							</c:otherwise>
							</c:choose>
						</tbody>
						
					</table>
					<table class="table table-striped jambo_table bulk_action" id="subChargeTableCntr">
						<thead>
							<tr class="headings">
								<th class="column-title col-xs-3">Sub Service Type</th>								
								<th class="column-title col-xs-3">Charge Unit</th>
								<th class="column-title col-xs-2">Min. Charge Amount</th>
								<th class="column-title col-xs-1">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${fn:length(rateCardBean.rateCardScCntrList) > 0 }">
								<c:forEach var="rec" items="${rateCardBean.rateCardScCntrList}" varStatus="loop">
									<tr>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScCntrList[${loop.index}].mrcsSubchargeTypeCd">
												<c:forEach var="recdl" items="${subChargeTypeDropListCntr}">
													<form:option value="${recdl.key}">${recdl.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
									
										<td>
										<form:select class="form-control input-xs space-input required" path="rateCardScCntrList[${loop.index}].mrcsChgUnit">
												<c:forEach var="recd" items="${subChargeUnitDropListCntr}">
													<form:option value="${recd.key}">${recd.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number" path="rateCardScCntrList[${loop.index}].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScCntrList[${loop.index}].reference' value="${loop.index}"/>
											<c:if test="${loop.index > 0 }">
											 	<a class='editor_remove' role='button'><i class='fa fa-trash fa-2x'></i></a>
											</c:if>
										</td>
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="jspGeneratedCntr">
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScCntrList[0].mrcsSubchargeTypeCd">
												<c:forEach var="rec" items="${subChargeTypeDropListCntr}">
													<form:option value="${rec.key}">${rec.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
									
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScCntrList[0].mrcsChgUnit">
												<c:forEach var="rec1" items="${subChargeUnitDropListCntr}">
													<form:option value="${rec1.key}">${rec1.value}</form:option>
												</c:forEach>
											</form:select>
											
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number mrcsChgMinAmt" path="rateCardScCntrList[0].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScCntrList[0].reference' value="0"/>
										</td>
								</tr>
											
							</c:otherwise>
							</c:choose>
						</tbody>
						
					</table>
					
					<table class="table table-striped jambo_table bulk_action" id="subChargeTableAspFTL">
						<thead>
							<tr class="headings">
								<th class="column-title col-xs-3">Sub Service Type</th>								
								<th class="column-title col-xs-3">Charge Unit</th>
								<th class="column-title col-xs-2">Min. Charge Amount</th>
								<th class="column-title col-xs-1">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${fn:length(rateCardBean.rateCardScAspTruckList) > 0 }">
								<c:forEach var="rec" items="${rateCardBean.rateCardScAspTruckList}" varStatus="loop">
									<tr>
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScAspTruckList[${loop.index}].mrcsSubchargeTypeCd">
												<form:option value="FREIGHT">FREIGHT</form:option>
											</form:select>
										</td>
									
										<td>
										<form:select class="form-control input-xs space-input required" path="rateCardScAspTruckList[${loop.index}].mrcsChgUnit">
												<c:forEach var="recd" items="${subChargeUnitAspTruckTypeList}">
													<form:option value="${recd.key}">${recd.value}</form:option>
												</c:forEach>
											</form:select>
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number" path="rateCardScAspTruckList[${loop.index}].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScAspTruckList[${loop.index}].reference' value="${loop.index}"/>
											<c:if test="${loop.index > 0 }">
											 	<a class='editor_remove' role='button'><i class='fa fa-trash fa-2x'></i></a>
											</c:if>
										</td>
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr class="jspGeneratedCntr">
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScAspTruckList[0].mrcsSubchargeTypeCd">
												<form:option value="FREIGHT">FREIGHT</form:option>
											</form:select>
										</td>
									
										<td>
											<form:select class="form-control input-xs space-input required" path="rateCardScAspTruckList[0].mrcsChgUnit">
												<c:forEach var="rec1" items="${subChargeUnitAspTruckTypeList}">
													<form:option value="${rec1.key}">${rec1.value}</form:option>
												</c:forEach>
											</form:select>
											
										</td>
										<td>
											<form:input type="text" class="form-control input-xs space-input required number mrcsChgMinAmt" path="rateCardScAspTruckList[0].mrcsChgMinAmt" />
										</td>
										<td>
											<form:input type='hidden' path='rateCardScAspTruckList[0].reference' value="0"/>
										</td>
								</tr>
											
							</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- End Table Listing -->


				<!-- Select Units -->
				<!-- End Row 1 -->

			</div>
	

	</div>
								<!-- End row -->
							</div>
							<!-- End Action Button -->
						</div>
						<!-- End x panel -->
					</div>
					<!-- End col 12 -->
				</div>
				<!-- End row -->
				<!-- End Column Content Fullwidth -->
			</div>
		</div>
	</div>
	</div>
	<!-- End Content -->
	<%@ include file="../shipment/common/common_shipment_pickList.jspf"%>
	<!-- footer content -->
	<%@ include file="../marketplace/common/common_footer.jspf"%>
	<!-- /footer content -->
	</form:form>
</body>
</html>