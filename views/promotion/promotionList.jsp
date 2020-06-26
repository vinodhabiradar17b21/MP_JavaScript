<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="../marketplace/common/common_source.jspf"%>
<spring:message var="promoCode" code="marketplace.label.promotion.code" />
<spring:message var="promoName" code="marketplace.label.promotion.name" />
<spring:message var="promoDesc" code="marketplace.label.promotion.description" />
<spring:message var="promoFrom" code="marketplace.label.promotion.from" />
<spring:message var="promoTo" code="marketplace.label.promotion.to" />
<spring:message var="promoValidFr" code="marketplace.label.promotion.validFrom" />
<spring:message var="promoValidTo" code="marketplace.label.promotion.validTo" />
<spring:url var="updatePromotion_js" value="/resources/marketplace/app/js/updatePromotion.js" />
<script src="${updatePromotion_js}" type="text/javascript"></script>
<spring:url var="promotionList_js" value="/resources/marketplace/app/js/promotionList.js" />
<script src="${promotionList_js}" type="text/javascript"></script>

<script type="text/javascript">
	var ctx = "${pageContext.request.contextPath}";
	var sAjaxSourceUrl = "<spring:url value='/promotion/promotionListAjax' />";
	var accountRole = "${principal.accnRole}";
	var detailsURL = "${pageContext.request.contextPath}/promotion/updatePromotion?promoCode";
	var promptMsg = '${promptMsg}';
</script>
</head>

<body>
	<!-- header content -->
	<%@ include file="../marketplace/common/common_header.jspf"%>
	<!-- /header content -->
	<div class="col-content">
		<div class="container-fluid">
			<!-- Content -->
			<%pageContext.setAttribute("datatable_col_width",
						new String[]
								{ "\"sTitle\": \""+ pageContext.getAttribute("promoCode") +"\", \"sWidth\":\"5%\", \"mData\": \"prmfCode\",\"sClass\":\"showdetail\"", 
								"\"sTitle\": \""+ pageContext.getAttribute("promoName") +"\",  \"sWidth\":\"5%\", \"mData\": \"prmfName\",\"sClass\":\"showdetail\"",
								"\"sTitle\": \""+ pageContext.getAttribute("promoDesc") +"\", \"sWidth\":\"5%\", \"mData\": \"prmfDesc\",\"sClass\":\"showdetail\"",
								"\"sTitle\": \""+ pageContext.getAttribute("promoFrom") +"\",  \"sWidth\":\"5%\", \"mData\": \"prmfLocFr\",\"sClass\":\"showdetail\"",
								"\"sTitle\": \""+ pageContext.getAttribute("promoTo") +"\", \"sWidth\":\"5%\", \"mData\": \"prmfLocTo\",\"sClass\":\"showdetail\"",
								"\"sTitle\": \""+ pageContext.getAttribute("promoValidFr") +"\", \"sWidth\":\"5%\", \"mData\": \"prmfValidFr\", \"sClass\":\"table-column-align-center showdetail\"",
								"\"sTitle\": \""+ pageContext.getAttribute("promoValidTo") +"\", \"sWidth\":\"5%\", \"mData\": \"prmfValidTo\", \"sClass\":\"table-column-align-center showdetail\"",
								"\"sTitle\": \"\", \"sWidth\":\"5%\", \"mData\": null, \"sDefaultContent\": \"<a href='' class='editor_remove'><i class='fa fa-trash fa-2x'></i></a><a href='' class='btn-action' role='button' data-toggle='modal' data-target='#myModalPromoUpdate' ><i class='fa fa-floppy-o' ></i></a>\""},
						pageContext.PAGE_SCOPE);
			%>
			<script type="text/javascript">
        		var aoColumns = [<c:forEach var="colwidth" items="${datatable_col_width}" varStatus="i">{${colwidth}}<c:if test="${!i.last}">,</c:if></c:forEach>];
        	</script>
			<div class="row">
				<div class="col-xs-12">
					<!-- Column Content Fullwidth -->
					<div class="row">
						<div class="col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<div class="title-sub">
										<h2><spring:message code="marketplace.label.promotion.list"/> : <label class="control-label" id="statusDisplay" ></label>
										<div style="float: right;">
											<button type="button" class="btn btn-blue-green02 input-xs" id="button2" onclick="onCreatePromoClick()">
												<span class="fa fa-plus-circle"></span>
												<spring:message code="marketplace.label.action.add" />
											</button>
										</div>
										</h2>
									</div>
									<div class="x_content">
										<div>
											<table class="table-striped table-condensed" id="dataTable">
												<thead> </thead>
												<tbody> </tbody>
												<tfoot>
													<tr>
														<c:forEach var="aoCol" items="${datatable_col_width}" varStatus="i">
															<th><input type="text" alt="${i.index}" id="search_${i.index}" name="search_${i.index}" value="" class="form-control input-xs search_init" /></th>
														</c:forEach>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
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
	<form:form id="promoUpdateForm" action="${promotion_update_url}" name="promoCreateForm" modelAttribute="promotionBean" method="post" enctype="multipart/form-data">
	<!-- Pop Up : Small 03 -->
	<div class="col-xs-12">
	<div class="modal fade bs-example-modal-sm" id="myModalPromoUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<spring:message code="marketplace.label.shipment.promoDetails" />
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-6">
							<div class="label-input"><spring:message code="marketplace.label.promotion.name"/></div>
							<form:input type="hidden"  path="tMpPromoFrt.prmfCode" id="prmfCode"/>
							<form:input type="hidden"  path="tMpPromoFrt.prmfImageName" id="prmfImageName"/>
							<form:input type="hidden"  path="tMpPromoFrt.prmfImage" id="prmfImage" />
							<form:input type="hidden"  path="tMpPromoFrt.prmfAccnid" id="prmfAccnid"/>
							<form:input type="hidden"  path="tMpPromoFrt.prmfCreatedBy" id="prmfCreatedBy"/>
							<form:input type="text" class="form-control input-xs space-input required" placeholder="Promotion Name" required="true" name="prmfName" path="tMpPromoFrt.prmfName" id="prmfName" maxlength="256" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="label-input"><spring:message code="marketplace.label.promotion.description"/></div>
							<form:input type="text" class="form-control input-xs space-input required" placeholder="Description" required="true" name="prmfName" path="tMpPromoFrt.prmfDesc" id="prmfDesc" maxlength="2048" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-8">
							<div class="label-input"><spring:message code="marketplace.label.promotion.image"/></div>
							<form:input type="file" id="attUpdateFile" path="tMpPromoFrt.attFile"  class="form-control input-xs space-input" />(JPG File, Max size : 64*1024)
							<a target='_blank' id="imageDownload"><div id="imageName"></div></a>				
						</div>
					</div> 
					<div class="row">
						<div class="col-xs-6">
							<div class="label-input"><spring:message code="marketplace.label.promotion.from"/></div>
							<form:input type="text" class="form-control input-xs space-input required" placeholder="Port/Location From" required="true" path="tMpPromoFrt.prmfLocFr" id="prmfLocFr" maxlength="50" />
						</div>
						<div class="col-xs-6">
							<div class="label-input"><spring:message code="marketplace.label.promotion.to"/></div>
							<form:input type="text" class="form-control input-xs space-input required" placeholder="Port/Location To" required="true" path="tMpPromoFrt.prmfLocTo" id="prmfLocTo" maxlength="50" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="label-input"><spring:message code="marketplace.label.promotion.validFrom"/></div>
							<div class="form-group has-feedback">
								<form:input type="text" id="prmfValidFr" class="form-control input-xs input-calendar required" name ="prmfValidFr" path ="tMpPromoFrt.prmfValidFr" aria-describedby="inputSuccess2Status"  />
								<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
							</div> 
						</div>
						<div class="col-xs-6">
							<div class="label-input"><spring:message code="marketplace.label.promotion.validTo"/></div>
							<div class="form-group has-feedback">
							<form:input type="text" id="prmfValidTo" class="form-control input-xs input-calendar required" path="tMpPromoFrt.prmfValidTo" name="prmfValidTo" aria-describedby="inputSuccess2Status" />
							<span class="fa fa-calendar form-control-calendar" aria-hidden="true"></span>
						</div>
					</div>
					</div>
					<div class="row">
					</div>
					<br/>
				</div>
				<div class="modal-footer">
					<div class="col-search-btn-LAAS">
						<div class="btn-group input-xs" role="group" aria-label="...">
							<form:button name="action" id="CUS_SUBMIT_SCHEDULE" value="CUS_SUBMIT_SCHEDULE" class="btn btn-action-footer">
								<div class="fa fa-upload"></div>
								<spring:message code="marketplace.label.action.submit" />
							</form:button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- End Pop Up : Small 03 -->
	</form:form>
	<div class="col-xs-12"></div>
	<%@ include file="create.jspf"%>
	<!-- footer content -->
	<%@ include file="../marketplace/common/common_footer.jspf"%>
	<!-- /footer content -->
</body>
</html>