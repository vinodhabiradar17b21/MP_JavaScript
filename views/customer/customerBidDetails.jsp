<div class="well">
	<div class="row">
		<div class="col-xs-12">
			<div class="title-sub">
				<h2><spring:message code="marketplace.label.shipment.quotationAccepted" 
				arguments="${shipmentBean.workflowDetail.mswfQuotRefNo}, ${shipmentBean.workflowDetail.TCoreAccn.accnName}"/>
				<c:if test="${fn:length(shipmentBean.spUrgentContact) > 0 }">
				&nbsp;
				<a data-toggle="popover" rel="popover" data-placement="right" title="Urgent Contact" 
				data-content="${shipmentBean.spUrgentContact}">
				<i class="step fi-telephone" ></i>
				</a>
				</c:if>
				</h2>
			</div>
		</div>
	</div>
	<input type="hidden" name="hiddenQuotSubAmount" id="hiddenQuotSubAmount" value="${shipmentBean.selectedQuotation.mquotSubAmt}"/>
	<input type="hidden" name="hiddenQuotTaxRate" id="hiddenQuotTaxRate" value="${shipmentBean.selectedQuotation.mquotTaxRate}"/>
	<input type="hidden" name="hiddenQuotTotalAmount" id="hiddenQuotTotalAmount" value="${shipmentBean.selectedQuotation.mquotAmt}"/>
	<input type="hidden" name="hiddenQuotTotalCurrency" id="hiddenQuotTotalCurrency"/>
	<input type="hidden" name="hiddenAdditionalChargeAmount" id="hiddenAdditionalChargeAmount" value="${shipmentBean.additionalChargeService.msservAmt}"/>
	<div class="table-responsive">
		<table class="table table-striped" id="quotationTable">
			<thead>
				<tr class="headings">
					<th class="column-title col-xs-3"><spring:message code="marketplace.label.shipment.serviceType"/></th>
					<th class="column-title col-xs-3 column-money"><spring:message code="marketplace.label.shipment.quotation"/></th>
					<th class="column-title col-xs-7"><spring:message code="marketplace.label.shipment.remarks"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rec" items="${shipmentBean.acceptedtMshipServices}">
					<tr>
						<td>${rec.TMmstService.mmstServiceDesc}</td>
						<td class="column-money">
							<div class="row-vcc">
								<div class="col-xs-vcc-9 money" id="quotAmountCalc">
									${rec.msservAmt}
								</div>
								<div class="col-xs-vcc-3" id="quotCurr">
									${rec.msservCurrency}
								</div>
							</div>
											
						</td>
						<td>${rec.msservRemark}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<div class="input-xs space-input" style="text-align: right;">
							<strong><spring:message code="marketplace.label.shipment.subTotal"/></strong>
						</div>
					</td>
					<td class="column-money">
						<div class="row-vcc">
							<div class="col-xs-vcc-9 money" id="summaryQuotSubAmt">
								<label class="control-label" id="quotSubAmount"></label>
							</div>
							<div class="col-xs-vcc-3">
								<div id="quotSubAmtCurrency"></div>
							</div>	
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<div class="input-xs space-input" style="text-align: right;">
							<strong><spring:message code="marketplace.label.shipment.taxRate"/></strong>
						</div>
					</td>
					<td class="column-money">
						<div class="row-vcc">
							<div class="col-xs-vcc-9 money" id="summaryQuotTaxRate">
								<label class="control-label" id="quotTaxRate"></label>
							</div>
							<div class="col-xs-vcc-3">&nbsp;</div>	
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<div class="input-xs space-input" style="text-align: right;">
							<strong><spring:message code="marketplace.label.shipment.total"/></strong>
						</div>
					</td>
					<td class="column-money">
						<div class="row-vcc">
							<div class="col-xs-vcc-9 money" id="summaryQuotAmt">
								<label class="control-label" id="quotTotalAmount"></label>
							</div>
							<div class="col-xs-vcc-3">
								<div id="quotTotalCurrency"></div>
							</div>	
						</div>
					</td>
					<td></td>
				</tr>
				<c:if test="${(shipmentBean.shpServicePackage == 'FREIGHT'||shipmentBean.shpServicePackage == 'MULTI' ||shipmentBean.shpServicePackage == 'ASPERINDO') && not empty shipmentBean.workflowDetail.mswfCancellationCharge}">
				<tr>
						<td>
						<div class="input-xs space-input" style="text-align: right;">
						<strong>Cancellation Charges :</strong></td>
						</div>
						<td class="column-money">
							<div class="row-vcc">
								<div class="col-xs-vcc-9 money">								
								<fmt:formatNumber  type="number"  minFractionDigits="2" value = "${shipmentBean.workflowDetail.mswfCancellationCharge}" />	
								</div>
								<div class="col-xs-vcc-3" >
									${shipmentBean.workflowDetail.mswfCancellationChargeCurrency}
								</div>
							</div>
											
						</td>
						<td> </td>
					</tr>
					</c:if>
			</tfoot>
		</table>
	</div>


</div>
