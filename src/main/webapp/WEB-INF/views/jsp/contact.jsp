<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Page</title>

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
			<li class="active"><a href="/index">Contacts</a></li>
			<li><a href="/indexgroup">Groups</a></li>
		</ul>
	</div>
	</nav>
	
	<div class="container" style="min-height: 500px; padding: 25px 50px 75px 100px">
		<div class="starter-template">
			<h1>Contacts</h1>
			<br>
			<div id="addgroup" style="padding-top: 25px"></div>
			<form class="form-horizontal" id="add-edit-form">
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Name</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="contactname" required>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-5">
						<input type=number class="form-control" id="contactphone" required>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-5">
						<input type=email class="form-control" id="contactemail">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Address: Street</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="contactstreet">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">City</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="contactcity">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">State</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="contactstate">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">ZIP Code</label>
					<div class="col-sm-5">
						<input type=number class="form-control" id="contactzip">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Country</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="contactcountry">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" id="add" class="btn btn-primary btn-lg">Submit</button>
					</div>
				</div>
			</form>


			<div id="editgroup" style="padding-top: 25px" style = "background: #E6EAF1;">
				<form class="form-horizontal" id="edit-form">
					<div class="form-group form-group-lg">
						<label class="col-sm-2 control-label">Name</label>
						<div class="col-sm-5">
							<input type=text class="form-control" id="editcontactname" required>
						</div>
					</div>
					<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Phone</label>
					<div class="col-sm-5">
						<input type=number class="form-control" id="editcontactphone" required>
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-5">
						<input type=email class="form-control" id="editcontactemail">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Address: Street</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="editcontactstreet">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">City</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="editcontactcity">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">State</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="editcontactstate">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">ZIP Code</label>
					<div class="col-sm-5">
						<input type=number class="form-control" id="editcontactzip">
					</div>
				</div>
				<div class="form-group form-group-lg">
					<label class="col-sm-2 control-label">Country</label>
					<div class="col-sm-5">
						<input type=text class="form-control" id="editcontactcountry">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" id="editsubmit" class="btn btn-primary btn-lg" value="Submit">
					</div>
				</div>
			</form>
		</div>
	</div>

		<div id="functiongroup" style="padding: 25px">
			<button type="button" class="btn  btn-primary btn-lg" id="adddisplay">Add New Contact</button>
		</div>

		<div class="container" style="min-height: 500px; padding-top: 25px">
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
</div>

		<script type="text/javascript">
			jQuery(document).ready(function($) {
						$('#add-edit-form').hide();
						$('#edit-form').hide();
						var contactEditId;
						
						//get call to display all the data in contacts table
						$.ajax({
							type : "GET",
							contentType : "application/json",
							url : "http://localhost:8080/contacts",
							dataType : 'json',
							timeout : 100000,
							success : function(data) {
								console.log("SUCCESS: ", data);
								$('#example').dataTable({
									"processing" : true,
									"aaData" : data,
									"columns" : [ {
										"data" : "id"
									}, {
										"data" : "name"
									}, {
										"data" : "phoneNumber"
									}, {
										"data" : "email"
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
									} ,{
										"defaultContent": 
          			 					'<button id="btn-edit" class = "btn-primary" type="button" type="button" style="margin : 5px">Edit</button>'
           							+ '<button id="btn-delete"  class = "btn-primary" type="button" type="button" style="margin : 5px">Delete</button>'
									}
									]
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

						//function to add new contact
						$("#add-edit-form").submit(function(event) {
							var contact = {};
							contact["name"] = $("#contactname").val();
							contact["phoneNumber"] = $("#contactphone").val();
							contact["email"] = $("#contactemail").val();
							contact["street"] = $("#contactstreet").val();
							contact["city"] = $("#contactcity").val();
							contact["state"] = $("#contactstate").val();
							contact["zip"] = $("#contactzip").val();
							contact["country"] = $("#contactcountry").val();

							//post call to add new values to contacts table
							$.ajax({
								type : "POST",
								contentType : "application/json",
								url : "http://localhost:8080/contacts", 
								data : JSON.stringify(contact),
								dataType : 'json',
								timeout : 100000,
								async : false,
								success : function(data) {
									console.log("SUCCESS: ", data);
									//to redraw contacts table
									var $t = $('#example').DataTable();
									$t.row.add(data).draw();
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
						}); 

						
						//to highlight rows when selected
						$('#example tbody').on('click','tr',function() {
									$('#example').dataTable.$('tr.info').removeClass('info');
									$(this).addClass("info");
									if ($(this).hasClass('selected')) {
										$(this).removeClass('selected');
									} else {
										$('#example').DataTable().$('tr.selected').removeClass('selected');
										$(this).addClass('selected');
									}
								});

						//to display respective forms when add contact is clicked
						$('#adddisplay').click(function() {
							$('#edit-form').hide();
							$('#add-edit-form').show();
						});

						
						//to set the values in edit form 
					 	$('#example tbody').on('click', '#btn-edit', function (e)  {
							$("#add-edit-form").hide();
							$("#edit-form").fadeIn();
							
							contactEditId = $('#example').DataTable().row($(this).parents('tr')).data().id;
							$("#editcontactname").val($('#example').DataTable().row($(this).parents('tr')).data().name);
							$("#editcontactphone").val($('#example').DataTable().row($(this).parents('tr')).data().phoneNumber);
							$("#editcontactemail").val($('#example').DataTable().row($(this).parents('tr')).data().email);
							$("#editcontactstreet").val($('#example').DataTable().row($(this).parents('tr')).data().street);
							$("#editcontactcity").val($('#example').DataTable().row($(this).parents('tr')).data().city);
							$("#editcontactstate").val($('#example').DataTable().row($(this).parents('tr')).data().state);
							$("#editcontactzip").val($('#example').DataTable().row($(this).parents('tr')).data().zip);
							$("#editcontactcountry").val($('#example').DataTable().row($(this).parents('tr')).data().country);
						});
						
					 
					 //submit the new values
					 $('#editsubmit').click(function() {
									var id = contactEditId;
									var contact = {};
									contact["id"] = id;
									contact["name"] = $("#editcontactname").val();
									contact["phoneNumber"] = $("#editcontactphone").val();
									contact["email"] = $("#editcontactemail").val();
									contact["street"] = $("#editcontactstreet").val();
									contact["city"] = $("#editcontactcity").val();
									contact["state"] = $("#editcontactstate").val();
									contact["zip"] = $("#editcontactzip").val();
									contact["country"] = $("#editcontactcountry").val();
								
								//put call is made only if the values entered is not null
								if($("#editcontactname").val() && $("#editcontactphone").val()){
										$("#edit-form").hide();
										$.ajax({
											type : "PUT",
											contentType : "application/json",
											url : "http://localhost:8080/contacts/"+ id,
											data : JSON.stringify(contact),
											timeout : 100000,
											success : function(data) {
												console.log("SUCCESS: ", data);
												//to redraw data table
												var $t = $('#example').DataTable();
												$t.row.add(data).draw();
											},
											error : function(e) {
												console.log("ERROR: ", e);
											},
											done : function(e) {
												console.log("DONE");
												enableSearchButton(true);
											}
										});
									 }
									else{
										alert("Please make sure you have entered name and number..");
									}
								});

						
						//to delete contact
						$('#example tbody').on('click', '#btn-delete', function (e) {
									var id = $('#example').DataTable().row( $(this).parents('tr') ).data().id;
									var checkstr =  confirm('Are you sure you want to delete this?');
									if(checkstr == true){
										$.ajax({
											type : "DELETE",
											contentType : "application/json",
											url : "http://localhost:8080/contacts/"+ id,
											timeout : 100000,
											async : false,
											success : function(data) {
												console.log("SUCCESS: ", data);
											},
											error : function(e) {
												console.log("ERROR: ", e);
											},
											done : function(e) {
												console.log("DONE");
												enableSearchButton(true);
											}
										});
									}
									else{
										return false;
									}

									$('#example').DataTable().row($(this).parents('tr') ).remove().draw(false);
								});
					});
					
		</script>
</body>
</html>