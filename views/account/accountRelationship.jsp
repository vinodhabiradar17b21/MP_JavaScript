<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%-- include common codes for html header --%>
<%@ include file="../marketplace/common/common_source.jspf"%>

</head>

<body>
	<script> 
		var promptMsg = '${promptMsg}';
	</script>
	<form:form id="accnRelationshipForm" action="${account_relationship_save_url}"
		name="accnRelationshipForm" modelAttribute="accountBean" method="post" enctype="multipart/form-data">
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
					<div class="btn-group input-xs" role="group" aria-label="...">
						<button id="saveAccnRelationship" class="btn btn-action" onclick="formSelectedBeforeSubmit()">
							<div class="fa fa-check"></div> Save
						</button>
					</div>
					
				</div>
			</div>
			
			<!-- Nav tabs -->
			<!-- <ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
			<li role="presentation"><a href="#docs" aria-controls="docs" role="tab" data-toggle="tab">Supporting Documents</a></li>
			<li role="presentation"><a href="#users" aria-controls="users" role="tab" data-toggle="tab">Users</a></li>
			</ul>
			
			<div class="tab-content">

			<div role="tabpanel" class="tab-pane active" id="profile">
			<div class="tab_content"> -->
			
			<div class="row">

			<div class="col-xs-12">
			<div class="title-sub"><h2>Connections</h2></div>
			</div>
			<div class="row">
			<div class="col-xs-12">
			<%-- <div class="col-xs-4">

			<div class="label-input">Co. Initial (3 character)</div> 
			<form:input type="text" class="form-control input-xs space-input" path="tCoreAccn.accnId" readonly="true"/>

			<div class="label-input">Account Type</div> 
			<form:input type="text" class="form-control input-xs space-input" path="tCoreAccn.TMstAccnType.atypDescription" readonly="true"/>
			
			<div class="label-input">Company Name</div> 
			<form:input type="text" class="form-control input-xs space-input" path="tCoreAccn.accnName" readonly="true"/>
			</div> --%>
			
			<!-- <div class="col-xs-8"> -->
				<div class="row">
				<div class="col-xs-12">
				<%-- <c:if test="${principal.accnRole=='CUS' }">
				<div class="col-xs-3">
					<h6>Available Forwarders</h6>
					<select id="columns_sel1" multiple="multiple" style="width: 200px; height: 300px">
						<c:forEach items="${availableList}" var="accn" >                  
					        <option value="${accn.accnId}">
					            ${accn.accnName}
					        </option>                    
					    </c:forEach>
					<select>
				</div>
				<div class="col-xs-1" style="margin-left: 30px; margin-right: 30px; height: 250px; width: 8%;">
					<div style="height: 100%; vertical-align: middle; padding-top: 80px">
						<input type="button" style="width: 100%" class="btn btn-mini" id="copyButt" value=" &gt; " /><br /><br />
						<input type="button" style="width: 100%" class="btn btn-mini" id="copyAllButt" value=" &gt;&gt; " /><br /><br />
						<input type="button" style="width: 100%" class="btn btn-mini" id="removeButt" value=" &lt; " /><br /><br />
						<input type="button" style="width: 100%" class="btn btn-mini" id="removeAllButt" value=" &lt;&lt; " /><br />
					</div>
				</div>
				</c:if> --%>
				<%-- <div class="col-xs-3">
					<h6>Pending Request</h6>
					<select id="columns_sel2" multiple="multiple" style="width: 200px; height: 300px" name="pendingAccns">
						<c:forEach items="${pendingList}" var="pendingaccn" >                  
					        <option value="${pendingaccn.accnId}">
					            ${pendingaccn.accnName}
					        </option>                    
					    </c:forEach>
					<select>
				</div> --%>
				<%-- <div class="col-xs-1" style="margin-left: 30px; margin-right: 30px; height: 250px; width: 8%;">
					<div style="height: 100%; vertical-align: middle; padding-top: 80px">
						<c:if test="${principal.accnRole == 'FWD' || principal.accnRole == 'INS'}">
						<input type="button" style="width: 100%" class="btn btn-mini" id="connButt" value=" &gt; " /><br /><br />
						<input type="button" style="width: 100%" class="btn btn-mini" id="connAllButt" value=" &gt;&gt; " /><br /><br />
						</c:if>
						<c:if test="${principal.accnRole == 'CUS'}">
						<input type="button" style="width: 100%" class="btn btn-mini" id="disconnButt" value=" &lt; " /><br /><br />
						<input type="button" style="width: 100%" class="btn btn-mini" id="disconnAllButt" value=" &lt;&lt; " /><br />
						</c:if>
					</div>
				</div> --%>
				<div class="col-xs-4">
					<div class="label-input">Allowed</div>
					<form:select id="columns_sel3" multiple="multiple" class="form-control input-xs space-input"
					 style="width: 200px; height: 300px" path="connectedAccns">
					<%-- <form:select id="columns_sel2" multiple="multiple" style="width: 200px; height: 300px" path="selectedAccns"> --%>
						<c:forEach items="${connectedList}" var="connecetedaccn" >                  
					        <form:option value="${connecetedaccn.accnId}">
					            ${connecetedaccn.accnName}
					        </form:option>                   
					    </c:forEach>
					</form:select>
					<input type="hidden" name="manageAccnType" value="${manageAccnType}"/>
				</div>
				
				<%-- <c:if test="${principal.accnRole == 'FWD' || principal.accnRole == 'INS'}"> --%>
				<div class="col-xs-4" style="margin-left: 30px; margin-right: 30px; height: 250px; width: 8%;">
					<div style="height: 100%; vertical-align: middle; padding-top: 80px">
						<button type="button" class="btn btn-blue-green input-xs" style="margin-top: 28px; width: 100%;" id="blacklistButt" ><span class="fa fa-angle-right"></span></button>
						<button type="button" class="btn btn-blue-green input-xs" style="margin-top: 28px; width: 100%;" id="blacklistAllButt" > <span class="fa fa-angle-double-right"></span></button>
						<button type="button" class="btn btn-blue-green input-xs" style="margin-top: 28px; width: 100%;" id="whitelistButt" > <span class="fa fa-angle-left"></span></button>
						<button type="button" class="btn btn-blue-green input-xs" style="margin-top: 28px; width: 100%;" id="whitelistAllButt" > <span class="fa fa-angle-double-left"></span></button>
					</div>
				</div>
				<div class="col-xs-4">
					<h6>Block</h6>
					<form:select id="columns_sel4" multiple="multiple" class="form-control input-xs space-input" 
					style="width: 200px; height: 300px" path="blacklistAccns">
						<c:forEach items="${blackList}" var="blacklistaccn" >                  
					        <form:option value="${blacklistaccn.accnId}">
					            ${blacklistaccn.accnName}
					        </form:option>                   
					    </c:forEach>
					</form:select>
				</div>
				</div>
				<%-- </c:if> --%>
				
				</div>
				</div>
			<!-- </div> -->
			</div>
			</div>
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
		<script>
		var colArray = new Array();
		
		$(document).ready(function(){
			
			//$('#copyButt').bind('click', copySelected);
			//$('#removeButt').bind('click', removeSelected);
			//$('#connButt').bind('click', connSelected);
			//$('#disconnButt').bind('click', disconnSelected);
			$('#blacklistButt').bind('click', blacklistSelected);
			$('#whitelistButt').bind('click', whitelistSelected);
			
			//$('#columns_sel1 option').bind('dblclick', copySelected);
			//$('#columns_sel2 option').bind('dblclick', removeSelected);
			//$('#columns_sel3 option').bind('dblclick', disconnSelected);
			//$('#columns_sel4 option').bind('dblclick', whitelistSelected);
			
			//$('#copyAllButt').bind('click', copyAll);
			//$('#connAllButt').bind('click', connAll);
			//$('#removeAllButt').bind('click', removeAll);
			//$('#disconnAllButt').bind('click', disconnAll);
			$('#blacklistAllButt').bind('click', blacklistAll);
			$('#whitelistAllButt').bind('click', whitelistAll);
			
		})
	
		//copy to pending request
		function copySelected() {
			var sel1 = document.getElementById('columns_sel1');
			var sel2 = document.getElementById('columns_sel2');
			var i, insertIdx = sel2.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel2.options.length;
			}
			for(i=0; i<sel1.options.length;) {
				var opt = sel1.options[i];
				 if(opt.selected) {
					opt.selected = false;
					sel2.options.add(opt, insertIdx);
					sel2.options[insertIdx].selected=true;
					insertIdx++;
					continue;
				}
				i++;
			}
		}
		
		//remove from pending request
		function removeSelected() {
			var sel1 = document.getElementById('columns_sel1');
			var sel2 = document.getElementById('columns_sel2');
			var i, insertIdx = sel1.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel1.options.length;
			}
			for(i=0; i<sel2.options.length;) {
				var opt = sel2.options[i];
				if(opt.selected) {
					opt.selected = false;
					sel1.options.add(opt, insertIdx++);
					continue;
				}
				i++;
			}
		}
		
		//approve pending request
		function connSelected() {
			var sel2 = document.getElementById('columns_sel2');
			var sel3 = document.getElementById('columns_sel3');
			var i, insertIdx = sel3.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel3.options.length;
			}
			for(i=0; i<sel2.options.length;) {
				var opt = sel2.options[i];
				 if(opt.selected) {
					opt.selected = false;
					sel3.options.add(opt, insertIdx);
					sel3.options[insertIdx].selected=true;
					insertIdx++;
					continue;
				}
				i++;
			}
		}
		
		//remove from connected to available list
		function disconnSelected() {
			var sel1 = document.getElementById('columns_sel1');
			var sel3 = document.getElementById('columns_sel3');
			var i, insertIdx = sel1.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel1.options.length;
			}
			for(i=0; i<sel3.options.length;) {
				var opt = sel3.options[i];
				if(opt.selected) {
					opt.selected = false;
					sel1.options.add(opt, insertIdx++);
					continue;
				}
				i++;
			}
		}
		
		//blacklist from connected list
		function blacklistSelected() {
			var sel3 = document.getElementById('columns_sel3');
			var sel4 = document.getElementById('columns_sel4');
			var i, insertIdx = sel4.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel4.options.length;
			}
			for(i=0; i<sel3.options.length;) {
				var opt = sel3.options[i];
				 if(opt.selected) {
					opt.selected = false;
					sel4.options.add(opt, insertIdx);
					sel4.options[insertIdx].selected=true;
					insertIdx++;
					continue;
				}
				i++;
			}
		}
		
		//move from blacklist to connected list
		function whitelistSelected() {
			var sel3 = document.getElementById('columns_sel3');
			var sel4 = document.getElementById('columns_sel4');
			var i, insertIdx = sel3.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel3.options.length;
			}
			for(i=0; i<sel4.options.length;) {
				var opt = sel4.options[i];
				if(opt.selected) {
					opt.selected = false;
					sel3.options.add(opt, insertIdx++);
					continue;
				}
				i++;
			}
		}
		
		function copyAll(){
			var sel1 = document.getElementById('columns_sel1');
			var sel2 = document.getElementById('columns_sel2');
			var i, insertIdx = sel2.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel2.options.length;
			}
			for(i=0; i<sel1.options.length;) {
				var opt = sel1.options[i];
				opt.selected = false;
				sel2.options.add(opt, insertIdx++);
			}
		}
		
		function removeAll(){
			var sel1 = document.getElementById('columns_sel1');
			var sel2 = document.getElementById('columns_sel2');
			var i, insertIdx = sel1.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel1.options.length;
			}
			for(i=0; i<sel2.options.length;) {
				var opt = sel2.options[i];
				opt.selected = false;
				sel1.options.add(opt, insertIdx++);
			}
		}
		
		function connAll(){
			var sel2 = document.getElementById('columns_sel2');
			var sel3 = document.getElementById('columns_sel3');
			var i, insertIdx = sel3.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel3.options.length;
			}
			for(i=0; i<sel2.options.length;) {
				var opt = sel2.options[i];
				opt.selected = false;
				sel3.options.add(opt, insertIdx++);
			}
		}
		
		function disconnAll(){
			var sel1 = document.getElementById('columns_sel1');
			var sel3 = document.getElementById('columns_sel3');
			var i, insertIdx = sel1.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel1.options.length;
			}
			for(i=0; i<sel3.options.length;) {
				var opt = sel3.options[i];
				opt.selected = false;
				sel1.options.add(opt, insertIdx++);
			}
		}
		
		function blacklistAll(){
			var sel3 = document.getElementById('columns_sel3');
			var sel4 = document.getElementById('columns_sel4');
			var i, insertIdx = sel4.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel4.options.length;
			}
			for(i=0; i<sel3.options.length;) {
				var opt = sel3.options[i];
				opt.selected = false;
				sel4.options.add(opt, insertIdx++);
			}
		}
		
		function whitelistAll(){
			var sel3 = document.getElementById('columns_sel3');
			var sel4 = document.getElementById('columns_sel4');
			var i, insertIdx = sel3.selectedIndex;
			if(insertIdx < 0) {
				insertIdx = sel3.options.length;
			}
			for(i=0; i<sel4.options.length;) {
				var opt = sel4.options[i];
				opt.selected = false;
				sel3.options.add(opt, insertIdx++);
			}
		}
		
		function formSelectedBeforeSubmit(){
			/* var sel2 = document.getElementById('columns_sel2');
			var i;
			for(i=0; i<sel2.options.length;) {
				var opt = sel2.options[i];
				opt.selected = true;
				i++;
			} */
			
			var sel3 = document.getElementById('columns_sel3');
			var j;
			for(j=0; j<sel3.options.length;) {
				var opt = sel3.options[j];
				opt.selected = true;
				j++;
			}
			
			var sel4 = document.getElementById('columns_sel4');
			var k;
			for(k=0; k<sel4.options.length;) {
				var opt = sel4.options[k];
				opt.selected = true;
				k++;
			}
			
			$('#accnRelationshipForm').submit();
		}

		</script>
	
</body>
</html>