

<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Details</title>

<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/resources/core/js/jquery-3.1.1.min.js" var="jqueryJs" />
<spring:url value="/resources/core/js/jquery.dataTables.min.js" var="dataTablejqueryJs" />
<spring:url value="/resources/core/js/dataTables.select.min.js"	var="selectDataTablejqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${dataTablejqueryJs}"></script>
<script src="${selectDataTablejqueryJs}"></script>
</head>

<body>
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home">Home</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/index">Contacts</a></li>
			<li class="active"><a href="/indexgroup">Groups</a></li>
		</ul>
	</div>
	</nav>
	
	
	<div class="container"
		style="min-height: 500px; padding: 25px 50px 75px 100px">
		<div class="starter-template">
			<h1>Group Details</h1>
			<br>
			<div class="container" style="min-height: 250px; padding-top: 25px">
				<div class="starter-template">
					<table id="example" class="table table-bordered table-hover table-striped" style="padding-top: 15px" cellspacing="10" width="100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Phone</th>
								<th>Email</th>
								<th>Street</th>
								<th>City</th>
								<th>State</th>
								<th>ZIP Code</th>
								<th>Country</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			
			<div id = "contactsadddiv" class="container" style="padding: 25px">
				<div class="starter-template" style = "background: #E6EAF1;">
				<div id = headcontact; style="padding:10px">
			<h2>Add contacts to group</h2>
			</div>	
				<table id="contactsaddtable" class="table table-bordered table-hover" style="padding-top: 15px" cellspacing="10" width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Street</th>
							<th>City</th>
							<th>State</th>
							<th>ZIP Code</th>
							<th>Country</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
				jQuery(document).ready(function($) {
							var currentGroup;
							var unusedContacts = [];
							
							//to retrieve the group id from the url
							var qsParm = new Array();
							var query = window.location.search.substring(1);
							var parms = query.split('&');
							for (var i = 0; i < parms.length; i++) {
								var pos = parms[i].indexOf('=');
								if (pos > 0) {
									var key = parms[i].substring(0, pos);
									var val = parms[i].substring(pos + 1);
									qsParm[key] = val;
								}
							}
							var idPassed = parseInt(qsParm[key]);

							//to display the contacts in the group
							$.ajax({
								
								//to retrieve current group
								type : "GET",
								contentType : "application/json",
								url : "http://localhost:8080/groups/" + idPassed,
								dataType : 'json',
								timeout : 100000,
								success : function(data) {
									currentGroup = data;
									console.log("SUCCESS: ", data);
									$('#example').dataTable({
										"processing" : true,
										
										//extract the contact details alone from the current group
										"aaData" : data.contact,
										"columns" : [{
											"data" : "id"
										}, {
											"data" : "name"
										}, {
											"data" : "phoneNumber"
										}, {
											"data" : "street"
										}, {
											"data" : "city"
										}, {
											"data" : "state"
										}, {
											"data" : "zip"
										}, {
											"data" : "country"
										}, {
											"data" : "email"
										},{
											"defaultContent": '<button id="btn-remove" class = "btn-primary" type="button" type="button" style="margin : 5px">Remove from group</button>'
										}]
									});
									
									//retrieve all the contacts
									$.ajax({
										type : "GET",
										contentType : "application/json",
										url : "http://localhost:8080/contacts",
										dataType : 'json',
										timeout : 100000,
										success : function(data) {
											
											//generate contacts not used in the current group
											generateUnusedContacts (data);
											console.log("SUCCESS: ", data);
											$('#contactsaddtable').dataTable({
												"processing" : true,
												"aaData" : unusedContacts,
												"columns" : [{
													"data" : "id"
												}, {
													"data" : "name"
												}, {
													"data" : "phoneNumber"
												},{
													"data" : "street"
												}, {
													"data" : "city"
												}, {
													"data" : "state"
												}, {
													"data" : "zip"
												}, {
													"data" : "country"
												}, {
													"data" : "email"
												},{
												
												"defaultContent": '<button id="btn-add" class = "btn-primary" type="button" type="button" style="margin : 5px">Add to group</button>'
												}]
											});
										},
										error : function(e) {
											console.log("ERROR: ", e);
											display(e);
										},
										done : function(e) {
											console.log("DONE");
											enableSearchButton(true);
										}
									});
								},
								error : function(e) {
									console.log("ERROR: ", e);
									display(e);
								},
								done : function(e) {
									console.log("DONE");
									enableSearchButton(true);
								}
							});
							
							

						//delete contact from group
						$('#example tbody').on( 'click', '#btn-remove', function () {
						
									var contact = $('#example').DataTable().row( $(this).parents('tr') ).data();
        							var contactId = contact.id;
        							var contactRowSelected = $('#example').DataTable().row( $(this).parents('tr') );
        							var groupid = idPassed;
        							
        							//get call to retrieve the current group
									$.ajax({
										type : "GET",
										contentType : "application/json",
										url : "http://localhost:8080/groups/"+ idPassed,
										dataType : 'json',
										timeout : 100000,
										success : function(group) {
										
										//to remove the contact from group json object
										for (var i = 0; i < group.contact.length; i++) {
        									var cur = group.contact[i];
        									if (cur.id == contactId) {
           										 group.contact.splice(i, 1);
           										 break;
        									}
    									}
    									
										currentGroup = group;
    								
										//update group table with the new group object
										$.ajax({
													type : "PUT",
													contentType : "application/json",
													url : "http://localhost:8080/groups/"+ idPassed,
													data : JSON.stringify(group),
													timeout : 100000,
													success : function(data) {
															console.log("SUCCESS: ", data);
															contactRowSelected.remove().draw(false);
															
															//to redraw data table
															var $t = $('#contactsaddtable').DataTable();
															$t.row.add(contact).draw();
													},
													error : function(e) {
															console.log("ERROR: ", e);
													},
													done : function(e) {
															console.log("DONE");
															enableSearchButton(true);
													}
												}); 
										},
										error : function(e) {
											console.log("ERROR: ", e);
										},
										done : function(e) {
											console.log("DONE");
											enableSearchButton(true);
										}
									}); 
							});
						
						
							//to add a contact to the group
							 $('#contactsaddtable tbody').on( 'click', '#btn-add', function () {
        							var contact = $('#contactsaddtable').DataTable().row( $(this).parents('tr') ).data();
        							var rowSelected = $('#contactsaddtable').DataTable().row( $(this).parents('tr') );
        							
									//to enable selection of rows
									if ($(this).hasClass('selected')) {
										$(this).removeClass('selected');
									}
									else {
										$('#contactsaddtable').DataTable().$('tr.selected').removeClass('selected');
										$(this).addClass('selected');
									}
									
        							var groupid = idPassed;
        							
        							//retrieve the group with corresponding id
									$.ajax({
										type : "GET",
										contentType : "application/json",
										url : "http://localhost:8080/groups/"+ idPassed,
										dataType : 'json',
										timeout : 100000,
										success : function(group) {
											
											//add new contact to the group json object
											group.contact.push(contact);
											currentGroup = group;
											
											//update the group info in the database
											$.ajax({
													type : "PUT",
													contentType : "application/json",
													url : "http://localhost:8080/groups/"+ idPassed,
													data : JSON.stringify(group),
													timeout : 100000,
													success : function(data) {
															console.log("SUCCESS: ", data);
															rowSelected.remove().draw(false);
															
															//to redraw datatable
															var $t = $('#example').DataTable();
															$t.row.add(contact).draw();
													},
													error : function(e) {
															console.log("ERROR: ", e);
													},
													done : function(e) {
															console.log("DONE");
															enableSearchButton(true);
													}
												});
										},
										error : function(e) {
											console.log("ERROR: ", e);
										},
										done : function(e) {
											console.log("DONE");
											enableSearchButton(true);
										}
									}); 
   							 } );

						
							//to generate the contacts that are not member of the current gropup
							function generateUnusedContacts (allContacts) {
								var length = allContacts.length;
								var flag = false;
								for (var i = 0; i < length; i++) {
									for (var j = 0; j < currentGroup.contact.length; j++) {
											if (allContacts[i].id == currentGroup.contact[j].id) {
												flag = true;
												break;
											}
									}
									if (flag == false)
										unusedContacts.push(allContacts[i]);
									flag = false;
								}
							}
						}); 

			</script>
</body>
</html>