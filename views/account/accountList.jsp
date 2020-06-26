<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>

<spring:url var="account_js"
	value="/resources/marketplace/app/js/accountList.js" />
<script src="${account_js}" type="text/javascript"></script>

<script type="text/javascript">
	var ctx = "${pageContext.request.contextPath}";
	var sAjaxSourceUrl = "<spring:url value='/account/accountListAjax' />";
	var detailsPageUrl = "${account_details_url}";
</script>

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
								<%@ include file="../account/common/common_account_left_sidemenu.jspf"%>
								<div class="col-xs-10">
									<div class="title-sub">
										<h2>Account List : <label class="control-label" id="statusDisplay" ></label>
										<%-- <form:form action="/COMarketPlace/account/adminRegister" method="GET" modelAttribute="accountBean" name="frm_account" id="frm_account">
										<button type="submit" class="btn btn-blue-green02 input-xs"><span class="fa fa-plus-circle"></span>Create Account</button>
										</form:form>--%>
										<button type="submit" class="btn btn-blue-green02 input-xs" onclick="window.location.href='/COMarketPlace/account/adminRegister'"><span class="fa fa-plus-circle"></span>Create Account</button>
										</h2>
									</div>
									<div class="x_content">
										<div class="table-responsive" style="overflow-x: hidden">
											<table class="table-hover table-striped table-condensed" id="dataTable">
												<thead></thead>
												<tbody></tbody>
												<tfoot>
													<tr>

														<th>
															<input type="text" alt="0" id="search_0" name="search_0"
															value="" class="form-control input-xs search_init" />
														</th>
														<th>
															<input type="text" alt="1" id="search_1" name="search_1"
															value="" class="form-control input-xs search_init" />
														</th>
														<th>
															<input type="text" alt="2" id="search_2" name="search_2"
															value="" class="form-control input-xs search_init" />
														</th>
														<th>
															<input type="text" alt="3" id="search_3" name="search_3"
															value="" class="form-control input-xs search_init" />
														</th>
														<th>
															<input type="text" alt="4" id="search_4" name="search_4"
															value="" class="form-control input-xs search_init" />
														</th>

													</tr>
												</tfoot>
											</table>
										</div>
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

	<!-- footer content -->
	<%@ include file="../marketplace/common/common_footer.jspf"%>
	<!-- /footer content -->
	<form:form id="vccform" name="vccform" method="post">
		<input type="hidden" name="statuscodes" id="statuscodes" value="" />
	</form:form>
</body>
</html>