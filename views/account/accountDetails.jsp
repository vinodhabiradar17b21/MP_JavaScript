<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>

<spring:message var="usrName" code="marketplace.label.acc.usr.name" />
<spring:message var="usrId" code="marketplace.label.acc.usr.id" />
<spring:message var="usrPwd" code="marketplace.label.acc.usr.pwd" />
<spring:message var="usrTel" code="marketplace.label.acc.usr.tel" />
<spring:message var="usrEmail" code="marketplace.label.acc.usr.email" />
<spring:message var="usrAvl" code="marketplace.label.acc.usr.avl" />
<spring:message var="usrUrgent" code="marketplace.label.acc.usr.urgent" />
<spring:message var="usrAction" code="marketplace.label.acc.usr.action" />

<spring:url var="account_js" value="/resources/marketplace/app/js/account.js" />
<script src="${account_js}" type="text/javascript"></script>
<spring:url var="account_validation_js" value="/resources/marketplace/app/js/account_validation.js" />
<script src="${account_validation_js}" type="text/javascript"></script>
<script>
var optionsDocumentType = "";
<c:forEach var="rec" items="${accountBean.fileCatList}">
optionsDocumentType += "<option value='${rec.mmstFilecatCode}'>${rec.mmstFilecatDesc}</option>";
</c:forEach>

var optionsBank = "";
<c:forEach var="brec" items="${accountBean.bankList}">
optionsBank += "<option value='${brec.bankId}'>${brec.bankDescription}</option>";
</c:forEach>

var optionsCcy = "";
<c:forEach var="ccy" items="${accountBean.ccyList}">
optionsCcy += "<option value='${ccy.ccyCode}'>${ccy.ccyCode}</option>";
</c:forEach>

var usrName = '${usrName}';
var usrId = '${usrId}';
var usrPwd = '${usrPwd}';
var usrTel = '${usrTel}';
var usrEmail = '${usrEmail}';
var usrAvl = '${usrAvl}';
var usrUrgent = '${usrUrgent}';
var usrAction = '${usrAction}';

</script>
</head>

<body>
	<script>
		var accnId = '${accountBean.tCoreAccn.accnId}';
		var register = ${register};
		var accountStatus = '${accountBean.tCoreAccn.accnStatus}';
		var promptMsg = '${promptMsg}';
	</script>
	
	<form:form id="vccCOMarketPlaceForm" action="${account_submit_url}"
		name="vccCOMarketPlaceForm" modelAttribute="accountBean" method="post" enctype="multipart/form-data">
		<!-- header content -->
		<%@ include file="../marketplace/common/common_header.jspf"%>
		<!-- /header content -->

		<!-- Content -->
		<div class="col-content">
			<div class="container-fluid">
			<!-- Column Content Fullwidth -->
			<div class="row">
				<div class="col-xs-12">
					<div class="x_panel">
						<div class="x_content">
							
			<!-- Action Button -->
			<div class="col-xs-12">
				<div class="col-action-btn">
					<c:if test="${register or disabled eq 'false' }">
					<div class="btn-group input-xs" role="group" aria-label="...">
						<c:choose>
						<c:when test="${register}">
						<form:button name="action" id="REGISTER" value="REGISTER" class="btn btn-action">
							<div class="fa fa-check-square-o"></div> <spring:message code="marketplace.label.action.register"/> 
						</form:button>
						</c:when>
						<c:otherwise>
						
						<c:choose>
						<c:when test="${accountBean.gettCoreAccn().getAccnStatus() eq 'N'.charAt(0) }">
						<form:button name="action" id="APPROVE" value="APPROVE" class="btn btn-action">
							<div class="fa fa-check-square-o"></div><spring:message code="marketplace.label.action.approve"/> 
						</form:button>
							
						<form:button name="action" id="REJECT" value="REJECT" class="btn btn-action">
							<div class="fa fa-close"></div><spring:message code="marketplace.label.action.reject"/> 
						</form:button>
						</c:when>
						<c:otherwise>
						<form:button name="action" id="UPDATE" value="UPDATE" class="btn btn-action">
							<div class="fa fa-check-square-o"></div> <spring:message code="marketplace.label.action.update"/>
						</form:button>
						</c:otherwise>
						</c:choose>
						
						</c:otherwise>
						</c:choose>
					
					</div>
					<div class="btn-group input-xs" role="group" aria-label="...">		
						<button id="exit"  class="btn btn-action" onclick="history.back();"> <div class="fa fa-close"></div><spring:message code="marketplace.label.action.exit"/></button>
					</div>
					</c:if>
				</div>
			</div>
			
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
				<li role="presentation"><a href="#docs" aria-controls="docs" role="tab" data-toggle="tab">Supporting Documents</a></li>
				<li role="presentation"><a href="#tncs" aria-controls="tncs" role="tab" data-toggle="tab">Terms & Conditions</a></li>				
				<li role="presentation"><a href="#users" aria-controls="users" role="tab" data-toggle="tab">Users</a></li>
				<c:choose>
                   <c:when test="${principal.accnRole=='ADMIN'}">
                   		<li role="presentation"><a href="#creditterm" aria-controls="creditterm" role="tab" data-toggle="tab">Credit Term</a></li>                   
                   </c:when>
                </c:choose>
			</ul>
			
			<div class="tab-content">

			<div role="tabpanel" class="tab-pane active" id="profile">
				<%@ include file="common/common_account_profile.jspf"%>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="docs">
				<%@ include file="common/common_account_supp_doc.jspf"%>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="tncs">
				<%@ include file="common/common_account_tnc.jspf"%>
			</div>

			<div role="tabpanel" class="tab-pane" id="users">
				<%@ include file="common/common_account_user.jspf"%>
			</div>
			
			<c:choose>
                   <c:when test="${principal.accnRole=='ADMIN'}">
                   <div role="tabpanel" class="tab-pane" id="creditterm">
						<%@ include file="common/common_account_creditterm.jspf"%>
					</div>
                   </c:when>
            </c:choose>
			
			
			</div>
			
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
		<!-- End Content -->

		<!-- footer content -->
		<%@ include file="../marketplace/common/common_footer.jspf"%>
		<!-- /footer content -->
	</form:form>
</body>
</html>